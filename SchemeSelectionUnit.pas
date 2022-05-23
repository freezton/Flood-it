unit SchemeSelectionUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TSchemeSelectionForm = class(TForm)
    TextLabel: TLabel;
    Scheme2Button: TRadioButton;
    Scheme3Button: TRadioButton;
    ClassicSImage: TImage;
    ClassicSPanel: TPanel;
    Scheme2Panel: TPanel;
    Scheme3Panel: TPanel;
    Scheme1Panel: TPanel;
    Scheme1Image: TImage;
    Scheme2Image: TImage;
    Scheme3Image: TImage;
    ClassicSchemeButton: TRadioButton;
    Scheme1Button: TRadioButton;
    OkButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Scheme2ButtonClick(Sender: TObject);
    procedure ClassicSchemeButtonClick(Sender: TObject);
    procedure Scheme3ButtonClick(Sender: TObject);
    procedure Scheme1ButtonClick(Sender: TObject);
    procedure FillSquares(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SchemeSelectionForm: TSchemeSelectionForm;

implementation

{$R *.dfm}

procedure CreateFile(Col1, Col2, Col3, Col4, Col5, Col6: TColor);
var
    ThemeFile: File of TColor;
begin
    AssignFile(ThemeFile, 'ColorTheme.txt');
    Rewrite(ThemeFile);
    Write(ThemeFile, Col1);
    Write(ThemeFile, Col2);
    Write(ThemeFile, Col3);
    Write(ThemeFile, Col4);
    Write(ThemeFile, Col5);
    Write(ThemeFile, Col6);
    CloseFile(ThemeFile);
end;

procedure TSchemeSelectionForm.ClassicSchemeButtonClick(Sender: TObject);
const
    COL_1 = $000000FF;
    COL_2 = $0000FFFF;
    COL_3 = $0000FF00;
    COL_4 = $00FF0000;
    COL_5 = $00FF00FF;
    COL_6 = $00800080;
begin
    CreateFile(COL_1, COL_2, COL_3, COL_4, COL_5, COL_6);
end;

procedure TSchemeSelectionForm.Scheme1ButtonClick(Sender: TObject);
const
    COL_1 = $00362467;
    COL_2 = $00542CB9;
    COL_3 = $009A6ECD;
    COL_4 = $0000D3A7;
    COL_5 = $00E2CCB0;
    COL_6 = $00FFFFFF;
begin
    CreateFile(COL_1, COL_2, COL_3, COL_4, COL_5, COL_6);
end;

procedure TSchemeSelectionForm.Scheme2ButtonClick(Sender: TObject);
const
    COL_1 = $00D26502;
    COL_2 = $009F8984;
    COL_3 = $00FFFFFF;
    COL_4 = $004CFFFF;
    COL_5 = $00309DF2;
    COL_6 = $00085BEC;
begin
    CreateFile(COL_1, COL_2, COL_3, COL_4, COL_5, COL_6);
end;

procedure TSchemeSelectionForm.Scheme3ButtonClick(Sender: TObject);
const
    COL_1 = $002E511A;
    COL_2 = $00629D58;
    COL_3 = $00BFD3B0;
    COL_4 = $0093DCC6;
    COL_5 = $001FA963;
    COL_6 = $00FFFFFF;
begin
    CreateFile(COL_1, COL_2, COL_3, COL_4, COL_5, COL_6);
end;

procedure TSchemeSelectionForm.FillSquares(Sender: TObject);
begin
    with ClassicSImage.Canvas do
    begin
        Brush.Color := $000000FF;
        FillRect(Rect(0, 0, 37, 37));
        Brush.Color := $0000FFFF;
        FillRect(Rect(37, 0, 74, 37));
        Brush.Color := $0000FF00;
        FillRect(Rect(74, 0, 111, 37));
        Brush.Color := $00FF0000;
        FillRect(Rect(111, 0, 148, 37));
        Brush.Color := $00FF00FF;
        FillRect(Rect(148, 0, 185, 37));
        Brush.Color := $00800080;
        FillRect(Rect(185, 0, 222, 37));
    end;
    with Scheme1Image.Canvas do
    begin
        Brush.Color := $00362467;
        FillRect(Rect(0, 0, 37, 37));
        Brush.Color := $00542CB9;
        FillRect(Rect(37, 0, 74, 37));
        Brush.Color := $009A6ECD;
        FillRect(Rect(74, 0, 111, 37));
        Brush.Color := $0000D3A7;
        FillRect(Rect(111, 0, 148, 37));
        Brush.Color := $00E2CCB0;
        FillRect(Rect(148, 0, 185, 37));
        Brush.Color := $00FFFFFF;
        FillRect(Rect(185, 0, 222, 37));
    end;
    with Scheme2Image.Canvas do
    begin
        Brush.Color := $00D26502;
        FillRect(Rect(0, 0, 37, 37));
        Brush.Color := $009F8984;
        FillRect(Rect(37, 0, 74, 37));
        Brush.Color := $00FFFFFF;
        FillRect(Rect(74, 0, 111, 37));
        Brush.Color := $004CFFFF;
        FillRect(Rect(111, 0, 148, 37));
        Brush.Color := $00309DF2;
        FillRect(Rect(148, 0, 185, 37));
        Brush.Color := $00085BEC;
        FillRect(Rect(185, 0, 222, 37));
    end;
    with Scheme3Image.Canvas do
    begin
        Brush.Color := $002E511A;
        FillRect(Rect(0, 0, 37, 37));
        Brush.Color := $00629D58;
        FillRect(Rect(37, 0, 74, 37));
        Brush.Color := $001FA963;
        FillRect(Rect(74, 0, 111, 37));
        Brush.Color := $0093DCC6;
        FillRect(Rect(111, 0, 148, 37));
        Brush.Color := $00BFD3B0;
        FillRect(Rect(148, 0, 185, 37));
        Brush.Color := $00FFFFFF;
        FillRect(Rect(185, 0, 222, 37));
    end;
end;

procedure TSchemeSelectionForm.FormCreate(Sender: TObject);
var
    ThemeFile: File of TColor;
    CurrColor: TColor;
begin
    FillSquares(Sender);
    SchemeSelectionForm.KeyPreview := True;
    AssignFile(ThemeFile, 'ColorTheme.txt');
    try
        Reset(ThemeFile);
        Read(ThemeFile, CurrColor);
        CloseFile(ThemeFile);
        case CurrColor of
            $000000FF: ClassicSchemeButton.Checked := True;
            $00362467: Scheme1Button.Checked := True;
            $00D26502: Scheme2Button.Checked := True;
            $002E511A: Scheme3Button.Checked := True;
        end;
    except
        try
            ClassicSchemeButton.Checked := True;
            Rewrite(ThemeFile);
            ClassicSchemeButtonClick(Sender);
            CloseFile(ThemeFile);
        except
            CurrColor := $000000FF;
            ClassicSchemeButton.Enabled := False;
            Scheme1Button.Enabled := False;
            Scheme2Button.Enabled := False;
            Scheme3Button.Enabled := False;
        end;
    end;
end;

procedure TSchemeSelectionForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if (Key = #27) then
        SchemeSelectionForm.Close;
end;

end.
