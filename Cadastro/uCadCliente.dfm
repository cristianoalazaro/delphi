inherited frmCadCliente: TfrmCadCliente
  Caption = 'Cadastro de Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    inherited tabManutencao: TTabSheet
      object Label1: TLabel
        Left = 305
        Top = 50
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object Label2: TLabel
        Left = 305
        Top = 135
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object Label3: TLabel
        Left = 12
        Top = 217
        Width = 81
        Height = 13
        Caption = 'Data Nascimento'
      end
      object edtCategoriaId: TLabeledEdit
        Tag = 1
        Left = 12
        Top = 21
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object edtDescricao: TLabeledEdit
        Tag = 2
        Left = 12
        Top = 66
        Width = 276
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 60
        TabOrder = 1
      end
      object mskCep: TMaskEdit
        Left = 305
        Top = 66
        Width = 267
        Height = 21
        EditMask = '99999\-999;1;_'
        MaxLength = 9
        TabOrder = 2
        Text = '     -   '
      end
      object edtEndereco: TLabeledEdit
        Left = 12
        Top = 110
        Width = 276
        Height = 21
        EditLabel.Width = 45
        EditLabel.Height = 13
        EditLabel.Caption = 'Endere'#231'o'
        MaxLength = 60
        TabOrder = 3
      end
      object edtBairro: TLabeledEdit
        Left = 305
        Top = 110
        Width = 267
        Height = 21
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'Bairro'
        MaxLength = 40
        TabOrder = 4
      end
      object edtCidade: TLabeledEdit
        Left = 12
        Top = 151
        Width = 276
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Cidade'
        MaxLength = 50
        TabOrder = 5
      end
      object mskTelefone: TMaskEdit
        Left = 305
        Top = 151
        Width = 264
        Height = 21
        EditMask = '!\(99\)9999-9999;1;_'
        MaxLength = 13
        TabOrder = 6
        Text = '(  )    -    '
      end
      object edtEmail: TLabeledEdit
        Left = 12
        Top = 192
        Width = 276
        Height = 21
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'E-mail'
        MaxLength = 100
        TabOrder = 7
      end
      object edtNascimento: TDateEdit
        Left = 12
        Top = 233
        Width = 121
        Height = 21
        ClickKey = 114
        DialogTitle = 'Selecione a data'
        NumGlyphs = 2
        CalendarStyle = csDialog
        TabOrder = 8
      end
    end
  end
  inherited pnlRodape: TPanel
    inherited btnFechar: TBitBtn
      TabOrder = 6
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
      TabOrder = 5
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      'SELECT ID '
      '      ,Nome '
      '      ,Endereco '
      '      ,Cidade '
      '      ,Bairro '
      '      ,Estado '
      '      ,Telefone '
      '      ,Email '#9
      'from dbo.Clientes WITH (NOLOCK)')
  end
end
