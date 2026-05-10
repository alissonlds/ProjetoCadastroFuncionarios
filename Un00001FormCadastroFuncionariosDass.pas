unit Un00001FormCadastroFuncionariosDass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, System.ImageList, Vcl.ImgList;

type
  TFormCadastroFuncionariosDass = class(TForm)
    DsFuncionarios: TDataSource;
    TPPaginaControle: TPageControl;
    TsAbaListagem: TTabSheet;
    TsAbaCadastro: TTabSheet;
    DbGridFuncionarios: TDBGrid;
    TpPainelPesquisa: TPanel;
    edtNome: TEdit;
    TbBotaoPesquisar: TButton;
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
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GenericExit(Sender: TObject);
    procedure TbBotaoPesquisarClick(Sender: TObject);

  private
    { Private declarations }
    procedure ValidarCampos(AControl: TControl = nil);
    Procedure ExecutarConsulta;
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

procedure TFormCadastroFuncionariosDass.TbBotaoPesquisarClick(Sender: TObject);
begin
  ExecutarConsulta;
end;

procedure TFormCadastroFuncionariosDass.ExecutarConsulta;
Var
  LFiltrosFuncionarios: TFiltrosFuncionario;
begin
  LFiltrosFuncionarios := Default (TFiltrosFuncionario);
  LFiltrosFuncionarios.Nome := edtNome.Text;
  LFiltrosFuncionarios.Cpf := Dm00001CadastroFuncionariosDass.BuscouSomenteNumeros(EdtCpf.Text);
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
