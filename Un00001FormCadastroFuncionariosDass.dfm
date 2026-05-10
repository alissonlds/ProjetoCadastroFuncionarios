object FormCadastroFuncionariosDass: TFormCadastroFuncionariosDass
  Left = 0
  Top = 0
  Caption = 'Funcion'#225'rios Dass'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object TPPaginaControle: TPageControl
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    ActivePage = TsAbaListagem
    Align = alClient
    TabOrder = 0
    object TsAbaListagem: TTabSheet
      Caption = '1. Listagem funcion'#225'rios'
      object DbGridFuncionarios: TDBGrid
        Left = 0
        Top = 145
        Width = 616
        Height = 266
        Align = alClient
        DataSource = DsFuncionarios
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Caption = 'Registro'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Title.Caption = 'Nome funcion'#225'rio'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = [fsBold]
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = [fsBold]
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Title.Caption = 'E-mail'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = [fsBold]
            Width = 111
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TAMANHO_CAMISA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Title.Caption = 'Tam. da camisa'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = [fsBold]
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TAMANHO_CALCADO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Title.Caption = 'Tam. do cal'#231'ado'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = [fsBold]
            Width = 95
            Visible = True
          end>
      end
      object TpPainelPesquisa: TPanel
        Left = 0
        Top = 0
        Width = 616
        Height = 145
        Align = alTop
        TabOrder = 1
        ExplicitTop = -6
        object LblNome: TLabel
          Left = 96
          Top = 7
          Width = 37
          Height = 15
          Caption = 'Nome:'
          Color = clBackground
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object LblCpf: TLabel
          Left = 107
          Top = 34
          Width = 23
          Height = 15
          Caption = 'CPF:'
          Color = clBackground
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object LblTamCamisa: TLabel
          Left = 13
          Top = 92
          Width = 122
          Height = 15
          Caption = 'Tamanho de camiseta:'
          Color = clBackground
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object LblTamCalcado: TLabel
          Left = 19
          Top = 121
          Width = 114
          Height = 15
          Caption = 'Tamanho de cal'#231'ado:'
          Color = clBackground
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object LblEmail: TLabel
          Left = 95
          Top = 63
          Width = 37
          Height = 15
          Caption = 'E-mail:'
          Color = clBackground
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object edtNome: TEdit
          Left = 138
          Top = 2
          Width = 314
          Height = 23
          TabOrder = 0
          OnExit = GenericExit
        end
        object TbBotaoPesquisar: TButton
          Left = 479
          Top = 17
          Width = 111
          Height = 43
          Caption = 'Pesquisar'
          TabOrder = 5
          OnClick = TbBotaoPesquisarClick
        end
        object TcbTamanhoCamisa: TComboBox
          Left = 138
          Top = 89
          Width = 45
          Height = 23
          Style = csDropDownList
          TabOrder = 3
          OnExit = GenericExit
          Items.Strings = (
            'PP'
            'P'
            'M'
            'G'
            'GG'
            'XG'
            '')
        end
        object EdtTamCalcado: TEdit
          Left = 138
          Top = 118
          Width = 45
          Height = 23
          NumbersOnly = True
          TabOrder = 4
          OnExit = GenericExit
        end
        object EdtEmail: TEdit
          Left = 138
          Top = 60
          Width = 314
          Height = 23
          TabOrder = 2
          OnExit = GenericExit
        end
        object EdtCpf: TMaskEdit
          Left = 138
          Top = 31
          Width = 87
          Height = 23
          EditMask = '999.999.999-99;1;_'
          MaxLength = 14
          TabOrder = 1
          Text = '   .   .   -  '
          OnExit = GenericExit
        end
      end
    end
    object TsAbaCadastro: TTabSheet
      Caption = '2. Cadastro funcion'#225'rios'
      ImageIndex = 1
      object TpPainelCadastro: TPanel
        Left = 0
        Top = 0
        Width = 616
        Height = 411
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 240
        ExplicitTop = 144
        ExplicitWidth = 185
        ExplicitHeight = 41
      end
    end
  end
  object DsFuncionarios: TDataSource
    DataSet = Dm00001CadastroFuncionariosDass.FdTabelaFuncionarios
    Left = 576
    Top = 392
  end
end
