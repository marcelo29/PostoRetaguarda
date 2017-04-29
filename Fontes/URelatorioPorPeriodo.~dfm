object frmRelatorioPeriodo: TfrmRelatorioPeriodo
  Left = 1023
  Top = 257
  Align = alCustom
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio do periodo'
  ClientHeight = 125
  ClientWidth = 226
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblInicio: TLabel
    Left = 6
    Top = 22
    Width = 17
    Height = 13
    Caption = 'De:'
  end
  object lblFim: TLabel
    Left = 7
    Top = 54
    Width = 19
    Height = 13
    Caption = 'At'#233':'
  end
  object spdBtnPesquisar: TSpeedButton
    Left = 197
    Top = 81
    Width = 22
    Height = 20
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
    OnClick = spdBtnPesquisarClick
  end
  object dtpInicio: TDateTimePicker
    Left = 35
    Top = 16
    Width = 186
    Height = 21
    Date = 42829.000000000000000000
    Time = 42829.000000000000000000
    TabOrder = 0
  end
  object dtpFim: TDateTimePicker
    Left = 35
    Top = 48
    Width = 186
    Height = 21
    Date = 42832.000000000000000000
    Time = 42832.000000000000000000
    TabOrder = 1
  end
  object dsRelatorio: TDataSource
    AutoEdit = False
    DataSet = cdsRelatorio
    Left = 136
    Top = 54
  end
  object sqlQryRelatorio: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'DATA_INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_FIM'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      
        'SELECT AB.DIA, T.ID AS TANQUE, B.ID AS BOMBA, SUM(AB.VALOR_ABAST' +
        'ECIDO) AS VALOR_DIARIO'
      'FROM BOMBA B'
      'INNER JOIN ABASTECIMENTO AB'
      'ON B.ID = AB.ID_BOMBA'
      'INNER JOIN TANQUE T'
      'ON T.ID = AB.ID_TANQUE'
      'WHERE AB.DIA BETWEEN :DATA_INICIO AND :DATA_FIM'
      'GROUP BY AB.DIA, T.ID, B.ID'
      'ORDER BY AB.DIA, T.ID')
    SQLConnection = dmPrincipal.sqlConn
    Left = 102
    Top = 54
    object sqlQryRelatorioDIA: TDateField
      FieldName = 'DIA'
      Required = True
      EditMask = '!99/99/00;1;_'
    end
    object sqlQryRelatorioTANQUE: TIntegerField
      FieldName = 'TANQUE'
      Required = True
    end
    object sqlQryRelatorioBOMBA: TIntegerField
      FieldName = 'BOMBA'
      Required = True
    end
    object sqlQryRelatorioVALOR_DIARIO: TFloatField
      FieldName = 'VALOR_DIARIO'
      currency = True
    end
  end
  object sqlQryValorTotal: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_FIM'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SUM(AB.VALOR_ABASTECIDO) AS VALOR_PERIODO'
      'FROM BOMBA B, TANQUE T, ABASTECIMENTO AB'
      'WHERE B.ID = AB.ID_BOMBA AND T.ID = AB.ID_TANQUE'
      'AND AB.DIA BETWEEN :DATA_INICIO AND :DATA_FIM ')
    SQLConnection = dmPrincipal.sqlConn
    Left = 48
    Top = 76
    object sqlQryValorTotalVALOR_PERIODO: TFloatField
      FieldName = 'VALOR_PERIODO'
      currency = True
    end
  end
  object dsValorTotal: TDataSource
    AutoEdit = False
    DataSet = sqlQryValorTotal
    Left = 16
    Top = 76
  end
  object cdsRelatorio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelatorio'
    Left = 103
    Top = 89
    object cdsRelatorioDIA: TDateField
      FieldName = 'DIA'
      Required = True
      EditMask = '!99/99/00;1;_'
    end
    object cdsRelatorioTANQUE: TIntegerField
      FieldName = 'TANQUE'
      Required = True
    end
    object cdsRelatorioBOMBA: TIntegerField
      FieldName = 'BOMBA'
      Required = True
    end
    object cdsRelatorioVALOR_DIARIO: TFloatField
      FieldName = 'VALOR_DIARIO'
      currency = True
    end
  end
  object dspRelatorio: TDataSetProvider
    DataSet = sqlQryRelatorio
    Left = 136
    Top = 88
  end
end
