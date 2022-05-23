object NotificationForm: TNotificationForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077
  ClientHeight = 101
  ClientWidth = 473
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TextLabel: TLabel
    Left = 16
    Top = 16
    Width = 441
    Height = 29
    Caption = #1061#1086#1090#1080#1090#1077' '#1087#1088#1086#1076#1086#1083#1078#1080#1090#1100' '#1089#1086#1093#1088#1072#1085#1077#1085#1085#1091#1102' '#1080#1075#1088#1091'?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object YesButton: TButton
    Left = 21
    Top = 60
    Width = 109
    Height = 33
    Caption = #1044#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 6
    ParentFont = False
    TabOrder = 0
  end
  object NoButton: TButton
    Left = 340
    Top = 60
    Width = 109
    Height = 33
    Caption = #1053#1077#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 7
    ParentFont = False
    TabOrder = 1
  end
end
