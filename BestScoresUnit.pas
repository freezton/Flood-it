unit BestScoresUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TScoreInfo = record
    Name: String[20];
    Score: Integer;
  end;
  TBestScoresForm = class(TForm)
    Text: TLabel;
    ScoreLabel: TLabel;
    OkButton: TButton;
    ClearButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ClearButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BestScoresForm: TBestScoresForm;

implementation

{$R *.dfm}

uses
    NotificationUnit;

procedure TBestScoresForm.ClearButtonClick(Sender: TObject);
var
    ScoreFile: File of TScoreInfo;
    Dlg: Integer;
begin
    Application.CreateForm(TNotificationForm, NotificationForm);
    with NotificationForm do
    begin
        TextLabel.Caption := 'Вы действительно хотите очистить рекорды?';
        Width := TextLabel.Width + 42;
        NoButton.Left := Width - 140;
    end;
    Dlg := NotificationForm.ShowModal;
    if (Dlg = mrYes) then
    begin
        AssignFile(ScoreFile, 'Scores.txt');
        Rewrite(ScoreFile);
        ScoreLabel.Caption := 'Рекорды отсутствуют';
        BestScoresForm.Height := 205;
        OkButton.Top := 115;
        ClearButton.Top := 115;
        CloseFile(ScoreFile);
        BestScoresForm.Position := poScreenCenter;
    end;
end;

procedure TBestScoresForm.FormCreate(Sender: TObject);
var
    ScoreFile: File of TScoreInfo;
    CurrScore: TScoreInfo;
    Number: Byte;
begin
    BestScoresForm.KeyPreview := True;
    BestScoresForm.Height := 210;
    OkButton.Top := 115;
    ScoreLabel.Caption := '';
    Number := 1;
    AssignFile(ScoreFile, 'Scores.txt');
    try
        Reset(ScoreFile);
        while (not EoF(ScoreFile) and (Number <= 10)) do
        begin
            Read(ScoreFile, CurrScore);
            ScoreLabel.Caption := ScoreLabel.Caption + IntToStr(Number) + '. ' + CurrScore.Name + '   ' + IntToStr(CurrScore.Score) + #13#10;
            Inc(Number);
            BestScoresForm.Height := 135 + 38 * Number;
            OkButton.Top := BestScoresForm.Height - 90;
            ClearButton.Top := BestScoresForm.Height - 90;
        end;
        CloseFile(ScoreFile);
    except
        begin
            ScoreLabel.Caption := 'Рекорды отсутствуют';
            ClearButton.Enabled := False;
        end;
    end;
    if (ScoreLabel.Caption = '') then
    begin
        ScoreLabel.Caption := 'Рекорды отсутствуют';
        ClearButton.Enabled := False;
    end;
end;

procedure TBestScoresForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if (Key = #27) then
        BestScoresForm.Close;
end;

end.
