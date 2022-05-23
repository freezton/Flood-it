unit ReferenceUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Clipbrd;

type
  TReferenceForm = class(TForm)
    TitleLabel: TLabel;
    TextLabel: TLabel;
    InfoLabel: TLabel;
    Email: TLabel;
    DevInfo: TLabel;
    OkButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EmailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReferenceForm: TReferenceForm;

implementation

{$R *.dfm}

procedure TReferenceForm.EmailClick(Sender: TObject);
begin
    Clipboard.AsText := Email.Caption;
end;

procedure TReferenceForm.FormCreate(Sender: TObject);
begin
    ReferenceForm.KeyPreview := True;
    TitleLabel.Left := (ReferenceForm.Width - TitleLabel.Width) div 2;
    OkButton.Left := (ReferenceForm.Width - OkButton.Width) div 2;
end;

procedure TReferenceForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if (Key = #27) then
        ReferenceForm.Close;
end;

end.
