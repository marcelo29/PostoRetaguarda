object frmAbastecimento: TfrmAbastecimento
  Left = 469
  Top = 234
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Abastecimento'
  ClientHeight = 212
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object tanque: TLabel
    Left = 23
    Top = 88
    Width = 33
    Height = 13
    Caption = 'Bomba'
  end
  object Bomba: TLabel
    Left = 24
    Top = 38
    Width = 37
    Height = 13
    Caption = 'Tanque'
  end
  object Label3: TLabel
    Left = 24
    Top = 128
    Width = 79
    Height = 13
    Caption = 'Valor abastecido'
  end
  object spBtnTanques: TSpeedButton
    Left = 240
    Top = 32
    Width = 23
    Height = 21
    Glyph.Data = {
      C6010000424DC601000000000000C60000002800000010000000100000000100
      08000000000000010000340B0000340B0000240000002400000000000000FFFF
      FF00FF00FF00FBFBFB00F7F7F700F3F3F300EEEEEE00EAEAEA00E6E6E600E2E2
      E200DADADA00D6D6D600D2D2D200CECECE00CDCDCD00CACACA00C9C9C900C5C5
      C500C1C1C100BDBDBD00B9B9B900B5B5B500B1B1B100ADADAD00A9A9A900A8A8
      A800A4A4A400A0A0A0009898980090909000888888007F7F7F00777777006666
      660062626200FFFFFF00022219020202020202020202020202021C1F20170202
      020202020202020202021A191E201702020202020202020202020219191F2017
      020202020202020202020202191A1F2019020202020202020202020202191A1F
      21021D1613150202020202020202190C1C1B090707070C140202020202020212
      13090707070604051B020202020202180B0D0807060403010E02020202020212
      0B11080605030304081702020202020F0B140B07060505060816020202020211
      0A14110906060606081602020202021709090D100B0807070C02020202020202
      1101041114100A091A02020202020202021008090B0A0B150202020202020202
      02021615121202020202}
    OnClick = spBtnTanquesClick
  end
  object spBtnBombas: TSpeedButton
    Left = 240
    Top = 80
    Width = 23
    Height = 21
    Glyph.Data = {
      C6010000424DC601000000000000C60000002800000010000000100000000100
      08000000000000010000340B0000340B0000240000002400000000000000FFFF
      FF00FF00FF00FBFBFB00F7F7F700F3F3F300EEEEEE00EAEAEA00E6E6E600E2E2
      E200DADADA00D6D6D600D2D2D200CECECE00CDCDCD00CACACA00C9C9C900C5C5
      C500C1C1C100BDBDBD00B9B9B900B5B5B500B1B1B100ADADAD00A9A9A900A8A8
      A800A4A4A400A0A0A0009898980090909000888888007F7F7F00777777006666
      660062626200FFFFFF00022219020202020202020202020202021C1F20170202
      020202020202020202021A191E201702020202020202020202020219191F2017
      020202020202020202020202191A1F2019020202020202020202020202191A1F
      21021D1613150202020202020202190C1C1B090707070C140202020202020212
      13090707070604051B020202020202180B0D0807060403010E02020202020212
      0B11080605030304081702020202020F0B140B07060505060816020202020211
      0A14110906060606081602020202021709090D100B0807070C02020202020202
      1101041114100A091A02020202020202021008090B0A0B150202020202020202
      02021615121202020202}
    OnClick = spBtnBombasClick
  end
  object btnConfirmar: TButton
    Left = 111
    Top = 155
    Width = 56
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 3
    OnClick = btnConfirmarClick
  end
  object cbTanque: TComboBox
    Left = 110
    Top = 32
    Width = 121
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    OnChange = cbTanqueChange
  end
  object edtValor: TEdit
    Left = 111
    Top = 124
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object cbBomba: TComboBox
    Left = 111
    Top = 80
    Width = 119
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object btnCancelar: TButton
    Left = 176
    Top = 155
    Width = 56
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = btnCancelarClick
  end
  object sqlQryBomba: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'idTanque'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT ID_BOMBA FROM TANQUE_BOMBA'
      'WHERE ID_TANQUE = :idTanque')
    SQLConnection = dmPrincipal.sqlConn
    Left = 8
    Top = 176
    object sqlQryBombaID_BOMBA: TIntegerField
      FieldName = 'ID_BOMBA'
      Required = True
    end
  end
  object sqlQryTanque: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select id, valor_do_litro from tanque;')
    SQLConnection = dmPrincipal.sqlConn
    Left = 40
    Top = 176
    object sqlQryTanqueID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sqlQryTanqueVALOR_DO_LITRO: TFloatField
      FieldName = 'VALOR_DO_LITRO'
    end
  end
  object sqlDsAbastecimento: TSQLDataSet
    CommandText = 
      'INSERT INTO ABASTECIMENTO (ID_TANQUE, ID_BOMBA, VALOR_ABASTECIDO' +
      ', DIA, IMPOSTO, LITROS) VALUES (:ID_TANQUE,:ID_BOMBA,:VALOR_ABAS' +
      'TECIDO, :DIA, :IMPOSTO, :LITROS);'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_TANQUE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_BOMBA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'VALOR_ABASTECIDO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DIA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'IMPOSTO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'LITROS'
        ParamType = ptInput
      end>
    SQLConnection = dmPrincipal.sqlConn
    Left = 72
    Top = 177
  end
end
