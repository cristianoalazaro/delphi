object frmRelCategoria: TfrmRelCategoria
  Left = 0
  Top = 0
  Caption = 'frmRelCategoria'
  ClientHeight = 413
  ClientWidth = 770
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
  object Relatorio: TRLReport
    Left = -16
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dtsCategoria
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object Cabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 43
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 0
        Top = 8
        Width = 245
        Height = 24
        Caption = 'Listagem de Categorias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 34
        Width = 718
        Height = 9
        Align = faClientBottom
        DrawKind = dkLine
        Pen.Width = 2
      end
    end
    object Rodape: TRLBand
      Left = 38
      Top = 135
      Width = 718
      Height = 32
      BandType = btFooter
      object RLDraw2: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 9
        Align = faClientTop
        DrawKind = dkLine
        Pen.Width = 2
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 8
        Top = 12
        Width = 60
        Height = 16
        Info = itFullDate
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 633
        Top = 12
        Width = 39
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 680
        Top = 12
        Width = 36
        Height = 16
        Alignment = taRightJustify
        Info = itLastPageNumber
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 672
        Top = 12
        Width = 8
        Height = 16
        Caption = '-'
      end
      object RLLabel3: TRLLabel
        Left = 585
        Top = 12
        Width = 53
        Height = 16
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 113
      Width = 718
      Height = 22
      object RLDBText2: TRLDBText
        Left = 92
        Top = 3
        Width = 62
        Height = 16
        DataField = 'DESCRIPTION'
        DataSource = dtsCategoria
        Text = ''
      end
      object DBEdit1: TDBEdit
        Left = 184
        Top = 24
        Width = 134
        Height = 24
        DataField = 'ID'
        DataSource = dtsCategoria
        TabOrder = 1
      end
      object RLDBText1: TRLDBText
        Left = 3
        Top = 3
        Width = 16
        Height = 16
        DataField = 'ID'
        DataSource = dtsCategoria
        Text = ''
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 81
      Width = 718
      Height = 32
      BandType = btColumnHeader
      object RLPanel1: TRLPanel
        Left = 0
        Top = 0
        Width = 718
        Height = 32
        Align = faClient
        Color = clInfoBk
        ParentColor = False
        Transparent = False
        object RLLabel6: TRLLabel
          Left = 3
          Top = 11
          Width = 49
          Height = 16
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 92
          Top = 11
          Width = 66
          Height = 16
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
  object qryCategoria: TZQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT ID'
      '      ,DESCRIPTION'
      'FROM dbo.Categorias WITH (NOLOCK)')
    Params = <>
    Left = 336
    Top = 96
    object qryCategoriaID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryCategoriaDESCRIPTION: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRIPTION'
      Required = True
      Size = 50
    end
  end
  object dtsCategoria: TDataSource
    AutoEdit = False
    DataSet = qryCategoria
    Left = 424
    Top = 96
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.0.1 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 376
    Top = 152
  end
end
