program FloodItGame;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  GameUnit in 'GameUnit.pas' {GameForm},
  Vcl.Themes,
  Vcl.Styles,
  DialogUnit in 'DialogUnit.pas' {DialogForm},
  AddScoreUnit in 'AddScoreUnit.pas' {AddScoreForm},
  SchemeSelectionUnit in 'SchemeSelectionUnit.pas' {SchemeSelectionForm},
  BestScoresUnit in 'BestScoresUnit.pas' {BestScoresForm},
  NotificationUnit in 'NotificationUnit.pas' {NotificationForm},
  ReferenceUnit in 'ReferenceUnit.pas' {ReferenceForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Tablet Dark');
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TNotificationForm, NotificationForm);
  Application.CreateForm(TReferenceForm, ReferenceForm);
  Application.Run;
end.
