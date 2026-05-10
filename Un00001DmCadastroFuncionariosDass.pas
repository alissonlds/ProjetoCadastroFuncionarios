unit Un00001DmCadastroFuncionariosDass;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDm00001CadastroFuncionariosDass = class(TDataModule)
    FdConexaoProjeto: TFDConnection;
    FdLink: TFDPhysFBDriverLink;
    FdTabelaFuncionarios: TFDTable;
    FdTabelaFuncionariosID: TIntegerField;
    FdTabelaFuncionariosNOME: TStringField;
    FdTabelaFuncionariosCPF: TStringField;
    FdTabelaFuncionariosEMAIL: TStringField;
    FdTabelaFuncionariosTAMANHO_CAMISA: TStringField;
    FdTabelaFuncionariosTAMANHO_CALCADO: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    Function ValidouNome(Atexto: String): Boolean;
    Function ValidouCPF(const ACPF: string): Boolean;
    Function ValidouEmail(const AEmail: string): Boolean;
    Function ValidouTamanhoCamisa(const ATam: string): Boolean;
    Function ValidouTamanhoCalcado(const ATam: Integer): Boolean;

  end;

var
  Dm00001CadastroFuncionariosDass: TDm00001CadastroFuncionariosDass;

implementation

Uses
  Vcl.Dialogs, Vcl.Forms, Winapi.Windows, System.RegularExpressions;

{$R *.dfm}

procedure TDm00001CadastroFuncionariosDass.DataModuleCreate(Sender: TObject);
begin
  //
end;

function TDm00001CadastroFuncionariosDass.ValidouCPF
  (const ACPF: string): Boolean;
var
  sLimpo: string;
  d1, d2, i, erro: Integer;
  n1, n2, n3, n4, n5, n6, n7, n8, n9: Integer;
begin

  Result := True;
  sLimpo := '';
  for i := 1 to Length(ACPF) do
    if CharInSet(ACPF[i], ['0' .. '9']) then
      sLimpo := sLimpo + ACPF[i];

  IF (sLimpo = '') then
  Begin
    Application.MessageBox('O CPF é obrigatório.', 'Validação',
      MB_OK + MB_ICONERROR);
    Result := False;
    Exit;
  End;

  // Verifica tamanho e sequências repetidas óbvias
  if (Length(sLimpo) <> 11) or (sLimpo = '00000000000') or
    (sLimpo = '11111111111') then
    Result := False;

  IF Result Then
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
      MB_OK + MB_ICONERROR);
end;

function TDm00001CadastroFuncionariosDass.ValidouEmail
  (const AEmail: string): Boolean;
const
  // Caracteres padrão para validar estrutura de e-mail (usuario@dominio.com...)
  CCaracteresEmail = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
begin
  Result := True;
  IF AEmail = '' Then
  Begin
    Application.MessageBox('O e-mail é obrigatório.', 'Validação',
      MB_OK + MB_ICONERROR);
    Result := False;
    Exit;
  End;
  Result := TRegEx.IsMatch(AEmail, CCaracteresEmail);

  IF Not Result Then
    Application.MessageBox('O e-mail não é válido.', 'Validação',
      MB_OK + MB_ICONERROR);
end;

function TDm00001CadastroFuncionariosDass.ValidouNome(Atexto: String): Boolean;
begin
  Result := True;
  IF Atexto = '' Then
  Begin
    Result := False;
    Application.MessageBox('O nome é obrigatório.', 'Validação',
      MB_OK + MB_ICONERROR);
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
      'Validação', MB_OK + MB_ICONERROR);
  end;
end;

function TDm00001CadastroFuncionariosDass.ValidouTamanhoCamisa
  (const ATam: string): Boolean;
begin
  Result := True;
  IF ATam = '' Then
  Begin
    Result := False;
    Application.MessageBox('O tamanho de camisa é obrigatório.', 'Validação',
      MB_OK + MB_ICONERROR);
  End;

end;

end.
