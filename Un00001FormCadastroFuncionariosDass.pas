unit Un00001FormCadastroFuncionariosDass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList;

type
  TFormCadastroFuncionariosDass = class(TForm)
    DsFuncionarios: TDataSource;
    TPPaginaControle: TPageControl;
    TsAbaListagem: TTabSheet;
    TsAbaCadastro: TTabSheet;
    DbGridFuncionarios: TDBGrid;
    TpPainelPesquisa: TPanel;
    edtNome: TEdit;
    TcbTamanhoCamisa: TComboBox;
    LblNome: TLabel;
    LblCpf: TLabel;
    LblTamCamisa: TLabel;
    LblTamCalcado: TLabel;
    EdtTamCalcado: TEdit;
    LblEmail: TLabel;
    EdtEmail: TEdit;
    EdtCpf: TMaskEdit;
    TpPainelCadastro: TPanel;
    TpPainelAcoes: TPanel;
    BtnNovo: TSpeedButton;
    BtnEditar: TSpeedButton;
    BtnSalvar: TSpeedButton;
    BtnCancelar: TSpeedButton;
    BtnExcluir: TSpeedButton;
    TiListaImagens: TImageList;
    BtnPesquisar: TBitBtn;
    ActionList1: TActionList;
    ActNovo: TAction;
    ActEditar: TAction;
    ActCancelar: TAction;
    ActExcluir: TAction;
    ActSalvar: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GenericExit(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure DsFuncionariosStateChange(Sender: TObject);
    procedure ActNovoExecute(Sender: TObject);
    procedure ActEditarExecute(Sender: TObject);
    procedure ActCancelarExecute(Sender: TObject);
    procedure ActExcluirExecute(Sender: TObject);

  private
    { Private declarations }
    procedure ValidarCampos(AControl: TControl = nil);
    Procedure ExecutarConsulta;
    Procedure AtualizarBotoes;
  public
    { Public declarations }

  end;

var
  FormCadastroFuncionariosDass: TFormCadastroFuncionariosDass;

implementation

{$R *.dfm}

uses Un00001DmCadastroFuncionariosDass, UnCadastroFuncionariosTypes;

// Validará apenas o campo que o usuário acaba de sair.
procedure TFormCadastroFuncionariosDass.GenericExit(Sender: TObject);
begin
  if (Sender is TControl) then
    ValidarCampos(TControl(Sender));
end;

procedure TFormCadastroFuncionariosDass.ActCancelarExecute(Sender: TObject);
begin
  Dm00001CadastroFuncionariosDass.FdTabelaFuncionarios.Cancel;
  TPPaginaControle.ActivePage := TsAbaListagem;
end;

procedure TFormCadastroFuncionariosDass.ActEditarExecute(Sender: TObject);
begin
  if not Dm00001CadastroFuncionariosDass.FdTabelaFuncionarios.IsEmpty then
  begin
    Dm00001CadastroFuncionariosDass.FdTabelaFuncionarios.Edit;
    // Libera edição do registro selecionado
    TPPaginaControle.ActivePage := TsAbaCadastro; // Vai para aba de cadastro
    // dbeNome.SetFocus;
  end;
end;

procedure TFormCadastroFuncionariosDass.ActExcluirExecute(Sender: TObject);
begin

  if Dm00001CadastroFuncionariosDass.FdTabelaFuncionarios.IsEmpty then
    Exit;

  if Application.MessageBox('Deseja realmente excluir?', 'Confirmação',
    MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    Dm00001CadastroFuncionariosDass.FdTabelaFuncionarios.Delete;
    Dm00001CadastroFuncionariosDass.FdTabelaFuncionarios.ApplyUpdates(0);
  end;
end;

procedure TFormCadastroFuncionariosDass.ActNovoExecute(Sender: TObject);
begin

  IF Not Dm00001CadastroFuncionariosDass.FdTabelaFuncionarios.Active then
    Dm00001CadastroFuncionariosDass.FdTabelaFuncionarios.Open;

  Dm00001CadastroFuncionariosDass.FdTabelaFuncionarios.Append;
  TPPaginaControle.ActivePage := TsAbaCadastro; // Muda para a aba de Cadastro
  // edtNome.SetFocus; // Põe o foco no primeiro campo
  AtualizarBotoes;
end;

procedure TFormCadastroFuncionariosDass.AtualizarBotoes;
var
  EmEdicao: Boolean;

begin

  EmEdicao := Dm00001CadastroFuncionariosDass.FdTabelaFuncionarios.State
    in [dsInsert, dsEdit];

  BtnNovo.Enabled := not EmEdicao;
  BtnEditar.Enabled := (not EmEdicao) and
    (not Dm00001CadastroFuncionariosDass.FdTabelaFuncionarios.IsEmpty);
  BtnExcluir.Enabled := (not EmEdicao) and
    (not Dm00001CadastroFuncionariosDass.FdTabelaFuncionarios.IsEmpty);

  BtnSalvar.Enabled := EmEdicao;
  BtnCancelar.Enabled := EmEdicao;

  // Extra: Bloquear as abas para o usuário não fugir sem salvar
  // Isso desabilita a troca de abas enquanto estiver editando
  // TabListagem.TabVisible := not EmEdicao;
end;

procedure TFormCadastroFuncionariosDass.BtnPesquisarClick(Sender: TObject);
begin
  ExecutarConsulta;
end;

procedure TFormCadastroFuncionariosDass.DsFuncionariosStateChange
  (Sender: TObject);
begin
  AtualizarBotoes;
end;

procedure TFormCadastroFuncionariosDass.ExecutarConsulta;
Var
  LFiltrosFuncionarios: TFiltrosFuncionario;
begin
  LFiltrosFuncionarios := Default (TFiltrosFuncionario);
  LFiltrosFuncionarios.Nome := edtNome.Text;
  LFiltrosFuncionarios.Cpf := Dm00001CadastroFuncionariosDass.
    BuscouSomenteNumeros(EdtCpf.Text);
  LFiltrosFuncionarios.Email := EdtEmail.Text;
  LFiltrosFuncionarios.TamCamiseta := TcbTamanhoCamisa.Text;
  LFiltrosFuncionarios.TamCalcado := StrToIntDef(EdtTamCalcado.Text, 0);
  Dm00001CadastroFuncionariosDass.ConsultarFuncionarios(LFiltrosFuncionarios);
end;

procedure TFormCadastroFuncionariosDass.FormCreate(Sender: TObject);
begin
  if Assigned(Dm00001CadastroFuncionariosDass) then
  begin
    DsFuncionarios.DataSet := Dm00001CadastroFuncionariosDass.
      FdTabelaFuncionarios;
  end;
end;

// Evento para pular para próximo componente ao dar ENTER.
procedure TFormCadastroFuncionariosDass.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN, VK_DOWN:
      begin
        SelectNext(ActiveControl, True, True);
        Key := 0;
      end;
    VK_UP:
      begin
        SelectNext(ActiveControl, False, True);
        Key := 0;
      end;
  end;
end;

procedure TFormCadastroFuncionariosDass.FormShow(Sender: TObject);
begin
  edtNome.SetFocus;
end;

// Método validador dos campos
procedure TFormCadastroFuncionariosDass.ValidarCampos(AControl: TControl);
begin

  if (AControl = nil) or (AControl = edtNome) then
  begin
    // IF not Dm00001CadastroFuncionariosDass.ValidouNome(edtNome.Text) Then
    // edtNome.SetFocus;
  end;

  if (AControl = nil) or (AControl = EdtCpf) then
  begin
    if not Dm00001CadastroFuncionariosDass.ValidouCPF(EdtCpf.Text) then
      EdtCpf.SetFocus;
  end;

  if (AControl = nil) or (AControl = EdtEmail) then
  begin
    if not Dm00001CadastroFuncionariosDass.ValidouEmail(EdtEmail.Text) then
      EdtEmail.SetFocus;
  end;

  if (AControl = nil) or (AControl = TcbTamanhoCamisa) then
  begin
    // if NOt Dm00001CadastroFuncionariosDass.ValidouTamanhoCamisa
    // (TcbTamanhoCamisa.Text) then
    // TcbTamanhoCamisa.SetFocus;
  end;

  if (AControl = nil) or (AControl = EdtTamCalcado) then
  begin
    // if NOt Dm00001CadastroFuncionariosDass.ValidouTamanhoCalcado
    // (StrToIntDef(EdtTamCalcado.Text, 0)) Then
    // EdtTamCalcado.SetFocus;
  end;
end;

end.
