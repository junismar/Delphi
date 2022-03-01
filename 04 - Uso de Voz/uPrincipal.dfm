object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Uso de voz em delphi'
  ClientHeight = 566
  ClientWidth = 945
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_voz: TLabel
    Left = 8
    Top = 0
    Width = 108
    Height = 20
    Caption = 'Selecione a voz'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl_veloc: TLabel
    Left = 272
    Top = 0
    Width = 127
    Height = 20
    Caption = 'Velocidade da voz'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl_pos: TLabel
    Left = 539
    Top = 23
    Width = 18
    Height = 20
    Caption = '00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object tbRate: TTrackBar
    Left = 272
    Top = 26
    Width = 261
    Height = 45
    Position = 5
    TabOrder = 0
    OnChange = tbRateChange
  end
  object btnOuvir: TButton
    Left = 584
    Top = 25
    Width = 77
    Height = 23
    Caption = 'Ouvir'
    TabOrder = 1
  end
  object cbx_voz: TComboBox
    Left = 8
    Top = 26
    Width = 261
    Height = 21
    TabOrder = 2
    Text = 'cbx_voz'
    OnChange = cbx_vozChange
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 77
    Width = 945
    Height = 489
    ActivePage = tbSecundaria
    Align = alBottom
    TabOrder = 3
    object tbPrincipal: TTabSheet
      Caption = 'Primeira '
      ExplicitWidth = 1143
      ExplicitHeight = 465
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 752
        Height = 436
        Align = alClient
        DataSource = dsCadastro
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'nome'
            Title.Caption = 'Nome'
            Width = 243
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'endereco'
            Title.Caption = 'Endere'#231'o'
            Width = 247
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefone'
            Title.Caption = 'Telefone'
            Width = 107
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dtCadastro'
            Title.Caption = 'Data de Cadastro'
            Width = 121
            Visible = True
          end>
      end
      object nvg_cadastro: TDBNavigator
        Left = 0
        Top = 436
        Width = 937
        Height = 25
        DataSource = dsCadastro
        Align = alBottom
        TabOrder = 1
        ExplicitLeft = -16
        ExplicitTop = 344
        ExplicitWidth = 1143
      end
      object Panel2: TPanel
        Left = 752
        Top = 0
        Width = 185
        Height = 436
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitLeft = 1171
        ExplicitTop = 8
        ExplicitHeight = 440
        object btnLimparDataset: TBitBtn
          Left = 10
          Top = 13
          Width = 171
          Height = 25
          Caption = 'Limpar'
          TabOrder = 0
          OnClick = btnLimparDatasetClick
        end
        object Button2: TButton
          Left = 10
          Top = 44
          Width = 171
          Height = 23
          Caption = 'Ouvir'
          TabOrder = 1
          OnClick = Button2Click
        end
      end
    end
    object tbSecundaria: TTabSheet
      Caption = 'Segunda'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitWidth = 281
      ExplicitHeight = 165
      object rch_obs: TRichEdit
        Left = 0
        Top = 0
        Width = 752
        Height = 461
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          'Estudo de como usar voz em delhi. Sdk da microsoft '
          ''
          '')
        ParentFont = False
        TabOrder = 0
        Zoom = 100
        ExplicitLeft = -6
        ExplicitWidth = 1171
        ExplicitHeight = 465
      end
      object Panel1: TPanel
        Left = 752
        Top = 0
        Width = 185
        Height = 461
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitLeft = 1177
        ExplicitHeight = 465
        object btnLimpar: TBitBtn
          Left = 6
          Top = 13
          Width = 171
          Height = 25
          Caption = 'Limpar'
          TabOrder = 0
          OnClick = btnLimparClick
        end
        object btnOuvirRich: TButton
          Left = 6
          Top = 44
          Width = 171
          Height = 23
          Caption = 'Ouvir'
          TabOrder = 1
          OnClick = btnOuvirRichClick
        end
      end
    end
  end
  object cds_cadastro: TClientDataSet
    PersistDataPacket.Data = {
      800000009619E0BD0100000018000000040000000000030000008000046E6F6D
      65010049000000010005574944544802000200140008656E64657265636F0100
      4900000001000557494454480200020032000874656C65666F6E650100490000
      000100055749445448020002000F000A6474436164617374726F040006000000
      00000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 472
    Top = 184
    object cds_cadastronome: TStringField
      FieldName = 'nome'
    end
    object cds_cadastroendereco: TStringField
      FieldName = 'endereco'
      Size = 50
    end
    object cds_cadastrotelefone: TStringField
      FieldName = 'telefone'
      Size = 15
    end
    object cds_cadastrodtCadastro: TDateField
      FieldName = 'dtCadastro'
    end
  end
  object dsCadastro: TDataSource
    DataSet = cds_cadastro
    Left = 560
    Top = 184
  end
  object SpVoice: TSpVoice
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 632
    Top = 184
  end
end
