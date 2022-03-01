object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Calculadora Simplificada'
  ClientHeight = 140
  ClientWidth = 233
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblValorX: TLabel
    Left = 16
    Top = 8
    Width = 37
    Height = 13
    Caption = 'Valor X:'
  end
  object lblValorY: TLabel
    Left = 16
    Top = 48
    Width = 37
    Height = 13
    Caption = 'Valor Y:'
  end
  object lblResultado: TLabel
    Left = 17
    Top = 96
    Width = 52
    Height = 13
    Caption = 'Resultado:'
  end
  object btnSomar: TButton
    Left = 143
    Top = 24
    Width = 30
    Height = 25
    Caption = '+'
    TabOrder = 0
    OnClick = btnSomarClick
  end
  object btnSubtrair: TButton
    Left = 144
    Top = 55
    Width = 30
    Height = 25
    Caption = '-'
    TabOrder = 1
    OnClick = btnSubtrairClick
  end
  object btnMultiplicar: TButton
    Left = 180
    Top = 24
    Width = 30
    Height = 25
    Caption = '*'
    TabOrder = 2
    OnClick = btnMultiplicarClick
  end
  object btnDividir: TButton
    Left = 180
    Top = 55
    Width = 30
    Height = 25
    Caption = '/'
    TabOrder = 3
    OnClick = btnDividirClick
  end
  object edtValorX: TEdit
    Left = 16
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '10'
  end
  object edtValorY: TEdit
    Left = 17
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '5'
  end
  object edtResultado: TEdit
    Left = 75
    Top = 94
    Width = 63
    Height = 21
    TabOrder = 6
  end
end
