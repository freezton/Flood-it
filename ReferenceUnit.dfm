object ReferenceForm: TReferenceForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1087#1088#1072#1074#1082#1072
  ClientHeight = 415
  ClientWidth = 687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -24
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 29
  object TitleLabel: TLabel
    Left = 168
    Top = 4
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
  object TextLabel: TLabel
    Left = 12
    Top = 104
    Width = 667
    Height = 145
    Caption = 
      #1042' '#1085#1072#1095#1072#1083#1077' '#1080#1075#1088#1099' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1102' '#1076#1072#1077#1090#1089#1103' 25 '#1093#1086#1076#1086#1074' '#1076#1083#1103' '#1074#1099#1073#1086#1088#1072' '#1094#1074#1077#1090#1072'. '#1055#1088#1080 +
      ' '#1074#1099#1073#1086#1088#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1085#1086#1075#1086' '#1094#1074#1077#1090#1072', '#1080#1084' '#1073#1091#1076#1077#1090' '#1079#1072#1083#1080#1090#1072' '#1086#1073#1083#1072#1089#1090#1100', '#1085#1072#1095#1080#1085#1072#1102#1097#1072#1103 +
      #1089#1103' '#1089' '#1083#1077#1074#1086#1081' '#1074#1077#1088#1093#1085#1077#1081' '#1082#1083#1077#1090#1082#1080' '#1080' '#1074#1082#1083#1102#1095#1072#1102#1097#1072#1103' '#1074' '#1089#1077#1073#1103' '#1074#1089#1077' '#1082#1083#1077#1090#1082#1080' '#1086#1076#1085#1086#1075#1086' ' +
      #1094#1074#1077#1090#1072' '#1089' '#1080#1089#1093#1086#1076#1085#1086#1081'. '#1062#1077#1083#1100' '#1080#1075#1088#1099': '#1079#1072#1083#1080#1090#1100' '#1074#1089#1077' '#1087#1086#1083#1077' '#1086#1076#1085#1080#1084' '#1094#1074#1077#1090#1086#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object InfoLabel: TLabel
    Left = 8
    Top = 308
    Width = 285
    Height = 29
    Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Email: TLabel
    Left = 304
    Top = 308
    Width = 209
    Height = 29
    Caption = 'qwjvwjl@gmail.com'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = EmailClick
  end
  object DevInfo: TLabel
    Left = 8
    Top = 264
    Width = 672
    Height = 29
    Caption = #1056#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082': '#1055#1088#1086#1090#1095#1077#1085#1082#1086' '#1042#1083#1072#1076#1080#1089#1083#1072#1074', '#1089#1090#1091#1076#1077#1085#1090' '#1075#1088#1091#1087#1087#1099' 151002'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object OkButton: TButton
    Left = 264
    Top = 356
    Width = 213
    Height = 46
    Caption = #1054#1082
    ModalResult = 1
    TabOrder = 0
  end
end
