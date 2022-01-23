object frmRelCadClienteFicha: TfrmRelCadClienteFicha
  Left = 0
  Top = 0
  Caption = 'frmRelCadClienteFicha'
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
    Font.Height = -11
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
        Width = 179
        Height = 24
        Caption = 'Ficha de Clientes'
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
      Top = 199
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
        Width = 49
        Height = 14
        Info = itFullDate
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 600
        Top = 12
        Width = 72
        Height = 14
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 623
        Top = 12
        Width = 93
        Height = 14
        Alignment = taRightJustify
        Info = itLastPageNumber
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 672
        Top = 12
        Width = 7
        Height = 14
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
      Top = 81
      Width = 718
      Height = 118
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object RLDBText2: TRLDBText
        Left = 276
        Top = 6
        Width = 38
        Height = 16
        DataField = 'Nome'
        DataSource = dtsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText1: TRLDBText
        Left = 65
        Top = 6
        Width = 16
        Height = 16
        DataField = 'ID'
        DataSource = dtsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 278
        Top = 68
        Width = 37
        Height = 16
        DataField = 'Email'
        DataSource = dtsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 76
        Top = 68
        Width = 52
        Height = 16
        DataField = 'Telefone'
        DataSource = dtsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel6: TRLLabel
        Left = 6
        Top = 6
        Width = 53
        Height = 16
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 227
        Top = 6
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
        Left = 226
        Top = 68
        Width = 48
        Height = 16
        Caption = 'E-mail:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 6
        Top = 68
        Width = 64
        Height = 16
        Caption = 'Telefone:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText5: TRLDBText
        Left = 51
        Top = 26
        Width = 31
        Height = 16
        DataField = 'CEP'
        DataSource = dtsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel8: TRLLabel
        Left = 6
        Top = 26
        Width = 34
        Height = 16
        Caption = 'CEP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 152
        Top = 26
        Width = 82
        Height = 16
        Caption = 'Logradouro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText6: TRLDBText
        Left = 239
        Top = 26
        Width = 59
        Height = 16
        DataField = 'Endereco'
        DataSource = dtsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel10: TRLLabel
        Left = 6
        Top = 47
        Width = 47
        Height = 16
        Caption = 'Bairro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText7: TRLDBText
        Left = 63
        Top = 47
        Width = 38
        Height = 16
        DataField = 'Bairro'
        DataSource = dtsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel11: TRLLabel
        Left = 212
        Top = 47
        Width = 53
        Height = 16
        Caption = 'Cidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText8: TRLDBText
        Left = 274
        Top = 47
        Width = 44
        Height = 16
        DataField = 'Cidade'
        DataSource = dtsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel12: TRLLabel
        Left = 576
        Top = 47
        Width = 25
        Height = 16
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText9: TRLDBText
        Left = 608
        Top = 47
        Width = 45
        Height = 16
        DataField = 'Estado'
        DataSource = dtsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel13: TRLLabel
        Left = 6
        Top = 88
        Width = 135
        Height = 16
        Caption = 'Data de Nascimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText10: TRLDBText
        Left = 146
        Top = 88
        Width = 100
        Height = 16
        DataField = 'DataNascimento'
        DataSource = dtsCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDraw3: TRLDraw
        Left = 0
        Top = 101
        Width = 718
        Height = 17
        Align = faClientBottom
        DrawKind = dkLine
        Pen.Style = psDash
      end
      object RLAngleLabel1: TRLAngleLabel
        Left = 696
        Top = 6
        Width = 14
        Height = 92
        Angle = 90.000000000000000000
        Caption = 'FICHA DE CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object qryCliente: TZQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT ID'
      '      ,Nome'
      '      ,Endereco'
      '      ,Bairro'
      '      ,Cidade'
      '      ,CEP'
      '      ,Estado'
      '      ,Email'
      '      ,Telefone'
      '      ,DataNascimento'
      'FROM dbo.Clientes WITH (NOLOCK)'
      'ORDER BY Nome')
    Params = <>
    Left = 384
    Top = 240
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
    object qryClienteEndereco: TWideStringField
      FieldName = 'Endereco'
      Size = 60
    end
    object qryClienteBairro: TWideStringField
      FieldName = 'Bairro'
      Size = 40
    end
    object qryClienteCidade: TWideStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object qryClienteEstado: TWideStringField
      FieldName = 'Estado'
      Size = 2
    end
    object qryClienteDataNascimento: TDateTimeField
      FieldName = 'DataNascimento'
    end
    object qryClienteCEP: TWideStringField
      FieldName = 'CEP'
      Size = 9
    end
  end
  object dtsCliente: TDataSource
    AutoEdit = False
    DataSet = qryCliente
    Left = 472
    Top = 248
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.0.1 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 424
    Top = 288
  end
  object RLXLSXFilter1: TRLXLSXFilter
    DisplayName = 'Planilha Excel'
    Left = 424
    Top = 344
  end
end
