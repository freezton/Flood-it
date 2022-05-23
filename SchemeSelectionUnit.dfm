object SchemeSelectionForm: TSchemeSelectionForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1042#1099#1073#1086#1088' '#1094#1074#1077#1090#1086#1074#1086#1081' '#1089#1093#1077#1084#1099
  ClientHeight = 494
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object TextLabel: TLabel
    Left = 8
    Top = 8
    Width = 400
    Height = 39
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1094#1074#1077#1090#1086#1074#1091#1102' '#1089#1093#1077#1084#1091':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Scheme2Button: TRadioButton
    Left = 76
    Top = 246
    Width = 249
    Height = 32
    Caption = #1057#1093#1077#1084#1072' 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Scheme2ButtonClick
  end
  object Scheme3Button: TRadioButton
    Left = 76
    Top = 343
    Width = 249
    Height = 29
    Caption = #1057#1093#1077#1084#1072' 3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Scheme3ButtonClick
  end
  object ClassicSPanel: TPanel
    Left = 84
    Top = 96
    Width = 230
    Height = 45
    Enabled = False
    TabOrder = 4
    object ClassicSImage: TImage
      Left = 4
      Top = 4
      Width = 222
      Height = 37
    end
  end
  object Scheme2Panel: TPanel
    Left = 84
    Top = 284
    Width = 230
    Height = 45
    Enabled = False
    TabOrder = 5
    object Scheme2Image: TImage
      Left = 4
      Top = 4
      Width = 222
      Height = 37
    end
  end
  object Scheme3Panel: TPanel
    Left = 84
    Top = 374
    Width = 230
    Height = 45
    Enabled = False
    TabOrder = 6
    object Scheme3Image: TImage
      Left = 4
      Top = 4
      Width = 222
      Height = 37
    end
  end
  object Scheme1Panel: TPanel
    Left = 84
    Top = 191
    Width = 230
    Height = 45
    Enabled = False
    TabOrder = 7
    object Scheme1Image: TImage
      Left = 4
      Top = 4
      Width = 222
      Height = 37
    end
  end
  object ClassicSchemeButton: TRadioButton
    Left = 76
    Top = 57
    Width = 286
    Height = 33
    Caption = #1050#1083#1072#1089#1089#1080#1095#1077#1089#1082#1072#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = ClassicSchemeButtonClick
  end
  object Scheme1Button: TRadioButton
    Left = 76
    Top = 156
    Width = 249
    Height = 29
    Caption = #1057#1093#1077#1084#1072' 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Scheme1ButtonClick
  end
  object OkButton: TButton
    Left = 92
    Top = 432
    Width = 213
    Height = 46
    Caption = #1054#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 8
  end
end
