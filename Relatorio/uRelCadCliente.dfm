object frmRelCadCliente: TfrmRelCadCliente
  Left = 0
  Top = 0
  Caption = 'frmRelCadCliente'
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
    DataSource = dtsCliente
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
        Width = 217
        Height = 24
        Caption = 'Listagem de Clientes'
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
        Width = 38
        Height = 16
        DataField = 'Nome'
        DataSource = dtsCliente
        Text = ''
      end
      object DBEdit1: TDBEdit
        Left = 184
        Top = 24
        Width = 134
        Height = 24
        DataField = 'ID'
        DataSource = dtsCliente
        TabOrder = 1
      end
      object RLDBText1: TRLDBText
        Left = 3
        Top = 3
        Width = 16
        Height = 16
        DataField = 'ID'
        DataSource = dtsCliente
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 302
        Top = 3
        Width = 41
        Height = 16
        DataField = 'Email'
        DataSource = dtsCliente
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 560
        Top = 3
        Width = 52
        Height = 16
        DataField = 'Telefone'
        DataSource = dtsCliente
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
          Top = 10
          Width = 41
          Height = 16
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 303
          Top = 11
          Width = 44
          Height = 16
          Caption = 'E-mail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 560
          Top = 11
          Width = 60
          Height = 16
          Caption = 'Telefone'
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
  object qryCliente: TZQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT ID'
      '      ,Nome'
      '      ,Email'
      '      ,Telefone'
      'FROM dbo.Clientes WITH (NOLOCK)'
      'ORDER BY Nome')
    Params = <>
    Left = 336
    Top = 104
    object qryClienteID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryClienteNome: TWideStringField
      FieldName = 'Nome'
      Size = 60
    end
    object qryClienteEmail: TWideStringField
      DisplayLabel = 'E-mail'
      FieldName = 'Email'
      Size = 100
    end
    object qryClienteTelefone: TWideStringField
      FieldName = 'Telefone'
      Size = 14
    end
  end
  object dtsCliente: TDataSource
    AutoEdit = False
    DataSet = qryCliente
    Left = 424
    Top = 112
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.0.1 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 376
    Top = 152
  end
  object RLXLSXFilter1: TRLXLSXFilter
    DisplayName = 'Planilha Excel'
    Left = 376
    Top = 208
  end
end
