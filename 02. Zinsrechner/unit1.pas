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
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  skapital, zinssatz, ekapital:double;
begin
  skapital:=StrtoFloat(edit1.Text);
  zinssatz:=StrtoFloat(edit2.Text);
  ekapital:=skapital+(skapital*zinssatz)/100;
  showmessage(FloattoStr(ekapital));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  skapital, zinssatz, laufzeit, ekapital:double;
begin
  skapital:=StrtoFloat(edit1.Text);
  zinssatz:=StrtoFloat(edit2.Text);
  laufzeit:=StrtoFloat(edit3.Text);
  ekapital:=skapital*(Power((1+(zinssatz/100)),laufzeit));
  showmessage(FloattoStr(ekapital));

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

end.

