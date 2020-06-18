unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
  brutto, netto:double;
  brutto2:integer;
begin
  netto:= StrtoFloat(edit2.text);
  brutto:= (netto/100)*119;
  brutto:= brutto*100;
  brutto2:= round(brutto);
  brutto:= brutto2/100;

  edit1.text:=FloattoStr(brutto);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  brutto, netto:double;
  netto2:integer;
begin
  brutto:= StrtoFloat(edit1.text);
  netto:= (brutto/119)*100;
  netto:= netto*100;
  netto2:= round(netto);
  netto:= netto2/100;

  edit2.text:=FloattoStr(netto);
end;

end.

