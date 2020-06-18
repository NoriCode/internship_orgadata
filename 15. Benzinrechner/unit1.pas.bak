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
    Label3: TLabel;
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
  liter, km, verbrauch:double;
begin
   liter:=StrtoFloat(Edit1.Text);
   Km:=StrtoFloat(Edit2.Text);
   verbrauch:=Liter*100/km;
   Label3.caption:='Ergebnis ' +FloattoStr(verbrauch)+ ' Liter auf 100 Km';
end;

end.

