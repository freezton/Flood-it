object GameForm: TGameForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1048#1075#1088#1072
  ClientHeight = 527
  ClientWidth = 913
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object MovesInfoPanel: TPanel
    Left = 529
    Top = 4
    Width = 373
    Height = 134
    TabOrder = 0
    object MovesInfoLabel: TLabel
      Left = 25
      Top = 55
      Width = 141
      Height = 64
      Caption = '0 / 25'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -53
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object MoveslLabel: TLabel
      Left = 14
      Top = 8
      Width = 348
      Height = 48
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1093#1086#1076#1086#1074':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -40
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object ScoreInfoPanel: TPanel
    Left = 529
    Top = 144
    Width = 373
    Height = 129
    TabOrder = 1
    object ScoreLabel: TLabel
      Left = 13
      Top = 8
      Width = 100
      Height = 48
      Caption = #1057#1095#1077#1090':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -40
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object ScoreInfoLabel: TLabel
      Left = 24
      Top = 55
      Width = 29
      Height = 64
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -53
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object FieldPanel: TPanel
    Left = 1
    Top = 4
    Width = 520
    Height = 520
    TabOrder = 2
    object Field: TImage
      Left = 8
      Top = 8
      Width = 504
      Height = 504
    end
  end
  object Color1Panel: TPanel
    Left = 529
    Top = 279
    Width = 120
    Height = 120
    TabOrder = 3
    object Color1: TImage
      Left = 6
      Top = 6
      Width = 108
      Height = 108
      OnClick = Color1Click
    end
  end
  object Color2Panel: TPanel
    Left = 655
    Top = 279
    Width = 120
    Height = 120
    TabOrder = 4
    object Color2: TImage
      Left = 6
      Top = 6
      Width = 108
      Height = 108
      OnClick = Color2Click
    end
  end
  object Color3Panel: TPanel
    Left = 781
    Top = 279
    Width = 121
    Height = 120
    TabOrder = 5
    object Color3: TImage
      Left = 6
      Top = 6
      Width = 108
      Height = 108
      OnClick = Color3Click
    end
  end
  object Color4Panel: TPanel
    Left = 529
    Top = 405
    Width = 120
    Height = 119
    TabOrder = 6
    object Color4: TImage
      Left = 6
      Top = 6
      Width = 108
      Height = 108
      OnClick = Color4Click
    end
  end
  object Color5Panel: TPanel
    Left = 655
    Top = 405
    Width = 120
    Height = 119
    TabOrder = 7
    object Color5: TImage
      Left = 6
      Top = 6
      Width = 108
      Height = 108
      OnClick = Color5Click
    end
  end
  object Color6Panel: TPanel
    Left = 781
    Top = 405
    Width = 121
    Height = 119
    TabOrder = 8
    object Color6: TImage
      Left = 6
      Top = 6
      Width = 108
      Height = 108
      OnClick = Color6Click
    end
  end
  object MainMenu: TMainMenu
    Left = 512
    Top = 488
    object Info: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      ShortCut = 112
      OnClick = InfoClick
    end
    object Refresh: TMenuItem
      Caption = #1055#1077#1088#1077#1080#1075#1088#1072#1090#1100
      ShortCut = 16466
      OnClick = RefreshClick
    end
    object Exit: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = ExitClick
    end
  end
end
