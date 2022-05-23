unit NotificationUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TNotificationForm = class(TForm)
    YesButton: TButton;
    NoButton: TButton;
    TextLabel: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NotificationForm: TNotificationForm;

implementation

{$R *.dfm}

procedure TNotificationForm.FormCreate(Sender: TObject);
begin
    NotificationForm.Width := 480;
    NoButton.Left := NotificationForm.Width - 140;
end;

end.
