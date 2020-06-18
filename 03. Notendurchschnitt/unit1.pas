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
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
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
  mathe, englisch, deutsch:integer;
  notenschnitt:double;
begin
  mathe:=StrtoInt(edit1.Text);
  englisch:=StrtoInt(edit2.Text);
  deutsch:=StrtoInt(edit3.Text);
  notenschnitt:=(mathe+englisch+deutsch)/3;
  label5.caption:=FloattoStr(notenschnitt);

  if notenschnitt<4 then
  begin
    label6.caption:='Du hast bestanden!';
  end
  else
  begin
    label6.caption:='Du hast leider nicht bestanden!';
  end
end;

end.

