unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  zahl, fibu1, fibu2, fibu3, i:integer;
begin
  zahl:=StrtoInt(Edit1.Text);

  fibu1:=0;
  fibu2:=1;
  fibu3:=0;

    ListBox1.Items.Add(InttoStr(fibu1));//gibt 0
    ListBox1.Items.Add(InttoStr(fibu2));//gibt 1

  for i:=0 to (zahl-2) do
  begin

    fibu1:=fibu2+fibu3;                 //wird 1 2 3
    fibu3:=fibu2;                       //wird 1 1 2
    fibu2:=fibu1;                       //wird 1 2

    ListBox1.Items.Add(InttoStr(fibu1));//gibt 1 2
  end
end;

end.

