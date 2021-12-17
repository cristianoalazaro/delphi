inherited frmProVenda: TfrmProVenda
  Caption = 'Vendas'
  ClientWidth = 656
  ExplicitWidth = 662
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 656
    ActivePage = tabManutencao
    ExplicitTop = 8
    ExplicitWidth = 656
    inherited tabListagem: TTabSheet
      ExplicitWidth = 648
      inherited pnlListagemTopo: TPanel
        Width = 648
        ExplicitWidth = 648
      end
      inherited grdListagem: TDBGrid
        Width = 648
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ClienteID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Venda'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total_Venda'
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 648
      object Cliente: TLabel
        Left = 111
        Top = 5
        Width = 33
        Height = 13
        Caption = 'Cliente'
      end
      object Label3: TLabel
        Left = 460
        Top = 5
        Width = 56
        Height = 13
        Caption = 'Data Venda'
      end
      object edtVendaID: TLabeledEdit
        Tag = 1
        Left = 12
        Top = 21
        Width = 93
        Height = 21
        EditLabel.Width = 70
        EditLabel.Height = 13
        EditLabel.Caption = 'N'#250'mero Venda'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object dboCliente: TDBLookupComboBox
        Left = 111
        Top = 21
        Width = 394
        Height = 21
        KeyField = 'ID'
        ListField = 'Nome'
        ListSource = dtmVenda.dtsCliente
        TabOrder = 1
      end
      object edtDataVenda: TDateEdit
        Left = 521
        Top = 21
        Width = 121
        Height = 21
        ClickKey = 114
        DialogTitle = 'Selecione a data'
        NumGlyphs = 2
        CalendarStyle = csDialog
        TabOrder = 2
      end
      object Panel1: TPanel
        Left = 0
        Top = 56
        Width = 648
        Height = 220
        Align = alBottom
        TabOrder = 3
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 646
          Height = 41
          Align = alTop
          TabOrder = 0
          object Label2: TLabel
            Left = 1
            Top = -1
            Width = 33
            Height = 13
            Caption = 'Cliente'
          end
          object Label4: TLabel
            Left = 249
            Top = -1
            Width = 64
            Height = 13
            Caption = 'Valor Unit'#225'rio'
            OnClick = btnAlterarClick
          end
          object Label5: TLabel
            Left = 337
            Top = -1
            Width = 56
            Height = 13
            Caption = 'Quantidade'
            OnClick = btnAlterarClick
          end
          object Label6: TLabel
            Left = 422
            Top = -1
            Width = 65
            Height = 13
            Caption = 'Total Produto'
            OnClick = btnAlterarClick
          end
          object dboProduto: TDBLookupComboBox
            Left = 1
            Top = 14
            Width = 240
            Height = 21
            KeyField = 'ID'
            ListField = 'Nome'
            ListSource = dtmVenda.dtsProduto
            TabOrder = 0
          end
          object edtValorUnitario: TCurrencyEdit
            Left = 247
            Top = 14
            Width = 74
            Height = 21
            TabOrder = 1
          end
          object edtQuantidade: TCurrencyEdit
            Left = 335
            Top = 14
            Width = 73
            Height = 21
            DisplayFormat = ' ,0.00;-R$ ,0.00'
            TabOrder = 2
          end
          object edtTotalProduto: TCurrencyEdit
            Left = 422
            Top = 14
            Width = 72
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 3
          end
          object BitBtn1: TBitBtn
            Left = 499
            Top = 12
            Width = 70
            Height = 25
            Caption = 'A&dicionar'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000828282828282
              8282828181818181818181818181818988888585858585858585858585858585
              858585858585857D7D7D8F8F8FFDFDFDF9F9F9F9F9F9F9F9F9F9F9F9F9F9F985
              8585D7D2D1CEC9C8A9A5A49D9A99ADAAAA9396929D9B9B858585999999F9F9F9
              E7E7E7E8E8E8E8E8E8E8E8E8E8E8E88585858988886666666666668E8C8CC7C4
              C3A1B3A3ADACAC858585A2A2A2FAFAFAEAEAEAEBEBEBEBEBEBEBEBEBEBEBEB85
              85858282829B9A9A949494828282BFBCBBB9B6B6A5A4A45A5A5AAAAAAAFAFAFA
              EDEDEDEDEDEDEEEEEEEEEEEEEDEDED858585828282A2A2A1999998828282AFAD
              ADAAA9A99F9C9E828282AFAFAFFBFBFBEFEFEFF0F0F0F0F0F0F0F0F0F0F0F085
              85858282828F8F8E8382828282828D8D8D868686858585909091B5B5B5FCFCFC
              F1F1F1F2F2F2F2F2F2F2F2F2F2F2F27D7D7D6E6C6B9796967473736E6C6B7F7F
              7FFF00FFFF00FFA3A3A4B8B8B8FCFCFCF3F3F3F4F4F4F5F5F5F5F5F5F4F4F4F4
              F4F46E6C6BA5DBB385B58F6E6C6BB8B8B8FF00FFFF00FFB5B5B5BBBBBBFCFCFC
              F5F5F5F6F6F6F6F6F6F6F6F6F6F6F6F6F6F66E6C6BB1B1B1ACABAB6E6C6BBABA
              BAFF00FFFF00FF9E9E9EBDBDBDFDFDFDF7F7F7F8F8F8F8F8F8F8F8F8F8F8F8F7
              F7F7706D6C706D6C706D6C6E6C6BBDBDBDFF00FFFF00FFB8B8B9BEBEBEFDFDFD
              F8F8F8F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F8F8F8F6F6F6504F4EFCFCFCBEBE
              BEFF00FFFF00FFB8B8B9BFBFBFFDFDFDF9F9F9FAFAFAFAFAFAFBFBFBFAFAFAFA
              FAFAF9F9F9F8F8F8424141FDFDFDBFBFBFFF00FFFF00FFC3C4C4C0C0C0FEFEFE
              FAFAFAFBFBFBFBFBFBFBFBFBFBFBFBFAFAFAF9F9F9C0C0C0CBCBCBDBDBDBBFBF
              BFFF00FFFF00FFFF00FFC0C0C0FEFEFEFBFBFBFBFBFBFCFCFCFCFCFCFCFCFCFB
              FBFBFAFAFACBCBCBE2E2E2C0C0C0FF00FFFF00FFFF00FFFF00FFC0C0C0FFFFFF
              FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFAFAFADBDBDBC0C0C0FF00FFFF00
              FFFF00FFFF00FFFF00FFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            TabOrder = 4
          end
          object BitBtn2: TBitBtn
            Left = 574
            Top = 12
            Width = 67
            Height = 25
            Caption = 'Re&mover'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              4442BC3C3CAAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0303
              7B02028CFF00FFFF00FFFF00FF514FC52222C83030C84848B7FF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF1010870505A10101A204028DFF00FF5959CA2929D2
              1717D01616CE3838D15151BFFF00FFFF00FFFF00FFFF00FF2121940E0EA70101
              A60101A60101A204028D5555C34444DD1C1CDB1B1BD91A1AD53F3FD85757C4FF
              00FFFF00FF3434A41A1AB30202A80101A60101A602029F020278FF00FF6262CF
              4C4CE62121E31F1FDF1C1CDA4242DC5656C44848B72A2AC40A0AB60505AE0101
              A70505A003037BFF00FFFF00FFFF00FF6F6FD85656ED2424E82121E31D1DDD3F
              3FDA3838D31111C50D0DBC0808B40F0FA90D0D80FF00FFFF00FFFF00FFFF00FF
              FF00FF7777DD5959EF2626EA2121E41D1DDC1919D41414CB1010C21C1CB71D1D
              90FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7676DB5757EC2626EA21
              21E31C1CDA1717D02828C52B2B9DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF8888D97676EE3636ED2424E81E1EDE1919D52929C72B2B9EFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9191D98D8DED6E6EF26363F14F
              4FEE3636E52121D91616CD1F1FBD1D1D92FF00FFFF00FFFF00FFFF00FFFF00FF
              9797D79E9EEB8787F57D7DF47272F37777E66D6DE15555E34646D93434CE2B2B
              B822228FFF00FFFF00FFFF00FF9C9CD4ACACEA9C9CF79494F68A8AF58B8BE776
              76CA6868C26C6CDA5B5BDE5252D54848CC4141B82F2F91FF00FF9D9DD0B4B4E7
              AEAEF8A7A7F89F9FF79B9BE68181CBFF00FFFF00FF6262B86B6BD25D5DD75151
              CE4747C54141B4323293A9A9C7B8B8EFB5B5F9AFAFF8A8A8E58888CCFF00FFFF
              00FFFF00FFFF00FF5959B06565CB5555CE4B4BC54545BB4343A4FF00FFAAA9C6
              BABAEEB1B1E48F8FCAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5656AD5C5C
              C54F4FC14D4DAAFF00FFFF00FFFF00FFACABC69898CEFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FF5050A95858AFFF00FFFF00FF}
            TabOrder = 5
            TabStop = False
          end
        end
        object Panel3: TPanel
          Left = 1
          Top = 42
          Width = 646
          Height = 136
          Align = alClient
          TabOrder = 1
          object dbGridItemVendas: TDBGrid
            Left = 1
            Top = 1
            Width = 644
            Height = 134
            Align = alClient
            DataSource = dtmVenda.dtsItemsVenda
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnKeyDown = dbGridItemVendasKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'ProdutoID'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NomeProduto'
                Width = 217
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Quantidade'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ValorUnitario'
                Width = 74
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ValorTotalProduto'
                Width = 122
                Visible = True
              end>
          end
        end
        object Panel4: TPanel
          Left = 1
          Top = 178
          Width = 646
          Height = 41
          Align = alBottom
          TabOrder = 2
          object Label1: TLabel
            Left = 369
            Top = 13
            Width = 84
            Height = 13
            Caption = 'Valor da Venda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtValorTotal: TCurrencyEdit
            Left = 459
            Top = 10
            Width = 121
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited pnlRodape: TPanel
    Width = 656
    ExplicitWidth = 656
    inherited btnFechar: TBitBtn
      Left = 582
      TabOrder = 6
      ExplicitLeft = 582
    end
    inherited btnNavigator: TDBNavigator
      Left = 388
      Hints.Strings = ()
      TabOrder = 5
      ExplicitLeft = 388
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      'SELECT Vendas.ID'
      '      ,Vendas.ClienteID'
      '      ,Clientes.Nome'
      '      ,Vendas.Data_Venda'
      '      ,Vendas.Total_Venda'
      'FROM dbo.Vendas WITH (NOLOCK)'
      'INNER JOIN dbo.Clientes WITH(NOLOCK)'
      'ON Clientes.ID = Vendas.ClienteID')
    object qryListagemID: TIntegerField
      DisplayLabel = 'N'#250'mero Venda'
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryListagemClienteID: TIntegerField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'ClienteID'
      Required = True
    end
    object qryListagemNome: TWideStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'Nome'
      Size = 60
    end
    object qryListagemData_Venda: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'Data_Venda'
    end
    object qryListagemTotal_Venda: TFloatField
      DisplayLabel = 'Total da Venda'
      FieldName = 'Total_Venda'
    end
  end
end
