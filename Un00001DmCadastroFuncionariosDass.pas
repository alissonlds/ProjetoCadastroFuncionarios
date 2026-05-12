unit Un00001DmCadastroFuncionariosDass;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, UnCadastroFuncionariosTypes;

type
  TDmCadastroFuncionariosDass = class(TDataModule)
    FdConexaoProjeto: TFDConnection;
    FdLink: TFDPhysFBDriverLink;
    FdTabelaFuncionarios: TFDQuery;
    FdTabelaFuncionariosID: TIntegerField;
    FdTabelaFuncionariosNOME: TStringField;
    FdTabelaFuncionariosCPF: TStringField;
    FdTabelaFuncionariosEMAIL: TStringField;
    FdTabelaFuncionariosTAMANHO_CAMISA: TStringField;
    FdTabelaFuncionariosTAMANHO_CALCADO: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure FdTabelaFuncionariosCPFGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FdTabelaFuncionariosBeforePost(DataSet: TDataSet);
    procedure FdTabelaFuncionariosAfterOpen(DataSet: TDataSet);
    procedure FdTabelaFuncionariosNewRecord(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
    Function ValidouNome(Atexto: String): Boolean;
    Function ValidouCPF(const ACPF: string): Boolean;
    Function ValidouEmail(const AEmail: string): Boolean;
    Function ValidouTamanhoCamisa(const ATam: string): Boolean;
    Function ValidouTamanhoCalcado(const ATam: Integer): Boolean;
    Function ValidouCampoVazio(const Avalor: String): Boolean;
    function BuscouSomenteNumeros(const AValue: string): string;
    Procedure ConsultarFuncionarios(AFiltro: TFiltrosFuncionario);
    Function ValidouCPFExiste(ACPF: String; AIdIgnorar: Integer): Boolean;

  end;

var
  DmCadastroFuncionariosDass: TDmCadastroFuncionariosDass;

implementation

Uses
  Vcl.Dialogs, Vcl.Forms, Winapi.Windows, System.RegularExpressions,
  System.Math, System.StrUtils, System.Character;

{$R *.dfm}

// Limpar String e manter somente números.
function TDmCadastroFuncionariosDass.BuscouSomenteNumeros
  (const AValue: string): string;
var
  LCaractere: Char;
begin
  Result := '';
  for LCaractere in AValue do
  begin
    if LCaractere.IsDigit then
      Result := Result + LCaractere;
  end;
end;

// Método de consulta de dados.
procedure TDmCadastroFuncionariosDass.ConsultarFuncionarios
  (AFiltro: TFiltrosFuncionario);
begin

  FdTabelaFuncionarios.Close;
  FdTabelaFuncionarios.SQL.Text := Format(CSqlConsultaPadrao, [
    { 0 } IfThen(AFiltro.Nome <> Emptystr, Format(CCondicaoNome,
    [AFiltro.Nome]), Emptystr),
    { 1 } IfThen(AFiltro.Cpf <> Emptystr, Format(CCondicaoCpf, [AFiltro.Cpf]),
    Emptystr),
    { 2 } IfThen(AFiltro.Email <> Emptystr, Format(CCondicaoEmail,
    [AFiltro.Email]), Emptystr),
    { 3 } IfThen(AFiltro.TamCamiseta <> Emptystr, Format(CCondicaoTamCamiseta,
    [AFiltro.TamCamiseta]), Emptystr),
    { 4 } IfThen(AFiltro.TamCalcado > 0, Format(CCondicaoTamCalcado,
    [AFiltro.TamCalcado]), Emptystr)]);

  // 3. Executa e envia para o DataSource (que enviará para a Grade)
  try
    FdTabelaFuncionarios.Open;

    IF FdTabelaFuncionarios.IsEmpty then
      Application.MessageBox('Nenhum registro encontrado.', 'Validação',
        MB_OK + MB_ICONEXCLAMATION);
  except
    on E: Exception do
      Application.MessageBox(PChar('Erro na consulta: ' + E.Message),
        'Erro do Sistema', MB_OK + MB_ICONERROR);
  end;

end;

// Criar conexão.
procedure TDmCadastroFuncionariosDass.DataModuleCreate(Sender: TObject);
begin
  Try
    if not FdConexaoProjeto.Connected then
      FdConexaoProjeto.Connected := True;

    FdTabelaFuncionarios.Active := False;
  except
    on E: Exception do
      Application.MessageBox(PChar('Erro ao conectar ao banco de dados: ' +
        E.Message), 'Erro do Sistema', MB_OK + MB_ICONERROR);
  end;
end;

// Gravar caixa alta o nome.

procedure TDmCadastroFuncionariosDass.FdTabelaFuncionariosBeforePost
  (DataSet: TDataSet);
begin
  DataSet.FieldByName('NOME').AsString :=
    UpperCase(DataSet.FieldByName('NOME').AsString);
end;

// Manter ordenação por nome.
procedure TDmCadastroFuncionariosDass.FdTabelaFuncionariosAfterOpen
  (DataSet: TDataSet);
begin
  DmCadastroFuncionariosDass.FdTabelaFuncionarios.IndexFieldNames := 'NOME';
end;

// Formatar CPF.
procedure TDmCadastroFuncionariosDass.FdTabelaFuncionariosCPFGetText
  (Sender: TField; var Text: string; DisplayText: Boolean);
begin

  if Sender.IsNull then
  begin
    Text := '';
    Exit;
  end;

  if DisplayText then
  begin
    Text := Copy(Sender.AsString, 1, 3) + '.' + Copy(Sender.AsString, 4, 3) +
      '.' + Copy(Sender.AsString, 7, 3) + '-' + Copy(Sender.AsString, 10, 2);
  end
  else
  begin
    Text := Sender.AsString;
  end;
End;

procedure TDmCadastroFuncionariosDass.FdTabelaFuncionariosNewRecord
  (DataSet: TDataSet);
begin
  DataSet.FieldByName('ID').AsInteger :=
    DmCadastroFuncionariosDass.FdConexaoProjeto.ExecSQLScalar
    ('SELECT NEXT VALUE FOR GEN_FUNCIONARIOS_ID FROM RDB$DATABASE');
end;

// Validar campos vazios.
function TDmCadastroFuncionariosDass.ValidouCampoVazio
  (const Avalor: String): Boolean;
Var
  LTexto: String;
begin
  LTexto := StringReplace(Avalor, '.', '', [rfReplaceAll]);
  LTexto := StringReplace(LTexto, '-', '', [rfReplaceAll]);
  LTexto := StringReplace(LTexto, '_', '', [rfReplaceAll]);
  LTexto := Trim(LTexto);
  Result := Trim(LTexto) <> Emptystr;
end;

// Validador de CPF.
Function TDmCadastroFuncionariosDass.ValidouCPF(const ACPF: string): Boolean;
var
  LCnpjCpf: string;
  I, LSoma, LDigito1, LDigito2: Integer;
begin
  Result := True;
  LCnpjCpf := '';

  // 1. Limpeza rigorosa: garante que só números entrem na conta
  for I := 1 to Length(ACPF) do
    if CharInSet(ACPF[I], ['0' .. '9']) then
      LCnpjCpf := LCnpjCpf + ACPF[I];

  // 2. Verificação de consistência
  if Length(LCnpjCpf) <> 11 then
    Result := False;
  if (LCnpjCpf = '00000000000') or (LCnpjCpf = '11111111111') then
    Result := False;

  try
    IF Result then
    Begin
      LSoma := 0;
      for I := 1 to 9 do
        // Peso cresce (I+1) enquanto a posição do CPF decresce (10-I)
        inc(LSoma, StrToInt(Copy(LCnpjCpf, 10 - I, 1)) * (I + 1));

      LDigito1 := 11 - (LSoma mod 11);
      if LDigito1 > 9 then
        LDigito1 := 0;

      // 2° dígito
      LSoma := 0;
      for I := 1 to 10 do
        // Aqui incluímos o 10º dígito (o primeiro que calculamos) na conta
        inc(LSoma, StrToInt(Copy(LCnpjCpf, 11 - I, 1)) * (I + 1));

      LDigito2 := 11 - (LSoma mod 11);
      if LDigito2 > 9 then
        LDigito2 := 0;

      // Comparamos com as posições 10 e 11 do CPF original limpo
      if (IntToStr(LDigito1) <> Copy(LCnpjCpf, 10, 1)) and
        (IntToStr(LDigito2) <> Copy(LCnpjCpf, 11, 1)) then
        Result := False;
    End;
  Finally
    if not Result then
      Application.MessageBox('O CPF informado é inválido.', 'Validação',
        MB_OK + MB_ICONEXCLAMATION);
  end;
end;

// Valida Cpf Existente.
function TDmCadastroFuncionariosDass.ValidouCPFExiste(ACPF: String;
  AIdIgnorar: Integer): Boolean;
begin
  ACPF := StringReplace(ACPF, '.', '', [rfReplaceAll]);
  ACPF := StringReplace(ACPF, '-', '', [rfReplaceAll]);

  if ACPF.Trim.IsEmpty then
    Exit(False);

  // Executa a consulta
  Result := FdConexaoProjeto.ExecSQLScalar
    ('SELECT COUNT(*) FROM FUNCIONARIOS WHERE CPF = :CPF AND ID <> :ID',
    [ACPF, AIdIgnorar]) > 0;
end;

// Validador e-mail.
function TDmCadastroFuncionariosDass.ValidouEmail(const AEmail: string)
  : Boolean;
const
  CCaracteresEmail = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
begin
  Result := True;

  IF AEmail = Emptystr then
    Exit;

  Result := TRegEx.IsMatch(AEmail, CCaracteresEmail);

  IF Not Result Then
    Application.MessageBox('O e-mail não é válido.', 'Validação',
      MB_OK + MB_ICONEXCLAMATION);
end;

// Validador Nome.
function TDmCadastroFuncionariosDass.ValidouNome(Atexto: String): Boolean;
begin
  Result := True;
  IF Not ValidouCampoVazio(Atexto) Then
  Begin
    Result := False;
    Application.MessageBox('O nome é obrigatório.', 'Validação',
      MB_OK + MB_ICONEXCLAMATION);
  End;
end;

// Validador tamanho do calçado.
function TDmCadastroFuncionariosDass.ValidouTamanhoCalcado
  (const ATam: Integer): Boolean;
begin
  Result := True;
  if (ATam < 10) or (ATam > 60) then
  begin
    Result := False;
    Application.MessageBox
      ('Tamanho de calçado inválido. Informe um valor entre 10 e 60.',
      'Validação', MB_OK + MB_ICONEXCLAMATION);
  end;
end;

// Validador tamanho da camisa.
function TDmCadastroFuncionariosDass.ValidouTamanhoCamisa
  (const ATam: string): Boolean;
begin
  Result := True;
  IF Not ValidouCampoVazio(ATam) Then
  Begin
    Result := False;
    Application.MessageBox('O tamanho de camisa é obrigatório.', 'Validação',
      MB_OK + MB_ICONEXCLAMATION);
  End;
end;

end.
