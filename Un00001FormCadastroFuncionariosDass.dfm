object FormCadastroFuncionariosDass: TFormCadastroFuncionariosDass
  Left = 0
  Top = 0
  Caption = 'Funcion'#225'rios Dass'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Constraints.MinWidth = 500
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
    Top = 60
    Width = 624
    Height = 381
    ActivePage = TsAbaListagem
    Align = alClient
    TabOrder = 0
    OnChange = TPPaginaControleChange
    object TsAbaListagem: TTabSheet
      Caption = '1. Listagem funcion'#225'rios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      object TpPainelPesquisa: TPanel
        Left = 0
        Top = 0
        Width = 616
        Height = 185
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object GbFiltrosPesquisa: TGroupBox
          Left = 0
          Top = 0
          Width = 616
          Height = 185
          Align = alTop
          Caption = 'Filtros de pesquisa:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitHeight = 217
          DesignSize = (
            616
            185)
          object LblNome: TLabel
            Left = 138
            Top = 29
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
          object LblEmail: TLabel
            Left = 138
            Top = 58
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
          object LblCpf: TLabel
            Left = 152
            Top = 87
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
            Left = 93
            Top = 116
            Width = 82
            Height = 15
            Caption = 'Tam. Camiseta:'
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
            Left = 101
            Top = 145
            Width = 74
            Height = 15
            Caption = 'Tam. Cal'#231'ado:'
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
            Left = 178
            Top = 26
            Width = 314
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnExit = GenericExit
          end
          object EdtEmail: TEdit
            Left = 178
            Top = 55
            Width = 314
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            OnExit = GenericExit
          end
          object EdtCpf: TMaskEdit
            Left = 178
            Top = 84
            Width = 87
            Height = 23
            EditMask = '999.999.999-99;1;_'
            MaxLength = 14
            TabOrder = 2
            Text = '   .   .   -  '
            OnExit = GenericExit
          end
          object TcbTamanhoCamisa: TComboBox
            Left = 178
            Top = 113
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
            Left = 178
            Top = 142
            Width = 45
            Height = 23
            NumbersOnly = True
            TabOrder = 4
            OnExit = GenericExit
          end
          object BtnPesquisar: TBitBtn
            Left = 387
            Top = 114
            Width = 105
            Height = 49
            Anchors = [akTop, akRight]
            Caption = '&Pesquisar'
            ImageIndex = 5
            Images = TiListaImagens
            Style = bsNew
            TabOrder = 5
            OnClick = BtnPesquisarClick
          end
        end
      end
      object TpPainelGrid: TPanel
        Left = 0
        Top = 185
        Width = 616
        Height = 166
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitLeft = 288
        ExplicitTop = 224
        ExplicitWidth = 185
        ExplicitHeight = 41
        object DbGridFuncionarios: TDBGrid
          Left = 0
          Top = 0
          Width = 616
          Height = 166
          Align = alClient
          DataSource = DsFuncionarios
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnDrawColumnCell = DbGridFuncionariosDrawColumnCell
          OnDblClick = DbGridFuncionariosDblClick
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
              Width = 199
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CPF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 85
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
              Width = 175
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'TAMANHO_CAMISA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Camiseta'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 65
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'TAMANHO_CALCADO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Cal'#231'ado'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 61
              Visible = True
            end>
        end
      end
    end
    object TsAbaCadastro: TTabSheet
      Caption = '2. Cadastro funcion'#225'rios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object TpPainelCadastro: TPanel
        Left = 0
        Top = 0
        Width = 616
        Height = 351
        Align = alClient
        TabOrder = 0
        ExplicitTop = 3
        object LblContadorFuncionarios: TLabel
          Left = 1
          Top = 228
          Width = 614
          Height = 15
          Align = alTop
          Alignment = taCenter
          Caption = '---'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitLeft = 152
          ExplicitTop = 234
          ExplicitWidth = 285
        end
        object GbDadosPessoais: TGroupBox
          Left = 1
          Top = 49
          Width = 614
          Height = 104
          Align = alTop
          Caption = 'Dados pessoais:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitTop = 50
          DesignSize = (
            614
            104)
          object LblCpfDb: TLabel
            Left = 43
            Top = 58
            Width = 23
            Height = 15
            Alignment = taRightJustify
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
          object LblEmailDb: TLabel
            Left = 163
            Top = 58
            Width = 37
            Height = 20
            Alignment = taRightJustify
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
          object LblNomeDb: TLabel
            Left = 29
            Top = 29
            Width = 37
            Height = 15
            Alignment = taRightJustify
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
          object TdbCpf: TDBEdit
            Left = 69
            Top = 55
            Width = 87
            Height = 23
            DataField = 'CPF'
            DataSource = DsFuncionarios
            TabOrder = 1
            OnExit = GenericExit
          end
          object TdbEmail: TDBEdit
            Left = 204
            Top = 55
            Width = 316
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            DataField = 'EMAIL'
            DataSource = DsFuncionarios
            TabOrder = 2
            OnExit = GenericExit
          end
          object TdbNome: TDBEdit
            Left = 72
            Top = 26
            Width = 448
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            DataField = 'NOME'
            DataSource = DsFuncionarios
            TabOrder = 0
            OnExit = GenericExit
          end
        end
        object GbMedidasUniforme: TGroupBox
          Left = 1
          Top = 153
          Width = 614
          Height = 75
          Align = alTop
          Caption = 'Medidas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          ExplicitTop = 154
          object LblTamCalcadoDb: TLabel
            Left = 13
            Top = 34
            Width = 53
            Height = 15
            Caption = 'Camiseta:'
            Color = clBackground
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LblTamCamisaDb: TLabel
            Left = 139
            Top = 34
            Width = 45
            Height = 15
            Caption = 'Cal'#231'ado:'
            Color = clBackground
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object TdbTamanhoCamisa: TDBComboBox
            Left = 69
            Top = 31
            Width = 45
            Height = 23
            Style = csDropDownList
            DataField = 'TAMANHO_CAMISA'
            DataSource = DsFuncionarios
            Items.Strings = (
              'PP'
              'P'
              'M'
              'G'
              'GG'
              'XG')
            TabOrder = 0
            OnExit = GenericExit
          end
          object TdbTamCalcado: TDBEdit
            Left = 190
            Top = 31
            Width = 45
            Height = 23
            DataField = 'TAMANHO_CALCADO'
            DataSource = DsFuncionarios
            TabOrder = 1
            OnExit = GenericExit
            OnKeyDown = TdbTamCalcadoKeyDown
            OnKeyPress = TdbTamCalcadoKeyPress
          end
        end
        object TpPainelRegistros: TPanel
          Left = 1
          Top = 1
          Width = 614
          Height = 48
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object TpPainelCentral: TPanel
            Left = 151
            Top = 0
            Width = 279
            Height = 49
            BevelOuter = bvNone
            TabOrder = 0
            object BtnAnterior: TSpeedButton
              AlignWithMargins = True
              Left = 70
              Top = 3
              Width = 65
              Height = 43
              Hint = 'Registro anterior'
              Margins.Left = 5
              Margins.Right = 5
              Action = ActRegistroAnterior
              Align = alLeft
              Caption = '<'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitHeight = 91
            end
            object BtnPrimeiro: TSpeedButton
              Left = 0
              Top = 0
              Width = 65
              Height = 49
              Hint = 'Primeiro registro'
              Margins.Left = 5
              Margins.Right = 5
              Action = ActPrimeiroRegistro
              Align = alLeft
              Caption = '|<<'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = -5
              ExplicitTop = -7
            end
            object BtnProximo: TSpeedButton
              AlignWithMargins = True
              Left = 145
              Top = 3
              Width = 65
              Height = 43
              Hint = 'Pr'#243'ximo registro'
              Margins.Left = 5
              Margins.Right = 5
              Action = ActProximoRegistro
              Align = alLeft
              Caption = '>'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitTop = -1
            end
            object BtnUltimo: TSpeedButton
              AlignWithMargins = True
              Left = 220
              Top = 3
              Width = 65
              Height = 43
              Hint = #218'ltimo registro'
              Margins.Left = 5
              Margins.Right = 5
              Action = ActUltimoRegistro
              Align = alLeft
              Caption = '|>>'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitHeight = 91
            end
          end
        end
      end
    end
  end
  object TpPainelAcoes: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 60
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object BtnNovo: TSpeedButton
      Left = 0
      Top = 0
      Width = 93
      Height = 60
      Action = ActNovo
      Align = alLeft
      Caption = '&Novo'
      ImageIndex = 0
      Images = TiListaImagens
      Flat = True
      Layout = blGlyphTop
      ExplicitLeft = -6
      ExplicitTop = -6
    end
    object BtnEditar: TSpeedButton
      Left = 93
      Top = 0
      Width = 93
      Height = 60
      Action = ActEditar
      Align = alLeft
      Caption = '&Editar'
      ImageIndex = 1
      Images = TiListaImagens
      Flat = True
      Layout = blGlyphTop
      ExplicitLeft = 87
      ExplicitTop = -6
    end
    object BtnSalvar: TSpeedButton
      Left = 186
      Top = 0
      Width = 93
      Height = 60
      Action = ActSalvar
      Align = alLeft
      Caption = '&Salvar'
      ImageIndex = 2
      Images = TiListaImagens
      Flat = True
      Layout = blGlyphTop
      ExplicitLeft = 180
      ExplicitTop = -6
    end
    object BtnCancelar: TSpeedButton
      Left = 279
      Top = 0
      Width = 93
      Height = 60
      Action = ActCancelar
      Align = alLeft
      Caption = '&Cancelar'
      ImageIndex = 3
      Images = TiListaImagens
      Flat = True
      Layout = blGlyphTop
      ExplicitLeft = 273
      ExplicitTop = -6
    end
    object BtnExcluir: TSpeedButton
      Left = 372
      Top = 0
      Width = 93
      Height = 60
      Action = ActExcluir
      Align = alLeft
      Caption = '&Excluir'
      ImageIndex = 4
      Images = TiListaImagens
      Flat = True
      Layout = blGlyphTop
      ExplicitLeft = 378
      ExplicitTop = -6
    end
  end
  object DsFuncionarios: TDataSource
    DataSet = DmCadastroFuncionariosDass.FdTabelaFuncionarios
    OnDataChange = DsFuncionariosDataChange
    Left = 576
    Top = 392
  end
  object TiListaImagens: TImageList
    Left = 516
    Top = 382
    Bitmap = {
      494C010106000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      00000202050510112F2F232568682728808A2120778B19195B6A0C0B2A300202
      0505000000000000000000000000000000000000000000000000000000000503
      0306331A2148753C4BA79E5166E3AC586EFBA05263FC8F4958E56A3742A92E18
      1D49050303070000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000D0E
      2626313597974A50E4E44C50F1FB3E3EE0FF3B39DAFF3A38D6FB3533C4E42423
      83980A092227000000000000000000000000000000000000000011090B186533
      4191A6556AEEB25B72FFB25B72FFAF5970FFA25364FF9F5162FFA05263FF964D
      5DEF5C3039930F080A1800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000015163D3D454A
      D2D2545AFFFF5559F7FF4948E1FF4543DCFF4544DCFF4644DCFF4341DCFF3C3A
      DBFF3230B5D30F0F363E00000000000000000000000011090B187B3E4FB0B15B
      72FEB25B72FFB25B72FFB25B72FFAF5970FFA25364FF9F5162FF9F5162FF9F50
      62FF9E5162FE6F3945B10F080A18000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000D0E2727454AD1D15258
      FFFF656BFEFFC6C7FAFFD5D5F6FFD4D4F7FFD4D4F7FFD6D5F7FFC2C1F3FF504E
      DEFF3A38DAFF3230B4D20A0A2328000000000402030565334191B25B72FFB25B
      72FFB25B72FFB25B72FFB25B72FFAF5970FFA25364FF9F5162FFA05364FFB070
      7EFFA25667FF9F5162FF5C2F3992040203060000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000102030332359696545AFFFF5258
      FFFF7378FEFFF2F2FEFFF9F9FDFFFAFAFEFFFAFAFEFFF9F9FDFFF0F0FCFF605E
      E1FF3937DAFF3C3ADBFF2423839801010404331A2149A5556AEDB25B72FFB25B
      72FFB25B72FFB15A71FFB15970FFAE586EFFA15163FF9F5061FFB57986FFB87E
      8BFFA05263FF9F5162FF954C5CED2F181D4A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000010112F2F4B50E3E3545AFFFF5157
      FFFF7B7FFEFFEDEDFDFFBCBBF2FFCFCFF6FFCFCFF6FFBCBBF2FFECECFBFF6867
      E3FF3937DAFF3B39DAFF3634C3E30C0B2A30753C4AA7B25B72FFB25B72FFB25B
      72FFB15A71FFB56379FFC27D8FFFC48595FFB47583FFB47684FFBC8591FFA154
      65FF9F5162FFA05263FFA05263FF693641A80000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000232568685359FBFB545AFFFF5157
      FFFF8387FEFFEEEEFCFFAEAEF0FFC6C6F4FFC6C6F4FFAFAEF0FFEEEDFBFF7170
      E4FF3836DAFF3C3ADBFF3B39D7FB19185A699E5166E3B25B72FFB25B72FFB15A
      71FFB96A7FFFCD94A3FFC27E90FFBA6F83FFB67785FFCBA1AAFFAC6877FF9F50
      61FFA05263FFA05263FF9F5262FF8F4A59E40000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D308A8A545AFFFF545AFFFF5157
      FFFF8B8FFEFFF1F1FCFFAEADF0FFC6C5F4FFC6C5F4FFAEADF0FFF0F0FCFF7B79
      E6FF3836DAFF3C3ADBFF3B39DAFF2120778BAE5970FAB25B72FFB15A71FFB25C
      73FFCB91A0FFBB6E83FFB0586FFFAF586EFFA05062FFAA6574FFBD8793FFA053
      64FF9F5162FFA05263FF9F5262FF9D5162FB0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D318A8A545AFFFF545AFFFF5157
      FFFF9497FEFFF8F8FDFFCFCFF6FFDDDDF8FFDDDDF8FFCFCFF6FFF8F8FDFF8483
      E8FF3836DAFF3B39DAFF3F3EE0FF2729818AAE5970FAB25B72FFB15A71FFB868
      7DFFCA909FFFB15A71FFB25B72FFAF5970FFA25364FF9F5162FFBD8692FFA75E
      6EFF9F5162FFA05263FF9F5262FF9D5162FB0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000232568685359FBFB545AFFFF5157
      FFFF8D90FBFFE2E1F9FFE1E1F9FFE1E0F9FFE1E0F9FFE1E1F9FFE2E1F9FF807E
      E7FF3836D9FF3F3EE0FF4D51F1FB232568689E5166E3B25B72FFB15A71FFB869
      7EFFCA8E9EFFB15A71FFB25B72FFAF5970FFA25364FF9F5162FFBC8591FFA75F
      6FFF9F5162FFA05263FF9F5262FF8F4A59E40000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000010112F2F4B50E3E35359FFFF5D63
      FEFFA6A7F6FFBAB9F1FFB8B8F1FFB7B7F1FFB7B7F1FFB8B8F1FFBABAF2FFA09F
      EDFF4A4AE2FF4D51F5FF4B50E3E310112F2F753C4BA7B25B72FFB15A71FFB35E
      74FFCC94A3FFB8697EFFB15870FFAF596FFFA05062FFA7606FFFBF8B96FFA155
      65FF9F5162FFA05263FFA05263FF693641A80000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000001020303313596965359FFFF6167
      FEFFCCCEFEFFE3E4FFFFF0F0FEFFFFFFFFFFFFFFFFFFEEEEFCFFE3E4FEFFCBCC
      FCFF5D61F8FF5359FEFF3235969601020303331A2149A5556AEDB25B72FFB159
      71FFBC7185FFCD96A4FFBE7588FFB6677BFFB16E7DFFC18E99FFAB6776FF9F50
      61FFA05263FF9F5262FF954C5CED2F181D4A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000D0E27274449D1D1545A
      FEFF5D63FEFF5F64FFFF9396FEFFD9DBFEFFD9DBFEFF9093FBFF5E64FEFF5D63
      FFFF545AFEFF4449D1D10D0E2727000000000402030565344191B25B72FFB25B
      72FFB15A71FFB96A7FFFC78798FFC88D9CFFBA808DFFA86170FF9F5062FFA052
      63FFA05263FFA05263FF5C303993040203060000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000015163D3D454A
      D2D25359FFFF5359FFFF555BFEFF5C62FEFF5C62FEFF555BFEFF5359FFFF5359
      FFFF454AD2D215163D3D00000000000000000000000011090B187B3F4FB0B15B
      72FEB25B72FFB15A71FFB15970FFAF596FFFA15163FF9F5162FFA05263FF9F52
      63FF9F5263FE6F3945B10F080A18000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000D0E
      2626323697974B51E4E45258FBFB5359FFFF5359FFFF5258FBFB4B51E4E43236
      97970D0E2727000000000000000000000000000000000000000011090B186534
      4191A6556AEEB25B72FFB25B72FFAF5970FFA25364FF9F5162FFA05263FF964D
      5DEF5C3039930F080A1800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000202050510112F2F232569692E318A8A2E318A8A2325696910112F2F0202
      0505000000000000000000000000000000000000000000000000000000000503
      0306331A2148753C4BA79E5166E3AC586EFBA05263FC8F4958E56A3742A92E18
      1D49050303070000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000205
      020617311548347231A7469B43E34EAB4AFB4EAB4AFB479B43E3337231A71731
      1648020502060000000000000000000000000000000000000000000000000000
      000000000000140D03153F2709425C390D605C390D603F270942140D03150000
      000000000000000000000000000000000000674E2CB2926F40FD926F3EFF916D
      3DFF916D3DFF916D3DFF916D3DFF916D3DFF916D3DFF916D3DFF916D3DFF916D
      3DFF916D3DFF926E3EFF86653AFD574125B20000000000000000000000000101
      060608083F47121293A61818C8E21B1BDDFA1B1BDDFA1818C8E2121293A60808
      3F47010106060000000000000000000000000000000000000000081007172D62
      2B914AA246EE4FAE4BFF4FAE4BFF4FAE4BFF4FAE4BFF4FAE4BFF4FAE4BFF4AA2
      46EE2D632B91081007170000000000000000000000000000000000000000120B
      03126A410F6FC0771BCAE48D1FF0EE9321FAEE9321FAE48D1FF0C0771BCA6A41
      0F6F120B031200000000000000000000000088683BEC926F3FFF9C7B4FFFAD90
      6BFFAE916CFFAE916CFFAF916DFFAF916DFFAF916DFFAF916DFFAE916CFFAE91
      6CFFAD906BFF9C7B4FFF8B693CFF745732EC0000000000000000030315171010
      80901A1AD3EE1B1BE2FF1B1BE2FF1B1BE2FF1B1BE2FF1B1BE2FF1B1BE2FF1A1A
      D3EE101080900303151700000000000000000000000008100717377734AF4FAD
      4BFE4FAE4BFF4FAE4BFF4EAD4AFF4CAC48FF4CAC48FF4EAD4AFF4FAE4BFF4FAE
      4BFF4FAD4BFE377734AF0810071700000000000000000000000020140521A968
      17B1F09421FCF39621FFF39621FFF39621FFF39621FFF39621FFF39621FFF094
      21FCA96817B120140521000000000000000089693BEE916E3EFFBFA688FFF0E0
      D6FFEFDFD5FFEFDFD5FFE2DAC5FFCAD4AEFFCAD4AEFFE2DAC5FFEFDFD5FFEFDF
      D5FFF0E0D6FFC0A688FF8A683AFF755833EE000000000303151713139BAF1B1B
      E1FE1A1AE2FF1A1AE1FF1A1AE2FF1B1BE2FF1B1BE2FF1A1AE2FF1A1AE1FF1A1A
      E2FF1B1BE1FE13139BAF0303151700000000020402052D622B914FAE4BFF4FAE
      4BFF4FAE4BFF4EAD4AFF56B152FF8AC988FF8AC988FF56B152FF4EAD4AFF4FAE
      4BFF4FAE4BFF4FAE4BFF2D632A910204020500000000120B0312A96817B1F396
      21FFC67A1BD09E6216A69D6116A59D6116A59D6116A59D6116A59E6216A6C67A
      1BD0F39621FFA96817B1120B03120000000089693BEE916E3EFFC4AB8FFFF2E3
      DAFFF1E2D9FFE4DDC9FFAFD5A0FF9EDDA6FF9EDFA9FFAFD5A0FFE4DDC9FFF1E2
      D9FFF2E3DAFFC4AC8FFF8A683AFF755833EE01010505101081911B1BE2FF1B1B
      E2FF1919E1FF1919E1FF1A1AE1FF1B1BE2FF1B1BE2FF1A1AE1FF1919E1FF1919
      E1FF1B1BE2FF1B1BE2FF10108191010105051731164849A146EC4FAE4BFF4FAE
      4BFF4FAE4BFF4DAD49FF65B861FFEBF6EBFFEBF6EBFF65B861FF4DAD49FF4FAE
      4BFF4FAE4BFF4FAE4BFF49A146EC17311548000000006B420F70F39621FFC77B
      1BD1653E0E6A995F15A19D6116A59D6116A59D6116A59D6116A5995F15A1653F
      0E6AC77B1BD1F39621FF6A420E6F0000000089693BEE916E3EFFC4AB8FFFF2E3
      DAFFF2E2D9FFCDD7B2FF9FDBA1FFA1D394FF9FDEA7FF9EDFA8FFCDD6B1FFF2E2
      D9FFF2E3DAFFC4AB8FFF8A683AFF755833EE080840481919D1EC1A1AE2FF1919
      E1FF3838E5FF8383EFFF2F2FE4FF1818E1FF1818E1FF2F2FE4FF8383EFFF3838
      E5FF1919E1FF1A1AE2FF1919D1EC08084048347131A64FAE4BFF4FAE4BFF4EAD
      4AFF4DAD49FF4CAC48FF64B760FFECF6EBFFECF6EBFF64B760FF4CAC48FF4DAD
      49FF4EAD4AFF4FAE4BFF4FAE4BFF347131A6150D0316BF761AC9F39621FF9F62
      16A7995F15A1F39621FFF39621FFF39621FFF39621FFF39621FFF39621FF995F
      15A19F6216A7F39621FFBF761AC9150D031689693BEE916E3EFFC4AB8FFFF2E3
      DAFFF2E2D9FFCDD7B2FF9FDCA3FF9FDFAAFFA0D89DFF9FDBA1FFCDD7B2FFF2E2
      D9FFF2E3DAFFC4AB8FFF8A683AFF755833EE121293A61B1BE2FF1A1AE1FF1919
      E1FF8383EFFFFCFCFEFFB0B0F5FF2C2CE4FF2C2CE4FFB1B1F5FFFCFCFEFF8383
      EFFF1919E1FF1A1AE1FF1B1BE2FF121293A6479B43E34FAE4BFF4EAD4AFF56B1
      52FF65B861FF63B760FF78C175FFEEF7EEFFEEF7EEFF79C175FF64B760FF65B8
      61FF56B152FF4EAD4AFF4FAE4BFF469A43E23F270942E38D1FEFF39621FF9D61
      16A59D6116A5F39621FFCF801DDA8A551391AF6C18B8ED9221F9F39621FF9D61
      16A59D6116A5F39621FFE38D1FEF3F27094289693BEE916E3EFFC4AB8FFFF2E3
      DAFFF1E2D9FFE5DDC9FFB0D5A0FF9EDFA9FF9FDEA6FFB1D49FFFE5DDC9FFF1E2
      D9FFF2E3DAFFC4AC8FFF8A683AFF755833EE1818C8E21B1BE2FF1A1AE2FF1A1A
      E1FF3030E4FFB1B1F5FFFDFDFEFFB5B5F5FFB5B5F5FFFDFDFEFFB1B1F5FF3030
      E4FF1A1AE1FF1A1AE2FF1B1BE2FF1818C8E24EAA4AFA4FAE4BFF4CAC48FF8AC9
      88FFECF6EBFFEBF6EBFFEEF7EEFFFCFEFCFFFCFEFCFFEEF7EEFFECF6EBFFECF6
      EBFF8BC988FF4CAC48FF4FAE4BFF4EAA4AFA5B390D60EE9321FAF39621FF9D61
      16A59D6116A5F39621FF8B561392825012887749117D90581497F29521FEA063
      16A89F6216A7F39621FFEE9321FA5C390D6089693BEE916E3EFFBFA587FFEFE0
      D5FFEEDFD4FFEEDFD4FFE3DAC5FFCBD4AEFFCBD4AEFFE3DAC5FFEEDFD4FFEEDF
      D4FFEFE0D5FFBFA687FF8A683AFF755833EE1B1BDDFA1B1BE2FF1B1BE2FF1B1B
      E2FF1818E1FF2C2CE4FFB5B5F5FFFFFFFFFFFFFFFFFFB5B5F5FF2C2CE4FF1818
      E1FF1B1BE2FF1B1BE2FF1B1BE2FF1B1BDDFA4EAA4AFA4FAE4BFF4CAC48FF8BC9
      88FFECF6ECFFECF6EBFFEEF7EEFFFCFEFCFFFDFEFCFFEEF7EEFFECF6EBFFECF6
      EBFF8BC988FF4CAC48FF4FAE4BFF4EAA4AFA5B380C60EE9321FAF39621FF9D61
      16A59D6116A5F39621FFAF6C18B87749107DDE881FE97D4D118390581497D584
      1DE0DA871EE5F39621FFEE9321FA5C390D6089693BEE926F3FFF9B7A4EFFAC8E
      68FFAC8F69FFAC8F69FFAD8F6AFFAD8F6AFFAD8F6AFFAD8F6AFFAC8F69FFAC8F
      69FFAC8E68FF9C7A4EFF8B693CFF755833EE1B1BDDFA1B1BE2FF1B1BE2FF1B1B
      E2FF1818E1FF2C2CE4FFB5B5F5FFFFFFFFFFFFFFFFFFB5B5F5FF2C2CE4FF1818
      E1FF1B1BE2FF1B1BE2FF1B1BE2FF1B1BDDFA479B43E34FAE4BFF4EAD4AFF56B1
      52FF65B861FF64B760FF78C175FFEEF7EDFFEEF7EEFF79C176FF64B760FF65B8
      61FF56B152FF4EAD4AFF4FAE4BFF459A42E23F270942E48D1FF0F39621FF9D61
      16A59D6116A5F39621FFEE9321FA8F5813977C4C1182DE881FE97C4C1182925A
      1499F09421FCF39621FFE48D1FF03F27094289693BEE937040FF926F3FFF916E
      3DFF947141FF967343FF967343FF967343FF967343FF967343FF967343FF9471
      41FF916E3DFF926F3FFF8B6A3CFF755833EE1818C8E21B1BE2FF1A1AE2FF1A1A
      E1FF2F2FE4FFB1B1F5FFFDFDFEFFB5B5F5FFB5B5F5FFFDFDFEFFB0B0F5FF2F2F
      E4FF1A1AE1FF1A1AE2FF1B1BE2FF1818C8E2337231A74FAE4BFF4FAE4BFF4EAD
      4AFF4DAD49FF4CAC48FF63B760FFEBF6EBFFECF6EBFF64B760FF4CAC47FF4DAD
      49FF4EAD4AFF4FAE4BFF4FAE4BFF347130A6150D0316BF751AC9F39621FF9F62
      16A7995E15A1F39621FFF39621FFEF9421FB8F5913977C4C1182DE881FE96E43
      0F73B77119C0F39621FFBF761AC9150D031689693BEE937040FF926F3FFF9D7A
      4CFFD9B694FFE4C1A2FFE3C0A1FFE3C0A1FFE3C0A1FFE3C0A1FFE4C1A2FFD9B6
      94FF9D7A4CFF926F3FFF8B6A3CFF755833EE121293A61B1BE2FF1A1AE1FF1919
      E1FF8383EFFFFCFCFEFFB1B1F5FF2C2CE4FF2C2CE4FFB1B1F5FFFCFCFEFF8383
      EFFF1919E1FF1A1AE1FF1B1BE2FF121293A6163116484AA246ED4FAE4BFF4FAE
      4BFF4FAE4BFF4DAD49FF64B861FFEBF6EBFFECF6EBFF65B862FF4DAD49FF4FAE
      4BFF4FAE4BFF4FAE4BFF49A046EC17311548000000006B420E70F39621FFC77B
      1BD1653F0E6A995F15A19D6116A5A06316A8D5841DE0915A14996E430F73663F
      0E6BC87C1BD2F39621FF6B420E700000000089693BEE937040FF916E3EFFA380
      54FFF3D0B4FFFDDAC0FFFCD9BFFFFCD9BFFFFCD9BFFFFCC9A5FFFDC59DFFF3CD
      AFFFA38154FF926F3EFF8B6A3CFF755833EE080840481919D1EC1A1AE2FF1919
      E1FF3838E5FF8383EFFF3030E4FF1818E1FF1818E1FF3030E4FF8484EFFF3838
      E5FF1919E1FF1A1AE2FF1919D1EC08084048020402052D622B914FAE4BFF4FAE
      4BFF4FAE4BFF4EAD4AFF56B152FF8BC988FF8BC989FF56B152FF4EAD4AFF4FAE
      4BFF4FAE4BFF4FAE4BFF2D622B910204020500000000120B0312A86817B1F396
      21FFC67A1BD09E6216A69D6116A59F6216A7D9861EE4EE9321FAB67119C0C77B
      1BD1F39621FFA96817B1120B03120000000089693BEE937040FF916E3EFFA380
      54FFF1CEB3FFFBD8BEFFFBD8BEFFFBD8BEFFFBD7BDFFFBBE91FFFBB785FFF1CA
      AAFFA38054FF926F3EFF8B6A3CFF735732EB01010505101081911B1BE2FF1B1B
      E2FF1919E1FF1919E1FF1A1AE1FF1B1BE2FF1B1BE2FF1A1AE1FF1919E1FF1919
      E1FF1B1BE2FF1B1BE2FF10108191010105050000000008100717377734AF4FAD
      4BFE4FAE4BFF4FAE4BFF4EAD4AFF4CAC48FF4CAC48FF4EAD4AFF4FAE4BFF4FAE
      4BFF4FAD4BFE377734AF0810071700000000000000000000000020140521A968
      17B1F09421FCF39621FFF39621FFF39621FFF39621FFF39621FFF39621FFF094
      21FCA96817B120140521000000000000000089693BEE937040FF916E3EFFA380
      54FFF1CEB3FFFBD8BEFFFBD8BEFFFBD8BEFFFBD7BDFFFBBE91FFFBB785FFF1CA
      AAFFA38054FF926F3EFF89683BF94A382097000000000303151713139BAF1B1B
      E1FE1A1AE2FF1A1AE1FF1A1AE2FF1B1BE2FF1B1BE2FF1A1AE2FF1A1AE1FF1A1A
      E2FF1B1BE1FE13139BAF03031517000000000000000000000000081007172D62
      2B914AA246EE4FAE4BFF4FAE4BFF4FAE4BFF4FAE4BFF4FAE4BFF4FAE4BFF4AA2
      46EE2D632B91081007170000000000000000000000000000000000000000120B
      03126A410F6FC0761BCAE48D1FF0EE9321FAEE9321FAE48D1FF0C1771BCB6B42
      0F70120B031200000000000000000000000088683BEC937040FF916E3EFFA380
      54FFF1CEB3FFFBD8BEFFFBD8BEFFFBD8BEFFFBD7BDFFFBC69FFFFBC196FFF1CB
      ADFFA38054FF8E6C3DFA503D238D0705030D0000000000000000030315171010
      80901A1AD3EE1B1BE2FF1B1BE2FF1B1BE2FF1B1BE2FF1B1BE2FF1B1BE2FF1A1A
      D3EE101080900303151700000000000000000000000000000000000000000205
      020617311648347231A7479B43E34EAB4AFB4EAB4AFB479B43E3337231A71631
      1648020502060000000000000000000000000000000000000000000000000000
      000000000000140D03153F2709425C390D605C390D603F270942150D03160000
      000000000000000000000000000000000000674E2CB2926F40FD916E3EFFA380
      54FFF1CEB3FFFBD8BEFFFBD8BEFFFBD8BEFFFBD7BDFFFBD7BCFFFBD7BDFFF1CE
      B2FFA17E53FC5944269C0907040E000000000000000000000000000000000101
      060608083F47121293A61818C8E21B1BDDFA1B1BDDFA1818C8E2121293A60808
      3F4701010606000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Left = 436
    Top = 382
    object ActNovo: TAction
      Caption = 'ActNovo'
      OnExecute = ActNovoExecute
    end
    object ActEditar: TAction
      Caption = 'ActEditar'
      OnExecute = ActEditarExecute
    end
    object ActCancelar: TAction
      Caption = 'ActCancelar'
      OnExecute = ActCancelarExecute
    end
    object ActExcluir: TAction
      Caption = 'ActExcluir'
      OnExecute = ActExcluirExecute
    end
    object ActSalvar: TAction
      Caption = 'ActSalvar'
      OnExecute = ActSalvarExecute
    end
    object ActPrimeiroRegistro: TAction
      Caption = 'ActPrimeiroRegistro'
      OnExecute = ActPrimeiroRegistroExecute
    end
    object ActUltimoRegistro: TAction
      Caption = 'ActUltimoRegistro'
      OnExecute = ActUltimoRegistroExecute
    end
    object ActRegistroAnterior: TAction
      Caption = 'ActRegistroAnterior'
      OnExecute = ActRegistroAnteriorExecute
    end
    object ActProximoRegistro: TAction
      Caption = 'ActProximoRegistro'
      OnExecute = ActProximoRegistroExecute
    end
  end
end
