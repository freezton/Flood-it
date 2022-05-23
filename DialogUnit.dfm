object DialogForm: TDialogForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1048#1075#1088#1072' '#1086#1082#1086#1085#1095#1077#1085#1072
  ClientHeight = 126
  ClientWidth = 522
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
    Left = 17
    Top = 12
    Width = 487
    Height = 58
    Caption = 
      #1048#1075#1088#1072' '#1086#1082#1086#1085#1095#1077#1085#1072'. '#1042#1072#1096' '#1089#1095#1077#1090': 23444653525243. '#1061#1086#1090#1080#1090#1077' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1077#1075#1086' '#1074' '#1090 +
      #1072#1073#1083#1080#1094#1091' '#1088#1077#1082#1086#1088#1076#1086#1074'?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object YesButton: TButton
    Left = 24
    Top = 84
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
    Left = 388
    Top = 84
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
