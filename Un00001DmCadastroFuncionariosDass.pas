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
  TDm00001CadastroFuncionariosDass = class(TDataModule)
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

  end;

var
  Dm00001CadastroFuncionariosDass: TDm00001CadastroFuncionariosDass;

implementation

Uses
  Vcl.Dialogs, Vcl.Forms, Winapi.Windows, System.RegularExpressions,
  System.Math, System.StrUtils, System.Character;

{$R *.dfm}

function TDm00001CadastroFuncionariosDass.BuscouSomenteNumeros
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

procedure TDm00001CadastroFuncionariosDass.ConsultarFuncionarios
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
      raise Exception.Create('Erro na consulta: ' + E.Message);
  end;

end;

procedure TDm00001CadastroFuncionariosDass.DataModuleCreate(Sender: TObject);
begin
  Try
    if not FdConexaoProjeto.Connected then
      FdConexaoProjeto.Connected := True;

    FdTabelaFuncionarios.Close;
  except
    on E: Exception do
      raise Exception.Create('Erro ao conectar ao banco de dados: ' +
        E.Message);
  end;
end;

procedure TDm00001CadastroFuncionariosDass.FdTabelaFuncionariosCPFGetText
  (Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (not Sender.IsNull) and (Length(Sender.AsString) = 11) then
  begin
    Text := Copy(Sender.AsString, 1, 3) + '.' + Copy(Sender.AsString, 4, 3) +
      '.' + Copy(Sender.AsString, 7, 3) + '-' + Copy(Sender.AsString, 10, 2);
  end
  else
    Text := Sender.AsString;
end;

function TDm00001CadastroFuncionariosDass.ValidouCampoVazio
  (const Avalor: String): Boolean;
begin
  Result := Trim(Avalor) <> Emptystr;
end;

function TDm00001CadastroFuncionariosDass.ValidouCPF
  (const ACPF: string): Boolean;
var
  sLimpo: string;
  d1, d2, i, erro: Integer;
  n1, n2, n3, n4, n5, n6, n7, n8, n9: Integer;
begin

  Result := True;
  sLimpo := Emptystr;
  for i := 1 to Length(ACPF) do
    if CharInSet(ACPF[i], ['0' .. '9']) then
      sLimpo := sLimpo + ACPF[i];

  // IF (sLimpo = '') then
  // Begin
  // Application.MessageBox('O CPF é obrigatório.', 'Validação',
  // MB_OK + MB_ICONERROR);
  // Result := False;
  // Exit;
  // End;

  // Verifica tamanho e sequências repetidas óbvias
  if ((Length(sLimpo) <> 11) AND (sLimpo <> Emptystr)) or
    (sLimpo = '00000000000') or (sLimpo = '11111111111') then
    Result := False;

  IF (Result) AND (sLimpo <> Emptystr) Then
  Begin
    // Cálculo do 1º dígito
    n1 := StrToInt(sLimpo[1]);
    n2 := StrToInt(sLimpo[2]);
    n3 := StrToInt(sLimpo[3]);
    n4 := StrToInt(sLimpo[4]);
    n5 := StrToInt(sLimpo[5]);
    n6 := StrToInt(sLimpo[6]);
    n7 := StrToInt(sLimpo[7]);
    n8 := StrToInt(sLimpo[8]);
    n9 := StrToInt(sLimpo[9]);

    d1 := 11 - ((n1 * 10 + n2 * 9 + n3 * 8 + n4 * 7 + n5 * 6 + n6 * 5 + n7 * 4 +
      n8 * 3 + n9 * 2) mod 11);
    if d1 >= 10 then
      d1 := 0;

    // Cálculo do 2º dígito
    d2 := 11 - ((n1 * 11 + n2 * 10 + n3 * 9 + n4 * 8 + n5 * 7 + n6 * 6 + n7 * 5
      + n8 * 4 + n9 * 3 + d1 * 2) mod 11);
    if d2 >= 10 then
      d2 := 0;

    // Compara com os dígitos digitados
    Result := (IntToStr(d1) = sLimpo[10]) and (IntToStr(d2) = sLimpo[11]);
  End;

  If Not Result Then
    Application.MessageBox('O CPF é inválido.', 'Validação',
      MB_OK + MB_ICONEXCLAMATION);
end;

function TDm00001CadastroFuncionariosDass.ValidouEmail
  (const AEmail: string): Boolean;
const
  // Caracteres padrão para validar estrutura de e-mail (usuario@dominio.com...)
  CCaracteresEmail = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
begin
  Result := True;
  //
  // IF AEmail = '' Then
  // Begin
  // Application.MessageBox('O e-mail é obrigatório.', 'Validação',
  // MB_OK + MB_ICONERROR);
  // Result := False;
  // Exit;
  // End;
  IF AEmail = Emptystr then
    Exit;

  Result := TRegEx.IsMatch(AEmail, CCaracteresEmail);

  IF Not Result Then
    Application.MessageBox('O e-mail não é válido.', 'Validação',
      MB_OK + MB_ICONEXCLAMATION);
end;

function TDm00001CadastroFuncionariosDass.ValidouNome(Atexto: String): Boolean;
begin
  Result := True;
  IF Not ValidouCampoVazio(Atexto) Then
  Begin
    Result := False;
    Application.MessageBox('O nome é obrigatório.', 'Validação',
      MB_OK + MB_ICONEXCLAMATION);
  End;
end;

function TDm00001CadastroFuncionariosDass.ValidouTamanhoCalcado
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

function TDm00001CadastroFuncionariosDass.ValidouTamanhoCamisa
  (const ATam: string): Boolean;
begin
  Result := True;
  IF ATam = Emptystr Then
  Begin
    Result := False;
    Application.MessageBox('O tamanho de camisa é obrigatório.', 'Validação',
      MB_OK + MB_ICONEXCLAMATION);
  End;

end;

end.
