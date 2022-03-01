object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'JSON'
  ClientHeight = 473
  ClientWidth = 814
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 413
    Height = 25
    Caption = 'Trabalhando com cria'#231#227'o e leitura do JSON.'
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 48
    Width = 814
    Height = 425
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitWidth = 790
    object Memo1: TMemo
      Left = 186
      Top = 1
      Width = 627
      Height = 423
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      WantTabs = True
      ExplicitLeft = 184
      ExplicitTop = -72
      ExplicitWidth = 606
      ExplicitHeight = 321
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 185
      Height = 423
      Align = alLeft
      Caption = ' Op'#231#245'es '
      TabOrder = 1
      ExplicitLeft = -5
      object Button3: TButton
        Left = 3
        Top = 379
        Width = 174
        Height = 25
        Caption = 'Limpar'
        TabOrder = 0
        OnClick = Button3Click
      end
      object Button1: TButton
        Left = 3
        Top = 24
        Width = 174
        Height = 25
        Caption = 'Criar JSON'
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 3
        Top = 55
        Width = 174
        Height = 25
        Caption = 'Ler JSON'
        TabOrder = 2
        OnClick = Button2Click
      end
    end
  end
end
