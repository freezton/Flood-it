unit GameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Menus;

type
  TCoord = record
    x1, y1: integer;
  end;

  TPStack = ^TStack;
  TStack = Record
    Data: TCoord;
    Next: TPStack;
  end;

  TBoolArray = Array[0..13] of Array[0..13] of Boolean;

  TGameForm = class(TForm)
    Color1: TImage;
    Color2: TImage;
    Color3: TImage;
    Color4: TImage;
    Color5: TImage;
    Color6: TImage;
    Field: TImage;
    MovesInfoLabel: TLabel;
    ScoreInfoLabel: TLabel;
    MoveslLabel: TLabel;
    ScoreLabel: TLabel;
    MovesInfoPanel: TPanel;
    ScoreInfoPanel: TPanel;
    FieldPanel: TPanel;
    Color1Panel: TPanel;
    Color2Panel: TPanel;
    Color3Panel: TPanel;
    Color4Panel: TPanel;
    Color5Panel: TPanel;
    Color6Panel: TPanel;
    MainMenu: TMainMenu;
    Info: TMenuItem;
    Refresh: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Color1Click(Sender: TObject);
    procedure Color2Click(Sender: TObject);
    procedure Color3Click(Sender: TObject);
    procedure Color4Click(Sender: TObject);
    procedure Color5Click(Sender: TObject);
    procedure Color6Click(Sender: TObject);
    procedure RefreshField(Sender: TObject);
    procedure RefreshStatus(var Arr: TBoolArray);
    procedure RefreshAll(Sender: TObject);
    procedure ShowLossMessage(Sender: TObject);
    procedure DoButtonActions(Sender: TObject; CurrColor: TColor);
    procedure FillSquares(Sender: TObject; Col: TColor);
    procedure FindSquares(PrevColor: TColor; X, Y: Integer);
    procedure CalculateScore(Col: TColor);
    procedure ExitClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SetColorTheme(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RefreshClick(Sender: TObject);
    procedure InfoClick(Sender: TObject);

  private
    Stack: TPStack;
    IsComplete: Boolean;
    MovesAmount, Score, Multiplier: Integer;
    Status: TBoolArray;
  public
    { Public declarations }
    test: integer;
  end;

var
  GameForm: TGameForm;
  COL_1, COL_2, COL_3, COL_4, COL_5, COL_6: TColor;

implementation

uses
    MainUnit, DialogUnit, AddScoreUnit, NotificationUnit, ReferenceUnit;

{$R *.dfm}

const
    SIZE = 36;
    MAX_MOVES = 25;

procedure Push(var Stack: TPStack; x1, y1: integer);
var
    Temp: TPStack;
begin
    New(Temp);
    Temp.Data.x1 := x1;
    Temp.Data.y1 := y1;
    Temp.Next := Stack;
    Stack := Temp;
end;

function Pop(var Stack: TPStack): TCoord;
var
    Temp: TPStack;
    Curr: TCoord;
begin
    If (Stack <> nil) then
    Begin
        Temp := Stack;
        Stack := Stack^.next;
        Curr := Temp.Data;
        Dispose(Temp);
    End;
    Pop := Curr;
end;

function GetColor(): TColor;
var
    NumberOfColor: Byte;
    Color: TColor;
begin
    Randomize;
    Color := 0;
    NumberOfColor := Random(6) + 1;
    case NumberOfColor of
        1: Color := COL_1;
        2: Color := COL_2;
        3: Color := COL_3;
        4: Color := COL_4;
        5: Color := COL_5;
        6: Color := COL_6;
    end;
    GetColor := Color;
end;

procedure TGameForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
    Dlg: Integer;
begin
    Application.CreateForm(TNotificationForm, NotificationForm);
    if (MovesAmount = MAX_MOVES) then
    with NotificationForm do
    begin
        NotificationForm.TextLabel.Caption := 'Хотите сыграть еще раз?';
        Width := TextLabel.Width + 42;
        NoButton.Left := Width - 140;
    end
    else
    with NotificationForm do
    begin
        NotificationForm.TextLabel.Caption := 'Вы действительно хотите выйти?';
        Width := TextLabel.Width + 42;
        NoButton.Left := Width - 140;
    end;
    Dlg := NotificationForm.ShowModal;
    if (MovesAmount = MAX_MOVES) then
    begin
        if (Dlg = mrNo) then
            CanClose := True
        else
        begin
            CanClose := False;
            RefreshAll(Sender);
        end;
    end
    else
    begin
        if (Dlg = mrYes) then
            CanClose := True
        else
            CanClose := False;
    end;
end;

function FindColor(x, y: integer): TColor;
begin
    findColor := GameForm.Field.Canvas.Pixels[x + 18, y + 18];
end;

function CheckStatus(): Boolean;
var
    I, J: Byte;
    Temp: Boolean;
begin
    Temp := True;
    for I := 0 to 12 do
    begin
        for J := 0 to 12 do
        begin
            if (FindColor(I * SIZE, J * SIZE) <> FindColor(I * SIZE, (J + 1) * SIZE)) or
               (FindColor(I * SIZE, J * SIZE) <> FindColor((I + 1) * SIZE, J * SIZE)) then
            begin
                Temp := False;
            end;
        end;
    end;
    if (FindColor(12 * SIZE, 12 * SIZE) <> FindColor(13 * SIZE, 13 * SIZE)) then
        Temp := False;
    CheckStatus := temp;
end;

procedure TGameForm.RefreshStatus(var Arr: TBoolArray);
var
    I, J: Byte;
    Coord: TCoord;
    Col : TColor;
begin
    for I := 0 to 13 do
        for J := 0 to 13 do
            Arr[I][J] := false;
    Col := FindColor(0, 0);
    FindSquares(Col, 0, 0);
    Field.Canvas.Brush.Color := Col;
    while (Stack <> nil) do
    begin
        Coord := Pop(Stack);
        Field.Canvas.FillRect(Rect(Coord.x1, Coord.y1, Coord.x1 + SIZE, Coord.y1 + SIZE));
        Status[Coord.x1 div SIZE][Coord.y1 div SIZE] := True;
    end;
end;

procedure TGameForm.RefreshField(Sender: TObject);
var
    i, j: byte;
begin
    Stack := nil;
    IsComplete := false;
    MovesAmount := 0;
    for i := 0 to 13 do
    begin
        for j := 0 to 13 do
        begin
            MovesInfoLabel.Caption := intToStr(MovesAmount) + ' / ' + intToStr(MAX_MOVES);
            Field.Canvas.Brush.Color := getColor();
            Field.Canvas.FillRect(Rect(i * SIZE, j * SIZE, (i+1) * SIZE, (j+1) * SIZE));
        end;
    end;
    RefreshStatus(Status);
end;

procedure TGameForm.RefreshAll(Sender: TObject);
begin
    Score := 0;
    Multiplier := 1;
    ScoreInfoLabel.Caption := '0';
    RefreshField(Sender);
end;

procedure TGameForm.SetColorTheme(Sender: TObject);
var
    ThemeFile: File of TColor;
begin
    AssignFile(ThemeFile, 'ColorTheme.txt');
    try
        Reset(ThemeFile);
        Read(ThemeFile, COL_1);
        Read(ThemeFile, COL_2);
        Read(ThemeFile, COL_3);
        Read(ThemeFile, COL_4);
        Read(ThemeFile, COL_5);
        Read(ThemeFile, COL_6);
        CloseFile(ThemeFile);
    except
        COL_1 := $000000FF;
        COL_2 := $0000FFFF;
        COL_3 := $0000FF00;
        COL_4 := $00FF0000;
        COL_5 := $00FF00FF;
        COL_6 := $00800080;
    end;
end;

procedure TGameForm.FormCreate(Sender: TObject);
const
    FIRST_COORD = 0;
    LAST_COORD = 108;
begin
    SetColorTheme(Sender);
    GameForm.KeyPreview := True;
    RefreshAll(Sender);
    Color1.Canvas.Brush.Color := COL_1;
    Color1.Canvas.FillRect(Rect(FIRST_COORD, FIRST_COORD, LAST_COORD, LAST_COORD));
    Color2.Canvas.Brush.Color := COL_2;
    Color2.Canvas.FillRect(Rect(FIRST_COORD , FIRST_COORD, LAST_COORD, LAST_COORD));
    Color3.Canvas.Brush.Color := COL_3;
    Color3.Canvas.FillRect(Rect(FIRST_COORD, FIRST_COORD, LAST_COORD, LAST_COORD));
    Color4.Canvas.Brush.Color := COL_4;
    Color4.Canvas.FillRect(Rect(FIRST_COORD , FIRST_COORD, LAST_COORD, LAST_COORD));
    Color5.Canvas.Brush.Color := COL_5;
    Color5.Canvas.FillRect(Rect(FIRST_COORD, FIRST_COORD, LAST_COORD, LAST_COORD));
    Color6.Canvas.Brush.Color := COL_6;
    Color6.Canvas.FillRect(Rect(FIRST_COORD , FIRST_COORD, LAST_COORD, LAST_COORD));
end;

procedure TGameForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if (Key = #27) then
        GameForm.Close;
end;

procedure TGameForm.InfoClick(Sender: TObject);
begin
    Application.CreateForm(TReferenceForm, ReferenceForm);
    ReferenceForm.ShowModal;
end;

procedure TGameForm.RefreshClick(Sender: TObject);
var
    Dlg: Integer;
begin
    Application.CreateForm(TNotificationForm, NotificationForm);
    with NotificationForm do
    begin
        NotificationForm.TextLabel.Caption := 'Хотите начать игру сначала?';
        Width := TextLabel.Width + 42;
        NoButton.Left := Width - 140;
    end;
    Dlg := NotificationForm.ShowModal;
    if (Dlg = mrYes) then
        RefreshAll(Sender);
end;

procedure TGameForm.FillSquares(Sender: TObject; Col: tcolor);
var
    Coord: TCoord;
begin
    GameForm.Field.Canvas.Brush.Color := Col;
    while Stack <> nil do
    begin
        Coord := Pop(Stack);
        Field.Canvas.FillRect(Rect(Coord.x1, Coord.y1, Coord.x1 + SIZE, Coord.y1 + SIZE));
    end;
end;

procedure TGameForm.CalculateScore(Col: TColor);
var
    Coord: TCoord;
begin
    GameForm.Field.Canvas.Brush.Color := Col;
    while (Stack <> nil) do
    begin
        Coord := Pop(Stack);
        Field.Canvas.FillRect(Rect(Coord.x1, Coord.y1, Coord.x1 + SIZE, Coord.y1 + SIZE));
        if (Status[Coord.x1 div SIZE][Coord.y1 div SIZE] = False) then
        begin
            Status[Coord.x1 div SIZE][Coord.y1 div SIZE] := True;
            Score := Score + 10 * Multiplier;
        end;
    end;
end;

procedure TGameForm.FindSquares(PrevColor: TColor; X, Y: Integer);
const
    MAX_X = 469;
    MAX_Y = 469;
begin
    Push(GameForm.Stack, X, Y);
    Field.Canvas.Brush.Color := 0;
    Field.Canvas.FillRect(Rect(X, Y, X + SIZE, Y + SIZE));
    if (X < MAX_X) and (Y < MAX_Y) then
    begin
        if (FindColor(X + SIZE, Y) = PrevColor) then
            FindSquares(PrevColor, X + SIZE, Y);
        if (FindColor(X, Y + SIZE) = PrevColor) then
            FindSquares(PrevColor, X, Y + SIZE);
        if (FindColor(X - SIZE, Y) = PrevColor) then
            FindSquares(PrevColor, X - SIZE, Y);
        if (FindColor(X, Y - SIZE) = PrevColor) then
            FindSquares(PrevColor, X, y - SIZE);
    end;
end;

procedure TGameForm.ShowLossMessage(Sender: TObject);
var
    Dlg: Integer;
begin
    Application.CreateForm(TDialogForm, DialogForm);
    DialogForm.TextLabel.Caption := 'Игра окончена. Ваш счет: ' + ScoreInfoLabel.Caption + '.' + #13#10 + 'Хотите добавить его в таблицу рекордов?';
    Dlg := DialogForm.ShowModal;
    if (Dlg = mrYes) then
    begin
        Application.CreateForm(TAddScoreForm, AddScoreForm);
        AddScoreForm.ShowModal;
        GameForm.Close;
    end
    else
        GameForm.Close;
end;

procedure TGameForm.DoButtonActions(Sender: TObject; CurrColor: TColor);
var
    PrevColor: TColor;
begin
    PrevColor := FindColor(0, 0);
    FindSquares(PrevColor, 0, 0);
    FillSquares(Sender, CurrColor);
    IsComplete := CheckStatus();
    Inc(MovesAmount);
    MovesInfoLabel.Caption := IntToStr(MovesAmount) + ' / ' + IntToStr(MAX_MOVES);
    FindSquares(CurrColor, 0, 0);
    CalculateScore(CurrColor);
    ScoreInfoLabel.Caption := IntToStr(Score);
    if (not IsComplete) and (MovesAmount >= MAX_MOVES) then
        ShowLossMessage(Sender);
    if IsComplete then
    begin
        Inc(Multiplier);
        RefreshField(Sender);
    end;
end;

procedure TGameForm.ExitClick(Sender: TObject);
begin
    GameForm.Close;
end;

procedure TGameForm.Color1Click(Sender: TObject);
begin
    if (FindColor(0, 0) <> COL_1) then
        DoButtonActions(Sender, COL_1);
end;

procedure TGameForm.Color2Click(Sender: TObject);
begin
    if (FindColor(0, 0) <> COL_2) then
        DoButtonActions(Sender, COL_2);
end;

procedure TGameForm.Color3Click(Sender: TObject);
begin
    if (FindColor(0, 0) <> COL_3) then
        DoButtonActions(Sender, COL_3);
end;

procedure TGameForm.Color4Click(Sender: TObject);
begin
    if (FindColor(0, 0) <> COL_4) then
        DoButtonActions(Sender, COL_4);
end;

procedure TGameForm.Color5Click(Sender: TObject);
begin
    if (FindColor(0, 0) <> COL_5) then
        DoButtonActions(Sender, COL_5);
end;

procedure TGameForm.Color6Click(Sender: TObject);
begin
    if (FindColor(0, 0) <> COL_6) then
        DoButtonActions(Sender, COL_6);
end;

end.
