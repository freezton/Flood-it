object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Flood-it!'
  ClientHeight = 478
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Title: TLabel
    Left = 4
    Top = 16
    Width = 318
    Height = 90
    Caption = 'Flood-it!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -75
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StartButton: TButton
    Left = 29
    Top = 127
    Width = 273
    Height = 57
    Caption = #1048#1075#1088#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = StartButtonClick
  end
  object ScoresButton: TButton
    Left = 29
    Top = 198
    Width = 273
    Height = 57
    Caption = #1056#1077#1082#1086#1088#1076#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = ScoresButtonClick
  end
  object ChooseThemeButton: TButton
    Left = 29
    Top = 269
    Width = 273
    Height = 57
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1077#1084#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = ChooseThemeButtonClick
  end
  object ExitButton: TButton
    Left = 29
    Top = 415
    Width = 273
    Height = 57
    Caption = #1042#1099#1093#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = ExitButtonClick
  end
  object ReqInfoButton: TButton
    Left = 29
    Top = 342
    Width = 273
    Height = 55
    Caption = #1057#1087#1088#1072#1074#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = ReqInfoButtonClick
  end
end