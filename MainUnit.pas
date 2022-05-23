unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Grids;

type
  TMainForm = class(TForm)
    StartButton: TButton;
    ScoresButton: TButton;
    ChooseThemeButton: TButton;
    ExitButton: TButton;
    Title: TLabel;
    ReqInfoButton: TButton;
    procedure StartButtonClick(Sender: TObject);
    procedure ChooseThemeButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure ScoresButtonClick(Sender: TObject);
    procedure ReqInfoButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
    GameUnit, SchemeSelectionUnit, BestScoresUnit, ReferenceUnit;

{$R *.dfm}

procedure TMainForm.ExitButtonClick(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TMainForm.ReqInfoButtonClick(Sender: TObject);
begin
    Application.CreateForm(TReferenceForm, ReferenceForm);
    ReferenceForm.ShowModal;
end;

procedure TMainForm.ChooseThemeButtonClick(Sender: TObject);
begin
    Application.CreateForm(TSchemeSelectionForm, SchemeSelectionForm);
    SchemeSelectionForm.ShowModal;
end;

procedure TMainForm.ScoresButtonClick(Sender: TObject);
begin
    Application.CreateForm(TBestScoresForm, BestScoresForm);
    BestScoresForm.ShowModal;
end;

procedure TMainForm.StartButtonClick(Sender: TObject);
begin
    Application.CreateForm(TGameForm, GameForm);
    GameForm.ShowModal;
end;

end.
