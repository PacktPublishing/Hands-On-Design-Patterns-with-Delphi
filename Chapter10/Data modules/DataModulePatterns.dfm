object dmChapters: TdmChapters
  OldCreateOrder = False
  Height = 298
  Width = 473
  object CDSChapters: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Chapter'
        Attributes = [faUnNamed]
        DataType = ftInteger
      end
      item
        Name = 'Title'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 120
      end
      item
        Name = 'PatternGroup'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Patterns'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
        Fields = 'Chapter'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'Chapter'
    Params = <>
    StoreDefs = True
    Left = 64
    Top = 32
    object CDSChaptersChapter: TIntegerField
      DisplayWidth = 7
      FieldName = 'Chapter'
    end
    object CDSChaptersTitle: TStringField
      DisplayWidth = 56
      FieldName = 'Title'
      Size = 120
    end
    object CDSChaptersPatternGroup: TStringField
      DisplayWidth = 19
      FieldName = 'PatternGroup'
      Size = 50
    end
    object CDSChaptersPatterns: TStringField
      DisplayWidth = 100
      FieldName = 'Patterns'
      Size = 100
    end
  end
end
