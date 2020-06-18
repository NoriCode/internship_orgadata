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
    Label2: TLabel;
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
  zahl, tester, lange, i:integer;
  abgleich:string;
begin
  tester:=0;
  abgleich:=edit1.Text;

  lange:=length(abgleich);
  setlength(abgleich, lange);

  for i:=1 to 10 do
  begin
    if (abgleich[i] = '4') or (abgleich[i] = '7') then
    begin
      tester:=1;
    end;
  end;
  if tester=0 then
  begin
    Label2.Caption:='Zahlendreher ist möglich';
  end
  else
  begin
    Label2.Caption:='Zahlendreher ist nicht möglich';
  end;
end;

end.

