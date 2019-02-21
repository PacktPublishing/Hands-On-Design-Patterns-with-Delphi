object frmSingleton: TfrmSingleton
  Left = 0
  Top = 0
  Caption = 'Singleton'
  ClientHeight = 468
  ClientWidth = 836
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    836
    468)
  PixelsPerInch = 96
  TextHeight = 13
  object GridPanel1: TGridPanel
    Left = 8
    Top = 8
    Width = 201
    Height = 401
    ColumnCollection = <
      item
        SizeStyle = ssAbsolute
        Value = 200.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = GridPanel3
        Row = 5
      end
      item
        Column = 0
        Control = GridPanel7
        Row = 4
      end
      item
        Column = 0
        Control = GridPanel8
        Row = 3
      end
      item
        Column = 0
        Control = GridPanel6
        Row = 2
      end
      item
        Column = 0
        Control = GridPanel4
        Row = 1
      end>
    RowCollection = <
      item
        SizeStyle = ssAbsolute
      end
      item
        SizeStyle = ssAbsolute
        Value = 64.000000000000000000
      end
      item
        SizeStyle = ssAbsolute
        Value = 64.000000000000000000
      end
      item
        SizeStyle = ssAbsolute
        Value = 64.000000000000000000
      end
      item
        SizeStyle = ssAbsolute
        Value = 64.000000000000000000
      end
      item
        SizeStyle = ssAbsolute
        Value = 64.000000000000000000
      end
      item
        SizeStyle = ssAbsolute
        Value = 64.000000000000000000
      end>
    TabOrder = 0
    object GridPanel3: TGridPanel
      Left = 1
      Top = 257
      Width = 200
      Height = 64
      Align = alClient
      ColumnCollection = <
        item
          Value = 100.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = Label2
          Row = 0
        end
        item
          Column = 0
          Control = btnTestFactory
          Row = 1
        end>
      RowCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      TabOrder = 0
      object Label2: TLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 190
        Height = 23
        Margins.Left = 5
        Margins.Top = 5
        Align = alClient
        Caption = 'Singleton_Factory'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 114
        ExplicitHeight = 18
      end
      object btnTestFactory: TButton
        Left = 1
        Top = 32
        Width = 198
        Height = 31
        Align = alClient
        Caption = 'Test Factory'
        TabOrder = 0
        OnClick = btnTestFactoryClick
      end
    end
    object GridPanel7: TGridPanel
      Left = 1
      Top = 193
      Width = 200
      Height = 64
      Align = alClient
      ColumnCollection = <
        item
          Value = 100.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = Label6
          Row = 0
        end
        item
          Column = 0
          Control = btnTestNewInstanceCount
          Row = 1
        end>
      RowCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      TabOrder = 1
      object Label6: TLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 190
        Height = 23
        Margins.Left = 5
        Margins.Top = 5
        Align = alClient
        Caption = 'Singleton_NewInstanceCount'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 188
        ExplicitHeight = 18
      end
      object btnTestNewInstanceCount: TButton
        Left = 1
        Top = 32
        Width = 198
        Height = 31
        Align = alClient
        Caption = 'Test NewInstanceCount'
        TabOrder = 0
        OnClick = btnTestNewInstanceCountClick
      end
    end
    object GridPanel8: TGridPanel
      Left = 1
      Top = 129
      Width = 200
      Height = 64
      Align = alClient
      ColumnCollection = <
        item
          Value = 100.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = Label7
          Row = 0
        end
        item
          Column = 0
          Control = btnTestNewInstance
          Row = 1
        end>
      RowCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      TabOrder = 2
      object Label7: TLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 190
        Height = 23
        Margins.Left = 5
        Margins.Top = 5
        Align = alClient
        Caption = 'Singleton_NewInstance'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 150
        ExplicitHeight = 18
      end
      object btnTestNewInstance: TButton
        Left = 1
        Top = 32
        Width = 198
        Height = 31
        Align = alClient
        Caption = 'Test NewInstance'
        TabOrder = 0
        OnClick = btnTestNewInstanceClick
      end
    end
    object GridPanel6: TGridPanel
      Left = 1
      Top = 65
      Width = 200
      Height = 64
      Align = alClient
      ColumnCollection = <
        item
          Value = 100.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = Label5
          Row = 0
        end
        item
          Column = 0
          Control = btnTestClassVar
          Row = 1
        end>
      RowCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      TabOrder = 3
      object Label5: TLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 190
        Height = 23
        Margins.Left = 5
        Margins.Top = 5
        Align = alClient
        Caption = 'Singleton_ClassVar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 120
        ExplicitHeight = 18
      end
      object btnTestClassVar: TButton
        Left = 1
        Top = 32
        Width = 198
        Height = 31
        Align = alClient
        Caption = 'Test ClassVar'
        TabOrder = 0
        OnClick = btnTestClassVarClick
      end
    end
    object GridPanel4: TGridPanel
      Left = 1
      Top = 1
      Width = 200
      Height = 64
      Align = alClient
      ColumnCollection = <
        item
          Value = 100.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = Label3
          Row = 0
        end
        item
          Column = 0
          Control = btnTestHiddenCreate
          Row = 1
        end>
      RowCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      TabOrder = 4
      object Label3: TLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 190
        Height = 23
        Margins.Left = 5
        Margins.Top = 5
        Align = alClient
        Caption = 'Singleton_HiddenCreate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 152
        ExplicitHeight = 18
      end
      object btnTestHiddenCreate: TButton
        Left = 1
        Top = 32
        Width = 198
        Height = 31
        Align = alClient
        Caption = 'Test HiddenCreate'
        TabOrder = 0
        OnClick = btnTestHiddenCreateClick
      end
    end
  end
  object ListBox1: TListBox
    Left = 215
    Top = 8
    Width = 613
    Height = 453
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 1
  end
  object btnNewForm: TButton
    Left = 8
    Top = 428
    Width = 201
    Height = 33
    Caption = 'NewForm'
    TabOrder = 2
    OnClick = btnNewFormClick
  end
end
