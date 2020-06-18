unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ComCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    TrackBar1: TTrackBar;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
    passwort: string;
    punkte, lange: integer;
    code: array of integer;
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
  i: integer;
begin
  passwort := Edit1.Text;

  lange := length(passwort);

  setlength(code, lange);

  punkte:=0;

  if lange<5 then
  begin
    punkte:=-10;
  end
  else if lange<8 then
  begin
    punkte:=0;
  end
  else if lange>8 then
  begin
    punkte:=10;
  end;

  for i := 0 to lange - 1 do
  begin
    if (Ord(passwort[i]) > 32) and (Ord(passwort[i]) < 48) or
      ((Ord(passwort[i]) > 90) and (Ord(passwort[i]) < 97)) or
      ((Ord(passwort[i]) > 122) and (Ord(passwort[i]) < 127)) or
      ((Ord(passwort[i]) > 57) and (Ord(passwort[i]) < 65)) then //zeichen
    begin
      punkte:=punkte+3;
    end
    else if (Ord(passwort[i]) > 47) and (Ord(passwort[i]) < 58) then //zahlen
    begin
      punkte:=punkte+2;
    end
    else if ((Ord(passwort[i]) > 64) and ((Ord(passwort[i]) < 91)) or
      ((Ord(passwort[i]) > 96) and (Ord(passwort[i]) < 123))) then //Buchstaben
    begin
      punkte:=punkte+1;
    end;
  end;

  trackbar1.Position:=punkte;

  if punkte<10 then
  begin
    Label2.Caption:='Sicherheit: Ihr Passwort ist zu unsicher sicher!';
  end
  else if punkte<20 then
  begin
    Label2.Caption:='Sicherheit: Ihr Passwort ist nicht sicher!';
  end
  else if punkte>30 then
  begin
    Label2.Caption:='Sicherheit: Ihr Passwort ist sicher!';
  end
  else
  begin
    Label2.Caption:='Sicherheit: Ihr Passwort ist sehr sicher!';
  end;

end;

end.
