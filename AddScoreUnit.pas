unit AddScoreUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TScoreInfo = record
    Name: String[20];
    Score: Integer;
  end;
  TPList = ^TList;
  TList = record
    Data: TScoreInfo;
    Next: TPList;
  end;
  TAddScoreForm = class(TForm)
    OkButton: TButton;
    CancelButon: TButton;
    NameEdit: TEdit;
    InfoLabel: TLabel;
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure NameEditChange(Sender: TObject);
    procedure CancelButonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Head: TPList;
  public
    { Public declarations }
  end;

const
  Keys = ['a'..'z','A'..'Z','0'..'9', #08, #46];

var
  AddScoreForm: TAddScoreForm;

implementation

uses
    GameUnit;

{$R *.dfm}

procedure TAddScoreForm.CancelButonClick(Sender: TObject);
begin
    GameForm.Close;
end;

procedure AddElem(var Head: TPList; Score: TScoreInfo);
var
    Temp: TPList;
begin
    if (Head = nil) then
    begin
        New(Head);
        Head.Data := Score;
        Head.Next := nil
    end
    else
    begin
        Temp := Head;
        while (Temp.Next <> nil) do
            Temp := Temp.Next;
        New(Temp.Next);
        Temp.Next.Data := Score;
        Temp.Next.Next := nil;
    end;
end;

procedure SortList(var Head: TPList);
var
    NewHead, Node, Curr: TPList;
begin
    NewHead := nil;
    while (Head <> nil) do
    begin
        Node := Head;
        Head := Head.Next;
        if ((NewHead = nil) or (node.Data.Score > NewHead.Data.Score)) then
        begin
            Node.Next := NewHead;
            NewHead := Node;
        end
        else
        begin
            Curr := NewHead;
            while ((Curr.Next <> nil) and not (Node.Data.Score > Curr.Next.Data.Score)) do
                curr := curr.Next;
            Node.Next := Curr.Next;
            Curr.Next := Node;
        end;
    end;
    Head := NewHead;
end;

procedure TAddScoreForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ModalResult := mrNo;
end;

procedure TAddScoreForm.FormCreate(Sender: TObject);
begin
    Head := nil;
end;

procedure TAddScoreForm.NameEditChange(Sender: TObject);
begin
    if (Length(NameEdit.Text) < 2) or (Length(NameEdit.Text) > 20) then
        OkButton.Enabled := False
    else
        OkButton.Enabled := True;
end;

procedure TAddScoreForm.NameEditKeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in Keys) then
        Key := #0;
end;

procedure TAddScoreForm.OkButtonClick(Sender: TObject);
var
    ScoreFile: file of TScoreInfo;
    CurrScore: TScoreInfo;
begin
    AssignFile(ScoreFile, 'Scores.txt');
    try
        Reset(ScoreFile);
        while not EoF(ScoreFile) do
        begin
            Read(ScoreFile, CurrScore);
            AddElem(Head, CurrScore);
        end;
        CloseFile(ScoreFile);
    except
        Rewrite(ScoreFile);
    end;
    CurrScore.Name := NameEdit.Text;
    CurrScore.Score := StrToInt(GameForm.ScoreInfoLabel.Caption);
    AddElem(Head, CurrScore);
    SortList(Head);
    try
        Rewrite(ScoreFile);
        while (Head <> nil) do
        begin
            Write(ScoreFile, Head.Data);
            Head := Head.Next;
        end;
    except
        Application.MessageBox('Ошибка! Файл не доступен для записи.', 'Ошибка', MB_ICONERROR);
    end;
    CloseFile(ScoreFile);
    GameForm.Close;
end;

end.
