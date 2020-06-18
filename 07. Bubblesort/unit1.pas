unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { private declarations }
    zahl: array of integer;
    von, bis:integer;

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
  i:integer;
begin
  von:=StrtoInt(edit1.Text);
  bis:=StrtoInt(edit2.Text);

  setlength(zahl, bis-von);

  for i:= 0 to bis-von do
  begin
    zahl[i]:=RandomRange(von,bis);
    ListBox1.Items.Add(InttoStr(zahl[i]));
    //von:=von+1;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i,tauscher:integer;
  done:boolean;

  begin
    von:=StrtoInt(edit1.Text);
    bis:=StrtoInt(edit2.Text);
    ListBox1.Clear;

    repeat
    done := True;
    for i := von to bis-1 do
    begin
      if zahl[i] > zahl[i + 1] then
      begin
        tauscher := zahl[i];
        zahl[i] := zahl[i + 1];
        zahl[i + 1] := tauscher;
        done := False;
      end;
    end;
  until done;
  for i:= 0 to bis-von do
  begin
    ListBox1.Items.Add(InttoStr(zahl[i]));
    //von:=von+1;
  end;
end;



end.

