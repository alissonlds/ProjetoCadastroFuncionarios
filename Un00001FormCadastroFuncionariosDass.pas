unit Un00001FormCadastroFuncionariosDass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.DBCtrls;

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
    LblNomeDb: TLabel;
    LblCpfDb: TLabel;
    LblEmailDb: TLabel;
    LblTamCamisaDb: TLabel;
    LblTamCalcadoDb: TLabel;
    TdbTamCalcado: TDBEdit;
    TdbTamanhoCamisa: TDBComboBox;
    TdbEmail: TDBEdit;
    TdbCpf: TDBEdit;
    TdbNome: TDBEdit;
    GbDadosPessoais: TGroupBox;
    GbMedidasUniforme: TGroupBox;
    GbFiltrosPesquisa: TGroupBox;
    TpPainelRegistros: TPanel;
    BtnPrimeiro: TSpeedButton;
    BtnAnterior: TSpeedButton;
    BtnProximo: TSpeedButton;
    BtnUltimo: TSpeedButton;
    ActPrimeiroRegistro: TAction;
    ActUltimoRegistro: TAction;
    ActRegistroAnterior: TAction;
    ActProximoRegistro: TAction;
    TpPainelCentral: TPanel;
    LblContadorFuncionarios: TLabel;
    TpPainelGrid: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GenericExit(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure ActNovoExecute(Sender: TObject);
    procedure ActEditarExecute(Sender: TObject);
    procedure ActCancelarExecute(Sender: TObject);
    procedure ActExcluirExecute(Sender: TObject);
    procedure ActSalvarExecute(Sender: TObject);
    procedure TdbTamCalcadoKeyPress(Sender: TObject; var Key: Char);
    procedure DbGridFuncionariosDblClick(Sender: TObject);
    procedure TdbTamCalcadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbGridFuncionariosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure ActPrimeiroRegistroExecute(Sender: TObject);
    procedure ActUltimoRegistroExecute(Sender: TObject);
    procedure ActRegistroAnteriorExecute(Sender: TObject);
    procedure ActProximoRegistroExecute(Sender: TObject);
    procedure TPPaginaControleChange(Sender: TObject);
    procedure DsFuncionariosDataChange(Sender: TObject; Field: TField);

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

// Chamar salvar no último campo.
procedure TFormCadastroFuncionariosDass.TdbTamCalcadoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
  begin
    Key := 0;
    IF DmCadastroFuncionariosDass.FdTabelaFuncionarios.State
      in [dsInsert, dsEdit] then
      ActSalvarExecute(Nil);
  end;
end;

// Forçar dataset a entrar em edição.
procedure TFormCadastroFuncionariosDass.TdbTamCalcadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if DmCadastroFuncionariosDass.FdTabelaFuncionarios.State = dsBrowse then
    DmCadastroFuncionariosDass.FdTabelaFuncionarios.Edit;

  if not CharInSet(Key, ['0' .. '9', #8, #13]) then
  begin
    Key := #0;
    Beep;
  end;
end;

// Se só trocar aba atualiza botões.
procedure TFormCadastroFuncionariosDass.TPPaginaControleChange(Sender: TObject);
begin
  if DmCadastroFuncionariosDass.FdTabelaFuncionarios.Active then
    AtualizarBotoes;
end;

// Ação cancelar inserção/edição.
procedure TFormCadastroFuncionariosDass.ActCancelarExecute(Sender: TObject);
begin
  DmCadastroFuncionariosDass.FdTabelaFuncionarios.Cancel;
  if not DmCadastroFuncionariosDass.FdTabelaFuncionarios.IsEmpty then
    DmCadastroFuncionariosDass.FdTabelaFuncionarios.First;
  TPPaginaControle.ActivePage := TsAbaListagem;
  DbGridFuncionarios.SetFocus;

end;

// Ação editar registro.
procedure TFormCadastroFuncionariosDass.ActEditarExecute(Sender: TObject);
begin
  if not DmCadastroFuncionariosDass.FdTabelaFuncionarios.IsEmpty then
  begin
    TPPaginaControle.ActivePage := TsAbaCadastro;
    DmCadastroFuncionariosDass.FdTabelaFuncionarios.Edit;
    if TdbNome.CanFocus then
      TdbNome.SetFocus;
  end;
end;

// Ação excluir registro.
procedure TFormCadastroFuncionariosDass.ActExcluirExecute(Sender: TObject);
begin
  Try
    if DmCadastroFuncionariosDass.FdTabelaFuncionarios.IsEmpty then
      Exit;

    if Application.MessageBox('Deseja realmente excluir?', 'Confirmação',
      MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      if not DmCadastroFuncionariosDass.FdConexaoProjeto.InTransaction then
        DmCadastroFuncionariosDass.FdConexaoProjeto.StartTransaction;
      DmCadastroFuncionariosDass.FdTabelaFuncionarios.Delete;
      DmCadastroFuncionariosDass.FdConexaoProjeto.Commit;
    end;
  Except
    on E: Exception do
    begin
      DmCadastroFuncionariosDass.FdConexaoProjeto.Rollback;
      Application.MessageBox(PChar('Erro ao excluir: ' + E.Message),
        'Confirmação', MB_OK + MB_ICONERROR);
    end;
  End;
end;

// Ação novo registro.
procedure TFormCadastroFuncionariosDass.ActNovoExecute(Sender: TObject);
begin

  IF Not DmCadastroFuncionariosDass.FdTabelaFuncionarios.Active then
    DmCadastroFuncionariosDass.FdTabelaFuncionarios.Open;

  IF TPPaginaControle.ActivePage = TsAbaListagem then
    TPPaginaControle.ActivePage := TsAbaCadastro;

  if not(DmCadastroFuncionariosDass.FdTabelaFuncionarios.State in [dsInsert,
    dsEdit]) then
    DmCadastroFuncionariosDass.FdTabelaFuncionarios.Append;

  if TdbNome.CanFocus then
    TdbNome.SetFocus;
end;

// Ação dos botões de registro.
procedure TFormCadastroFuncionariosDass.ActPrimeiroRegistroExecute
  (Sender: TObject);
begin
  DmCadastroFuncionariosDass.FdTabelaFuncionarios.First;
end;

procedure TFormCadastroFuncionariosDass.ActProximoRegistroExecute
  (Sender: TObject);
begin
  DmCadastroFuncionariosDass.FdTabelaFuncionarios.Next;
end;

procedure TFormCadastroFuncionariosDass.ActRegistroAnteriorExecute
  (Sender: TObject);
begin
  DmCadastroFuncionariosDass.FdTabelaFuncionarios.Prior;
end;

procedure TFormCadastroFuncionariosDass.ActUltimoRegistroExecute
  (Sender: TObject);
begin
  DmCadastroFuncionariosDass.FdTabelaFuncionarios.Last;
end;

// Ação salvar registro.
procedure TFormCadastroFuncionariosDass.ActSalvarExecute(Sender: TObject);
begin
  try
    IF Not DmCadastroFuncionariosDass.FdTabelaFuncionarios.Active then
    begin
      Application.MessageBox('Não há dados para serem salvos.', 'Confirmação',
        MB_OK + MB_ICONWARNING);
      Exit;
    end;

    IF DmCadastroFuncionariosDass.FdTabelaFuncionarios.State = dsBrowse then
    Begin
      Application.MessageBox('Nenhum registro sendo inserido ou editado.',
        'Confirmação', MB_OK + MB_ICONWARNING);
      Exit;
    End;

    ValidarCampos(Nil);

    if not DmCadastroFuncionariosDass.FdConexaoProjeto.InTransaction then
      DmCadastroFuncionariosDass.FdConexaoProjeto.StartTransaction;

    DmCadastroFuncionariosDass.FdTabelaFuncionarios.Post;
    DmCadastroFuncionariosDass.FdConexaoProjeto.Commit;

    Application.MessageBox('O cadastro foi atualizado com sucesso.',
      'Confirmação', MB_OK + MB_ICONINFORMATION);

    TPPaginaControle.ActivePage := TsAbaListagem;
    DbGridFuncionarios.SetFocus;

    IF DmCadastroFuncionariosDass.FdTabelaFuncionarios.State
      in [dsEdit, dsInsert] then
      DmCadastroFuncionariosDass.FdTabelaFuncionarios.Cancel;

  except
    on E: EAbort do
      Exit;
    on E: Exception do
      Application.MessageBox(PChar('Erro ao gravar: ' + E.Message),
        'Erro do Sistema', MB_OK + MB_ICONERROR);
  end;
end;

// Método que valida os estados dos botões.
procedure TFormCadastroFuncionariosDass.AtualizarBotoes;
var
  EmEdicao: Boolean;
  LPosicaoAtual, LTotalRegistros: Integer;
begin

  if not DmCadastroFuncionariosDass.FdTabelaFuncionarios.Active then
  begin
    BtnNovo.Enabled := True;
    BtnEditar.Enabled := False;
    BtnExcluir.Enabled := False;
    BtnSalvar.Enabled := False;
    BtnCancelar.Enabled := False;

    BtnPrimeiro.Enabled := False;
    BtnAnterior.Enabled := False;
    BtnProximo.Enabled := False;
    BtnUltimo.Enabled := False;

    TsAbaListagem.TabVisible := True;
    Exit;
  end;

  EmEdicao := DmCadastroFuncionariosDass.FdTabelaFuncionarios.State
    in [dsInsert, dsEdit];
  LPosicaoAtual := DmCadastroFuncionariosDass.FdTabelaFuncionarios.RecNo;
  LTotalRegistros := DmCadastroFuncionariosDass.FdTabelaFuncionarios.
    RecordCount;

  if (LPosicaoAtual <= 0) and (LTotalRegistros > 0) then
    LPosicaoAtual := 1;

  BtnPrimeiro.Enabled := (not EmEdicao) and (LPosicaoAtual > 1);
  BtnAnterior.Enabled := (not EmEdicao) and (LPosicaoAtual > 1);

  BtnProximo.Enabled := (not EmEdicao) and (LPosicaoAtual < LTotalRegistros) and
    (LTotalRegistros > 0);

  BtnUltimo.Enabled := (not EmEdicao) and (LPosicaoAtual < LTotalRegistros) and
    (LTotalRegistros > 0);

  BtnNovo.Enabled := not EmEdicao;

  BtnEditar.Enabled := (not EmEdicao) and
    (not DmCadastroFuncionariosDass.FdTabelaFuncionarios.IsEmpty);

  BtnExcluir.Enabled := (not EmEdicao) and
    (not DmCadastroFuncionariosDass.FdTabelaFuncionarios.IsEmpty);

  BtnSalvar.Enabled := EmEdicao;
  BtnCancelar.Enabled := EmEdicao;

  if DmCadastroFuncionariosDass.FdTabelaFuncionarios.State = dsInsert then
    LblContadorFuncionarios.Caption := 'Novo Registro...'
  Else if DmCadastroFuncionariosDass.FdTabelaFuncionarios.State = dsEdit then
    LblContadorFuncionarios.Caption := 'Editando Registro...'
  else
    LblContadorFuncionarios.Caption := Format('Funcionário %d de %d',
      [DmCadastroFuncionariosDass.FdTabelaFuncionarios.RecNo,
      DmCadastroFuncionariosDass.FdTabelaFuncionarios.RecordCount]);

  TsAbaListagem.TabVisible := not EmEdicao;
end;

// Botão pesquisar.
procedure TFormCadastroFuncionariosDass.BtnPesquisarClick(Sender: TObject);
begin
  ValidarCampos(Nil);
  ExecutarConsulta;
end;

// Redirecionar para aba de cadastro.
procedure TFormCadastroFuncionariosDass.DbGridFuncionariosDblClick
  (Sender: TObject);
begin
  if not DmCadastroFuncionariosDass.FdTabelaFuncionarios.IsEmpty then
  begin
    DmCadastroFuncionariosDass.FdTabelaFuncionarios.Edit;
    TPPaginaControle.ActivePage := TsAbaCadastro;
    TdbNome.SetFocus;
  end;
end;

// Marcar toda linha da grade em azul.
procedure TFormCadastroFuncionariosDass.DbGridFuncionariosDrawColumnCell
  (Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (gdSelected in State) AND
    (DmCadastroFuncionariosDass.FdTabelaFuncionarios.State = dsBrowse) then
  begin
    DbGridFuncionarios.Canvas.Brush.Color := clHighlight;
    DbGridFuncionarios.Canvas.Font.Color := clHighlightText;
  end;
  DbGridFuncionarios.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

// Atualizar botões ao navegar pelo pacote.
procedure TFormCadastroFuncionariosDass.DsFuncionariosDataChange
  (Sender: TObject; Field: TField);
begin
  if Field = nil then
    AtualizarBotoes;
end;

// Atribuir parâmetros e chamar médodo de consulta da grade.
procedure TFormCadastroFuncionariosDass.ExecutarConsulta;
Var
  LFiltrosFuncionarios: TFiltrosFuncionario;
begin
  LFiltrosFuncionarios := Default (TFiltrosFuncionario);
  LFiltrosFuncionarios.Nome := edtNome.Text;
  LFiltrosFuncionarios.Cpf := DmCadastroFuncionariosDass.BuscouSomenteNumeros
    (EdtCpf.Text);
  LFiltrosFuncionarios.Email := EdtEmail.Text;
  LFiltrosFuncionarios.TamCamiseta := TcbTamanhoCamisa.Text;
  LFiltrosFuncionarios.TamCalcado := StrToIntDef(EdtTamCalcado.Text, 0);
  DmCadastroFuncionariosDass.ConsultarFuncionarios(LFiltrosFuncionarios);
end;

// Setar o dataset do datamodule.
procedure TFormCadastroFuncionariosDass.FormCreate(Sender: TObject);
begin
  if Assigned(DmCadastroFuncionariosDass) then
  begin
    DsFuncionarios.DataSet := DmCadastroFuncionariosDass.FdTabelaFuncionarios;
  end;
end;

// Evento para pular para próximo componente ao dar ENTER.
procedure TFormCadastroFuncionariosDass.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN, VK_DOWN:
      begin

        if ActiveControl = TdbTamCalcado then
          Exit;

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

// Forçar foco e atualizar estado dos botões na abertura.
procedure TFormCadastroFuncionariosDass.FormShow(Sender: TObject);
begin
  edtNome.SetFocus;
  AtualizarBotoes;
end;

// Método validador dos campos.
// Campos que são DBWARE não permitir vazio.
procedure TFormCadastroFuncionariosDass.ValidarCampos(AControl: TControl);
VAr
  LIdAtual: Integer;
begin
  IF DsFuncionarios.State in [dsEdit, dsInsert] then
  Begin

    if (AControl = nil) or (AControl = TdbNome) then
    begin
      IF not DmCadastroFuncionariosDass.ValidouCampoVazio(TdbNome.Text) Then
      Begin
        Application.MessageBox('O Nome é obrigatório.', 'Validação',
          MB_OK + MB_ICONEXCLAMATION);
        TdbNome.SetFocus;
      End;
    End;

    if (AControl = nil) or (AControl = TdbCpf) then
    begin

      IF not DmCadastroFuncionariosDass.ValidouCampoVazio(TdbCpf.Text) Then
      Begin
        Application.MessageBox('O CPF é obrigatório.', 'Validação',
          MB_OK + MB_ICONEXCLAMATION);
        TdbCpf.SetFocus;
        Abort;
      End;
      IF not DmCadastroFuncionariosDass.ValidouCPF(TdbCpf.Field.AsString) then
      Begin
        TdbCpf.SetFocus;
        Abort;
      End;

      LIdAtual := DmCadastroFuncionariosDass.FdTabelaFuncionarios.FieldByName
        ('ID').AsInteger;

      if DmCadastroFuncionariosDass.ValidouCPFExiste(TdbCpf.Text, LIdAtual) then
      begin
        Application.MessageBox
          ('Atenção: Este CPF já está cadastrado para outro funcionário.',
          'Validação', MB_OK + MB_ICONWARNING);
        TdbCpf.SetFocus;
        TdbCpf.SelectAll;
        Abort;
        TdbCpf.SelectAll;
      end;
    end;

    if (AControl = nil) or (AControl = TdbEmail) then
    begin
      IF not DmCadastroFuncionariosDass.ValidouCampoVazio(TdbEmail.Text) Then
      BEgin
        Application.MessageBox('O E-mail é obrigatório.', 'Validação',
          MB_OK + MB_ICONEXCLAMATION);
        TdbEmail.SetFocus;
        Abort;
      end;
      if not DmCadastroFuncionariosDass.ValidouEmail(TdbEmail.Text) then
      Begin
        TdbEmail.SetFocus;
        Abort;
      End;
    end;

    if (AControl = nil) or (AControl = TdbTamanhoCamisa) then
    begin
      IF not DmCadastroFuncionariosDass.ValidouCampoVazio
        (TdbTamanhoCamisa.Text) Then
      Begin
        Application.MessageBox('O Tamanho de Camiseta é obrigatório.',
          'Validação', MB_OK + MB_ICONEXCLAMATION);
        TdbTamanhoCamisa.SetFocus;
        Abort;
      end;

      if NOt DmCadastroFuncionariosDass.ValidouTamanhoCamisa
        (TdbTamanhoCamisa.Text) then
      Begin
        TdbTamanhoCamisa.SetFocus;
        Abort;
      End;
    end;

    if (AControl = nil) or (AControl = TdbTamCalcado) then
    begin
      IF not DmCadastroFuncionariosDass.ValidouCampoVazio
        (TdbTamCalcado.Text) Then
      Begin
        Application.MessageBox('O Tamanho de calçado é obrigatório.',
          'Validação', MB_OK + MB_ICONEXCLAMATION);
        TdbTamCalcado.SetFocus;
        Abort;
      end;
      if NOt DmCadastroFuncionariosDass.ValidouTamanhoCalcado
        (StrToIntDef(TdbTamCalcado.Text, 0)) Then
      Begin
        TdbTamCalcado.SetFocus;
        Abort;
      End;
    end;
  End;
  // Campos de pesquisa, exigir formatação do CPF e E-mail.
  if (AControl = nil) or (AControl = EdtCpf) then
  begin
    IF DmCadastroFuncionariosDass.ValidouCampoVazio(EdtCpf.Text) Then
    Begin
      if not DmCadastroFuncionariosDass.ValidouCPF(EdtCpf.Text) then
      Begin
        EdtCpf.SetFocus;
        Abort;
      End;
    End;
  end;

  if (AControl = nil) or (AControl = EdtEmail) then
  begin
    if not DmCadastroFuncionariosDass.ValidouEmail(EdtEmail.Text) then
      EdtEmail.SetFocus;
  end;
end;

end.
