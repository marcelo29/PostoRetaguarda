object frmRelatorio: TfrmRelatorio
  Left = 252
  Top = 111
  Width = 748
  Height = 588
  Caption = 'Relat'#243'rio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = frmRelatorioPeriodo.dsRelatorio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object rlbCabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 16
      BandType = btHeader
      Color = clSilver
      ParentColor = False
      Transparent = False
      object RLLabel1: TRLLabel
        Left = 0
        Top = 0
        Width = 25
        Height = 16
        Align = faLeftTop
        Caption = 'Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel2: TRLLabel
        Left = 153
        Top = 0
        Width = 52
        Height = 16
        Align = faCenterTop
        Caption = 'Tanque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel3: TRLLabel
        Left = 514
        Top = 0
        Width = 49
        Height = 16
        Align = faCenterTop
        Caption = 'Bomba'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel4: TRLLabel
        Left = 606
        Top = 0
        Width = 112
        Height = 16
        Align = faRightTop
        Caption = 'Valor Abastecido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object rlbDetalhe: TRLBand
      Left = 38
      Top = 54
      Width = 718
      Height = 16
      object RLDBText3: TRLDBText
        Left = 0
        Top = 0
        Width = 25
        Height = 16
        Align = faLeftTop
        DataField = 'DIA'
        DataSource = frmRelatorioPeriodo.dsRelatorio
      end
      object RLDBText4: TRLDBText
        Left = 151
        Top = 0
        Width = 57
        Height = 16
        Align = faCenterTop
        DataField = 'TANQUE'
        DataSource = frmRelatorioPeriodo.dsRelatorio
      end
      object RLDBText5: TRLDBText
        Left = 512
        Top = 0
        Width = 52
        Height = 16
        Align = faCenterTop
        DataField = 'BOMBA'
        DataSource = frmRelatorioPeriodo.dsRelatorio
      end
      object RLDBText6: TRLDBText
        Left = 620
        Top = 0
        Width = 98
        Height = 16
        Align = faRightTop
        DataField = 'VALOR_DIARIO'
        DataSource = frmRelatorioPeriodo.dsRelatorio
      end
    end
    object rlbRodape: TRLBand
      Left = 38
      Top = 70
      Width = 718
      Height = 16
      BandType = btFooter
      Color = clSilver
      ParentColor = False
      Transparent = False
      object RLDBText2: TRLDBText
        Left = 0
        Top = 0
        Width = 184
        Height = 16
        Align = faLeftTop
        DataField = 'VALOR_PERIODO'
        DataSource = frmRelatorioPeriodo.dsValorTotal
        Text = 'Valor Total: '
      end
    end
  end
end
