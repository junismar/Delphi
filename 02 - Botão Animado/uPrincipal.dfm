object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Bot'#227'o Animado'
  ClientHeight = 449
  ClientWidth = 755
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
  object btnMover: TButton
    Left = 680
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = btnMoverClick
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 560
    Top = 64
  end
end
