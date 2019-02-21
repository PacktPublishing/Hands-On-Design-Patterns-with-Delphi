object frmDataModulesMain: TfrmDataModulesMain
  Left = 0
  Top = 0
  Caption = 'Data modules'
  ClientHeight = 353
  ClientWidth = 642
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  DesignSize = (
    642
    353)
  PixelsPerInch = 96
  TextHeight = 13
  object btnLoadDM: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 49
    Action = actLoadDM
    TabOrder = 0
    OnClick = btnLoadDMClick
  end
  object btnOpenData: TButton
    Left = 16
    Top = 71
    Width = 137
    Height = 49
    Action = actOpenData
    TabOrder = 1
  end
  object Button3: TButton
    Left = 16
    Top = 126
    Width = 137
    Height = 49
    Action = actGetChapters
    TabOrder = 2
  end
  object Button4: TButton
    Left = 16
    Top = 181
    Width = 137
    Height = 49
    Action = actGetPatterns
    TabOrder = 3
  end
  object Button5: TButton
    Left = 16
    Top = 236
    Width = 137
    Height = 49
    Action = actCloseData
    TabOrder = 4
  end
  object Button6: TButton
    Left = 16
    Top = 291
    Width = 137
    Height = 49
    Action = actUnloadDM
    TabOrder = 5
  end
  object lbLog: TListBox
    Left = 168
    Top = 16
    Width = 459
    Height = 324
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 6
  end
  object ActionList1: TActionList
    Left = 192
    Top = 32
    object actLoadDM: TAction
      Caption = 'Load data module'
      OnUpdate = actLoadDMUpdate
    end
    object actOpenData: TAction
      Caption = 'Open data set'
      OnExecute = actOpenDataExecute
      OnUpdate = actOpenDataUpdate
    end
    object actGetChapters: TAction
      Caption = 'Get chapters'
      OnExecute = actGetChaptersExecute
      OnUpdate = RequiresOpenDataSet
    end
    object actGetPatterns: TAction
      Caption = 'Get patterns'
      OnExecute = actGetPatternsExecute
      OnUpdate = RequiresOpenDataSet
    end
    object actCloseData: TAction
      Caption = 'Close data set'
      OnExecute = actCloseDataExecute
      OnUpdate = RequiresOpenDataSet
    end
    object actUnloadDM: TAction
      Caption = 'Unload data module'
      OnExecute = actUnloadDMExecute
      OnUpdate = actUnloadDMUpdate
    end
  end
end
