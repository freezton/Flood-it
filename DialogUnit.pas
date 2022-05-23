unit DialogUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TDialogForm = class(TForm)
    TextLabel: TLabel;
    YesButton: TButton;
    NoButton: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DialogForm: TDialogForm;

implementation

{$R *.dfm}

procedure TDialogForm.FormCreate(Sender: TObject);
begin
    DialogForm.Height := 162;
end;

end.
