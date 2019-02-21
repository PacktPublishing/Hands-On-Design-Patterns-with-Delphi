object frmFacade: TfrmFacade
  Left = 0
  Top = 0
  Caption = 'Facade pattern'
  ClientHeight = 486
  ClientWidth = 641
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    641
    486)
  PixelsPerInch = 96
  TextHeight = 13
  object btnReadRSSWeb: TButton
    Left = 16
    Top = 16
    Width = 137
    Height = 49
    Caption = 'Read RSS from web'
    TabOrder = 0
    OnClick = btnReadRSSWebClick
  end
  object lbTitles: TListBox
    Left = 167
    Top = 16
    Width = 459
    Height = 139
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 1
    OnClick = lbTitlesClick
  end
  object inpLink: TEdit
    Left = 167
    Top = 161
    Width = 378
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object btnOpenLink: TButton
    Left = 551
    Top = 159
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Go!'
    TabOrder = 3
    OnClick = btnOpenLinkClick
  end
  object inpDescription: TMemo
    Left = 167
    Top = 190
    Width = 459
    Height = 283
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
  end
  object btnReadRSSFile: TButton
    Left = 16
    Top = 80
    Width = 137
    Height = 49
    Caption = 'Read RSS from file'
    TabOrder = 5
    OnClick = btnReadRSSFileClick
  end
  object FileSaveDialog1: TFileSaveDialog
    DefaultExtension = '.rss'
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'RSS file'
        FileMask = '*.rss'
      end>
    Options = [fdoOverWritePrompt, fdoPathMustExist]
    Title = 'Save RSS file'
    Left = 48
    Top = 152
  end
  object FileOpenDialog1: TFileOpenDialog
    DefaultExtension = '.rss'
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'RSS files'
        FileMask = '*.rss'
      end>
    Options = [fdoPathMustExist, fdoFileMustExist]
    Title = 'Select RSS file'
    Left = 48
    Top = 224
  end
end
