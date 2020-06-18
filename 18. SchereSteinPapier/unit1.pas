unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, Math, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
    siegecom, siegespiel:integer;
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
  zahl, computer:integer;
  computerwin, spielerwin, keinerwin:String;
begin
  zahl:=RandomRange(1,6);
  computerwin:='Computer gewinnt';
  spielerwin:='Spieler gewinnt';
  keinerwin:='Keiner gewinnt';

  if zahl <= 2 then
  begin
    label8.Caption := 'Schere';
    computer:=1;
  end
  else if zahl <= 4 then
  begin
    label8.Caption := 'Stein';
    computer:=2;
  end
  else if zahl <= 6 then
  begin
    label8.Caption := 'Papier';
    computer:=3;
  end;

  if (RadioButton1.Checked = True)then
  begin
      label7.Caption := 'Schere';

      if computer = 1 then
      begin
         label9.Caption := keinerwin;
         label3.Caption := InttoStr(siegespiel);
         label4.Caption := InttoStr(siegecom);
      end
      else if computer = 2 then
      begin
           label9.Caption :=computerwin;
           siegecom:=siegecom+1;
           label3.Caption := InttoStr(siegespiel);
           label4.Caption := InttoStr(siegecom);
      end
      else if computer = 3 then
      begin
           label9.Caption := spielerwin;
           siegespiel:=siegespiel+1;
           label3.Caption := InttoStr(siegespiel);
           label4.Caption := InttoStr(siegecom);
      end
  end
  else if (RadioButton2.Checked = True)then
  begin
      label7.Caption := 'Stein';

      if computer = 1 then
      begin
           label9.Caption := spielerwin;
           siegespiel:=siegespiel+1;
           label3.Caption := InttoStr(siegespiel);
           label4.Caption := InttoStr(siegecom);
      end
      else if computer = 2 then
      begin
           label9.Caption := keinerwin;
           label3.Caption := InttoStr(siegespiel);
           label4.Caption := InttoStr(siegecom);
      end
      else if computer = 3 then
      begin
           label9.Caption :=computerwin;
           siegecom:=siegecom+1;
           label3.Caption := InttoStr(siegespiel);
           label4.Caption := InttoStr(siegecom);
      end
  end
  else if (RadioButton3.Checked = True)then
  begin
      label7.Caption := 'Papier';

      if computer = 1 then
      begin
           label9.Caption :=computerwin;
           siegecom:=siegecom+1;
           label3.Caption := InttoStr(siegespiel);
           label4.Caption := InttoStr(siegecom);
      end
      else if computer = 2 then
      begin
           label9.Caption := spielerwin;
           siegespiel:=siegespiel+1;
           label3.Caption := InttoStr(siegespiel);
           label4.Caption := InttoStr(siegecom);
      end
      else if computer = 3 then
      begin
           label9.Caption := keinerwin;
           label3.Caption := InttoStr(siegespiel);
           label4.Caption := InttoStr(siegecom);
      end
  end


end;

end.

