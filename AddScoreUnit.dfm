object AddScoreForm: TAddScoreForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1042#1074#1077#1076#1080#1090#1077' '#1080#1084#1103
  ClientHeight = 103
  ClientWidth = 495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object InfoLabel: TLabel
    Left = 12
    Top = 15
    Width = 207
    Height = 29
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1089#1074#1086#1077' '#1080#1084#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object CancelButon: TButton
    Left = 360
    Top = 61
    Width = 109
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 0
    OnClick = CancelButonClick
  end
  object NameEdit: TEdit
    Left = 233
    Top = 12
    Width = 249
    Height = 37
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = NameEditChange
    OnKeyPress = NameEditKeyPress
  end
  object OkButton: TButton
    Left = 24
    Top = 61
    Width = 109
    Height = 33
    Caption = #1054#1082
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
    OnClick = OkButtonClick
  end
end
