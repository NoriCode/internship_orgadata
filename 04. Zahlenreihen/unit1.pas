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
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
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
  von, bis, i:integer;
begin
  von:=StrtoInt(edit1.Text);
  bis:=StrtoInt(edit2.Text);
  i:= von;

  for i:= von to bis do
  begin
    ListBox1.Items.Add(InttoStr(i));
    von:=von+1;
  end

  end;
end.

