object frmCommand: TfrmCommand
  Left = 0
  Top = 0
  Caption = 'Command pattern'
  ClientHeight = 224
  ClientWidth = 402
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  DesignSize = (
    402
    224)
  PixelsPerInch = 96
  TextHeight = 13
  object btnUndo: TButton
    Left = 16
    Top = 16
    Width = 156
    Height = 49
    Action = actUndo
    TabOrder = 0
  end
  object btnMacro: TButton
    Left = 16
    Top = 71
    Width = 75
    Height = 50
    Action = actRecord
    TabOrder = 1
  end
  object btnPlay: TButton
    Left = 97
    Top = 71
    Width = 75
    Height = 50
    Action = actPlay
    TabOrder = 2
  end
  object PageControl1: TPageControl
    Left = 192
    Top = 16
    Width = 193
    Height = 193
    ActivePage = TabSheet2
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Editor 1'
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 185
        Height = 165
        Align = alClient
        ReadOnly = True
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Editor 2'
      ImageIndex = 1
      object Memo2: TMemo
        Left = 0
        Top = 0
        Width = 185
        Height = 165
        Align = alClient
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  object ActionList1: TActionList
    Left = 104
    Top = 152
    object actUndo: TAction
      Caption = 'Undo'
      OnExecute = actUndoExecute
      OnUpdate = actUndoUpdate
    end
    object actRecord: TAction
      Caption = 'Record'
      OnExecute = actRecordExecute
    end
    object actStop: TAction
      Caption = 'Stop'
      OnExecute = actStopExecute
    end
    object actPlay: TAction
      Caption = 'Play'
      OnExecute = actPlayExecute
      OnUpdate = actPlayUpdate
    end
  end
end
