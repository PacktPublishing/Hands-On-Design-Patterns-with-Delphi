object frmPainter: TfrmPainter
  Left = 0
  Top = 0
  Caption = 'Painter'
  ClientHeight = 499
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object PaintImage: TImage
    Left = 0
    Top = 41
    Width = 635
    Height = 458
    Align = alClient
    OnMouseDown = PaintImageMouseDown
    OnMouseMove = PaintImageMouseMove
    OnMouseUp = PaintImageMouseUp
    ExplicitLeft = 24
    ExplicitTop = 104
    ExplicitWidth = 257
    ExplicitHeight = 345
  end
  object pnlToolbar: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 248
    ExplicitWidth = 185
    object btnSquare: TButton
      Left = 8
      Top = 9
      Width = 121
      Height = 25
      Caption = 'Draw squares'
      TabOrder = 0
      OnClick = btnSquareClick
    end
    object btnCircles: TButton
      Left = 144
      Top = 9
      Width = 121
      Height = 25
      Caption = 'Draw circles'
      TabOrder = 1
      OnClick = btnCirclesClick
    end
  end
end
