unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Gewonnen;
    procedure Punkteplus1;
    procedure Punkteplus2;
    procedure Computer;
    procedure welcherbutton;
  private
    { private declarations }
  var
    name1, name2: string;
    siege1, siege2, zug, stop, test, test2: integer;
    klick: array of integer;
    checker: array of integer;
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);//Namen ändern Spieler 1
begin
  name1 := edit1.Text;
  Label1.Caption := name1;
end;

procedure TForm1.Button10Click(Sender: TObject);//Feld: Mitte Rechts
begin
  if klick[5] = 1 then
  begin
    klick[5] := 0;

    if zug = 1 then
    begin
      Button10.Caption := 'X';
      zug := 0;
      Computer;
    end
    else
    begin
      Button10.Caption := 'O';
      zug := 1;
    end;
  end;
  Button10.enabled:=false;
  gewonnen;
end;

procedure TForm1.Button11Click(Sender: TObject);//Feld: Unten Links
begin
  if klick[6] = 1 then
  begin
    klick[6] := 0;

    if zug = 1 then
    begin
      Button11.Caption := 'X';
      zug := 0;
      Computer;
    end
    else
    begin
      Button11.Caption := 'O';
      zug := 1;
    end;
  end;
  Button11.enabled:=false;
  gewonnen;
end;

procedure TForm1.Button12Click(Sender: TObject);//Feld: Unten Mitte
begin
  if klick[7] = 1 then
  begin
    klick[7] := 0;

    if zug = 1 then
    begin
      Button12.Caption := 'X';
      zug := 0;
      Computer;
    end
    else
    begin
      Button12.Caption := 'O';
      zug := 1;
    end;
  end;
  Button12.enabled:=false;
  gewonnen;
end;

procedure TForm1.Button13Click(Sender: TObject);//Feld: Unten Rechts
begin
  if klick[8] = 1 then
  begin
    klick[8] := 0;

    if zug = 1 then
    begin
      Button13.Caption := 'X';
      zug := 0;
      Computer;
    end
    else
    begin
      Button13.Caption := 'O';
      zug := 1;
    end;
  end;
  Button13.enabled:=false;
  gewonnen;
end;

procedure TForm1.Button2Click(Sender: TObject);//Namen ändern Spieler 2
begin
  name2 := edit2.Text;
  Label2.Caption := name2;
end;

procedure TForm1.Button3Click(Sender: TObject);//Punkte rest
begin
  siege1 := 0;
  siege2 := 0;
  Label3.Caption := IntToStr(siege1);
  Label4.Caption := IntToStr(siege2);
end;

procedure TForm1.Button4Click(Sender: TObject);//neues Spiel
var
  i: integer;
begin
  zug := 1;//spieler1 darf setzen
  test2 := 0;

  for i := 0 to 8 do //felder klickbar schleife start
  begin
    klick[i] := 1;
  end;//felder klickbar schleife ende

  setlength(checker, 9);

  for i := 0 to 8 do
  begin
    checker[i] := 1;
  end;

  Button5.Caption := ' ';
  Button6.Caption := ' ';
  Button7.Caption := ' ';
  Button8.Caption := ' ';
  Button9.Caption := ' ';
  Button10.Caption := ' ';
  Button11.Caption := ' ';
  Button12.Caption := ' ';
  Button13.Caption := ' ';

  Button5.enabled:=true;
  Button6.enabled:=true;
  Button7.enabled:=true;
  Button8.enabled:=true;
  Button9.enabled:=true;
  Button10.enabled:=true;
  Button11.enabled:=true;
  Button12.enabled:=true;
  Button13.enabled:=true;

  stop := 0;
end;

procedure TForm1.Button5Click(Sender: TObject);//Feld: Oben Links
begin
  if klick[0] = 1 then
  begin
    klick[0] := 0;

    if zug = 1 then
    begin
      Button5.Caption := 'X';
      zug := 0;
      Computer;
    end
    else
    begin
      Button5.Caption := 'O';
      zug := 1;
    end;
  end;
  Button5.enabled:=false;
  gewonnen;
end;

procedure TForm1.Button6Click(Sender: TObject);//Feld: Oben Mitte
begin
  if klick[1] = 1 then
  begin
    klick[1] := 0;

    if zug = 1 then
    begin
      Button6.Caption := 'X';
      zug := 0;
      Computer;
    end
    else
    begin
      Button6.Caption := 'O';
      zug := 1;
    end;
  end;
  Button6.enabled:=false;
  gewonnen;
end;

procedure TForm1.Button7Click(Sender: TObject);//Feld: Oben Rechts
begin
  if klick[2] = 1 then
  begin
    klick[2] := 0;

    if zug = 1 then
    begin
      Button7.Caption := 'X';
      zug := 0;
      Computer;
    end
    else
    begin
      Button7.Caption := 'O';
      zug := 1;
    end;
  end;
  Button7.enabled:=false;
  gewonnen;
end;

procedure TForm1.Button8Click(Sender: TObject);//Feld: Mitte Links
begin
  if klick[3] = 1 then
  begin
    klick[3] := 0;

    if zug = 1 then
    begin
      Button8.Caption := 'X';
      zug := 0;
      Computer;
    end
    else
    begin
      Button8.Caption := 'O';
      zug := 1;
    end;
  end;
  Button8.enabled:=false;
  gewonnen;
end;

procedure TForm1.Button9Click(Sender: TObject);//Feld: Mitte Mitte
begin
  if klick[4] = 1 then
  begin
    klick[4] := 0;

    if zug = 1 then
    begin
      Button9.Caption := 'X';
      zug := 0;
      Computer;
    end
    else
    begin
      Button9.Caption := 'O';
      zug := 1;
    end;
  end;
  Button9.enabled:=false;
  gewonnen;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: integer;
begin
  zug := 1;//spieler1 darf setzen
  test2 := 0;
  setlength(klick, 9);//felder klickbarindikator

  for i := 0 to 8 do //felder klickbar schleife start
  begin
    klick[i] := 1;
  end;//felder klickbar schleife ende

  setlength(checker, 9);

  for i := 0 to 8 do
  begin
    checker[i] := 1;
  end;

  Button5.Caption := ' ';
  Button6.Caption := ' ';
  Button7.Caption := ' ';
  Button8.Caption := ' ';
  Button9.Caption := ' ';
  Button10.Caption := ' ';
  Button11.Caption := ' ';
  Button12.Caption := ' ';
  Button13.Caption := ' ';

  stop := 0;

end;

procedure TForm1.Gewonnen;
var
  i: integer;
begin
  if ((Button5.Caption = 'X') and (stop = 0) and (Button6.Caption = 'X') and
    (Button7.Caption = 'X')) or ((Button5.Caption = 'O') and (stop = 0) and
    (Button6.Caption = 'O') and (Button7.Caption = 'O')) then
  begin//wenn erste reihe horizont gleich ist
    if Button5.Caption = 'X' then
    begin
      Punkteplus1;
    end;
    if Button5.Caption = 'O' then
    begin
      Punkteplus2;
    end;
  end;
  if ((Button8.Caption = 'X') and (stop = 0) and (Button9.Caption = 'X') and
    (Button10.Caption = 'Xklick: array of integer;')) or
    ((Button8.Caption = 'O') and (stop = 0) and (Button9.Caption = 'O') and
    (Button10.Caption = 'O')) then
  begin//wenn zweite reihe horizont gleich ist
    if Button8.Caption = 'X' then
    begin
      Punkteplus1;
    end;
    if Button8.Caption = 'O' then
    begin
      Punkteplus2;
    end;
  end;
  if ((Button11.Caption = 'X') and (stop = 0) and (Button12.Caption = 'X') and
    (Button13.Caption = 'X')) or ((Button11.Caption = 'O') and
    (stop = 0) and (Button12.Caption = 'O') and (Button13.Caption = 'O')) then
  begin//wenn dritte reihe horizont gleich ist
    if Button11.Caption = 'X' then
    begin
      Punkteplus1;
    end;
    if Button11.Caption = 'O' then
    begin
      Punkteplus2;
    end;
  end;
  if ((Button5.Caption = 'X') and (stop = 0) and (Button8.Caption = 'X') and
    (Button11.Caption = 'X')) or ((Button5.Caption = 'O') and
    (stop = 0) and (Button8.Caption = 'O') and (Button11.Caption = 'O')) then
  begin//wenn erste reihe senk gleich ist
    if Button11.Caption = 'X' then
    begin
      Punkteplus1;
    end;
    if Button11.Caption = 'O' then
    begin
      Punkteplus2;
    end;
  end;
  if ((Button6.Caption = 'X') and (stop = 0) and (Button9.Caption = 'X') and
    (Button12.Caption = 'X')) or ((Button6.Caption = 'O') and
    (stop = 0) and (Button9.Caption = 'O') and (Button12.Caption = 'O')) then
  begin//wenn zweite reihe senk gleich ist
    if Button12.Caption = 'X' then
    begin
      Punkteplus1;
    end;
    if Button12.Caption = 'O' then
    begin
      Punkteplus2;
    end;
  end;
  if ((Button7.Caption = 'X') and (stop = 0) and (Button10.Caption = 'X') and
    (Button13.Caption = 'X')) or ((Button7.Caption = 'O') and
    (stop = 0) and (Button10.Caption = 'O') and (Button13.Caption = 'O')) then
  begin//wenn dritte reihe senk gleich ist
    if Button13.Caption = 'X' then
    begin
      Punkteplus1;
    end;
    if Button13.Caption = 'O' then
    begin
      Punkteplus2;
    end;
  end;
  if ((Button5.Caption = 'X') and (stop = 0) and (Button9.Caption = 'X') and
    (Button13.Caption = 'X')) or ((Button5.Caption = 'O') and
    (stop = 0) and (Button9.Caption = 'O') and (Button13.Caption = 'O')) then
  begin//wenn diag ltr gleich ist
    if Button13.Caption = 'X' then
    begin
      Punkteplus1;
    end;
    if Button13.Caption = 'O' then
    begin
      Punkteplus2;
    end;
  end;
  if ((Button7.Caption = 'X') and (stop = 0) and (Button9.Caption = 'X') and
    (Button11.Caption = 'X')) or ((Button7.Caption = 'O') and
    (stop = 0) and (Button9.Caption = 'O') and (Button11.Caption = 'O')) then
  begin//wenn diag rtl gleich ist
    if Button7.Caption = 'X' then
    begin
      Punkteplus1;
    end;
    if Button7.Caption = 'O' then
    begin
      Punkteplus2;
    end;
  end;
  if stop = 1 then
  begin
    for i := 0 to 8 do //felder nicht klickbar schleife start
    begin
      klick[i] := 0;
    end;
  end;
end;

procedure TForm1.Punkteplus1;
begin
  siege1 := siege1 + 1;
  Label3.Caption := IntToStr(siege1);
  stop := 1;
end;

procedure TForm1.Punkteplus2;
begin
  siege2 := siege2 + 1;
  Label4.Caption := IntToStr(siege2);
  stop := 1;
end;

procedure TForm1.Computer;
var
  done: boolean;
  i: integer;
begin
  if (radiobutton2.Checked = True) then
  begin
    if (radiobutton3.Checked = True) then
    begin
      repeat
        done := True;
        test := RandomRange(0, 9);
        if (klick[test] = 1) then
        begin
          welcherbutton;
          klick[test] := 0;
          done := True;
        end
        else
        begin
          done := False;
          if (klick[0] = klick[1]) and (klick[2] = klick[3]) and
            (klick[4] = klick[5]) and (klick[6] = klick[7]) and
            (klick[0] = klick[8]) then
          begin
            done := True;
          end;
        end;
        zug := 1;
      until done;
    end//leichte ki ende

    else if (radiobutton4.Checked = True) then
    begin
      if (checker[0] = 1) and (Button5.Caption = 'X') and
        (Button6.Caption = 'X') or (checker[0] = 1) and (Button5.Caption = 'X') and
        (Button7.Caption = 'X') or (checker[0] = 1) and (Button6.Caption = 'X') and
        (Button7.Caption = 'X') then
      begin
        if klick[0] = 1 then
        begin
          test := 0;
          welcherbutton;
          checker[0] := 0;
        end
        else if klick[1] = 1 then
        begin
          test := 1;
          welcherbutton;
          checker[0] := 0;
        end
        else if klick[2] = 1 then
        begin
          test := 2;
          welcherbutton;
          checker[0] := 0;
        end;
      end//feld 5 oder 6 oder 7
      else if (checker[1] = 1) and (Button5.Caption = 'X') and
        (Button8.Caption = 'X') or (checker[1] = 1) and (Button5.Caption = 'X') and
        (Button11.Caption = 'X') or (checker[1] = 1) and (Button11.Caption = 'X') and
        (Button8.Caption = 'X') then
      begin
        if klick[0] = 1 then
        begin
          test := 0;
          welcherbutton;
          checker[1] := 0;
        end
        else if klick[3] = 1 then
        begin
          test := 3;
          welcherbutton;;
          checker[1] := 0;
        end
        else if klick[6] = 1 then
        begin
          test := 6;
          welcherbutton;;
          checker[1] := 0;
        end;
      end//feld 5 oder 8 oder 11
      else if (checker[2] = 1) and (Button5.Caption = 'X') and
        (Button9.Caption = 'X') or (checker[2] = 1) and (Button5.Caption = 'X') and
        (Button13.Caption = 'X') or (checker[2] = 1) and (Button13.Caption = 'X') and
        (Button9.Caption = 'X') then
      begin
        if klick[0] = 1 then
        begin
          test := 0;
          welcherbutton;;
          checker[2] := 0;
        end
        else if klick[4] = 1 then
        begin
          test := 4;
          welcherbutton;;
          checker[2] := 0;
        end
        else if klick[8] = 1 then
        begin
          test := 8;
          welcherbutton;;
          checker[2] := 0;
        end;
      end//feld 5 oder 9 oder 13
      else if (checker[3] = 1) and (Button8.Caption = 'X') and
        (Button9.Caption = 'X') or (checker[3] = 1) and (Button8.Caption = 'X') and
        (Button10.Caption = 'X') or (checker[3] = 1) and (Button10.Caption = 'X') and
        (Button9.Caption = 'X') then
      begin
        if klick[3] = 1 then
        begin
          test := 3;
          welcherbutton;;
          checker[3] := 0;
        end
        else if klick[4] = 1 then
        begin
          test := 4;
          welcherbutton;
          checker[3] := 0;
        end
        else if klick[5] = 1 then
        begin
          test := 5;
          welcherbutton;
          checker[3] := 0;
        end;
      end//feld 8 oder 9 oder 10
      else if (checker[4] = 1) and (Button11.Caption = 'X') and
        (Button12.Caption = 'X') or (checker[4] = 1) and (Button11.Caption = 'X') and
        (Button13.Caption = 'X') or (checker[4] = 1) and (Button13.Caption = 'X') and
        (Button12.Caption = 'X') then
      begin
        if klick[6] = 1 then
        begin
          test := 6;
          welcherbutton;
          checker[4] := 0;
        end
        else if klick[7] = 1 then
        begin
          test := 7;
          welcherbutton;
          checker[4] := 0;
        end
        else if klick[8] = 1 then
        begin
          test := 8;
          welcherbutton;
          checker[4] := 0;
        end;
      end//feld 11 oder 12 oder 13
      else if (checker[5] = 1) and (Button6.Caption = 'X') and (Button12.Caption = 'X') or (checker[5] = 1) and
        (Button6.Caption = 'X') and (Button9.Caption = 'X') or (checker[5] = 1) and
        (Button9.Caption = 'X') and (Button12.Caption = 'X') then
      begin
        if klick[1] = 1 then
        begin
          test := 1;
          welcherbutton;
          checker[5] := 0;
        end
        else if klick[4] = 1 then
        begin
          test := 4;
          welcherbutton;
          checker[5] := 0;
        end
        else if klick[7] = 1 then
        begin
          test := 7;
          welcherbutton;
          checker[5] := 0;
        end;
      end//feld 6 oder 9 oder 12
      else if (checker[6] = 1) and (Button7.Caption = 'X') and (Button13.Caption = 'X') or (checker[6] = 1) and
        (Button7.Caption = 'X') and (Button10.Caption = 'X') or (checker[6] = 1) and
        (Button10.Caption = 'X') and (Button13.Caption = 'X') then
      begin
        if klick[2] = 1 then
        begin
          test := 2;
          welcherbutton;
          checker[6] := 0;
        end
        else if klick[5] = 1 then
        begin
          test := 5;
          welcherbutton;
          checker[6] := 0;
        end
        else if klick[8] = 1 then
        begin
          test := 8;
          welcherbutton;
          checker[6] := 0;
        end;
      end//feld 7 oder 10 oder 13
      else if (checker[7] = 1) and (Button7.Caption = 'X') and (Button9.Caption = 'X') or (checker[7] = 1) and
        (Button7.Caption = 'X') and (Button11.Caption = 'X') or (checker[7] = 1) and
        (Button11.Caption = 'X') and (Button9.Caption = 'X') then
      begin
        if klick[2] = 1 then
        begin
          test := 2;
          welcherbutton;
          checker[7] := 0;
        end
        else if klick[4] = 1 then
        begin
          test := 4;
          welcherbutton;
          checker[7] := 0;
        end
        else if klick[6] = 1 then
        begin
          test := 6;
          welcherbutton;
          checker[7] := 0;
        end;
      end//feld 7 oder 9 oder 11
      else
      begin
        repeat
        done := True;
        test := RandomRange(0, 9);
        if (klick[test] = 1) then
        begin
          welcherbutton;
          klick[test] := 0;
          done := True;
        end
        else
        begin
          done := False;
          if (klick[0] = klick[1]) and (klick[2] = klick[3]) and
            (klick[4] = klick[5]) and (klick[6] = klick[7]) and
            (klick[0] = klick[8]) then
          begin
            done := True;
          end;
        end;
      until done;
      end;
      zug := 1;
    end
    else if (radiobutton5.Checked = True) then
    begin
      zug := 1;
    end;
  end;
end;

procedure TForm1.welcherbutton;
begin
  case test of
    0:
    begin
      Button5.Caption := 'O';
      Button5.enabled:=false;
    end;
    1:
    begin
      Button6.Caption := 'O';
      Button6.enabled:=false;
    end;
    2:
    begin
      Button7.Caption := 'O';
      Button7.enabled:=false;
    end;
    3:
    begin
      Button8.Caption := 'O';
      Button8.enabled:=false;
    end;
    4:
    begin
      Button9.Caption := 'O';
      Button9.enabled:=false;
    end;
    5:
    begin
      Button10.Caption := 'O';
      Button10.enabled:=false;
    end;
    6:
    begin
      Button11.Caption := 'O';
      Button11.enabled:=false;
    end;
    7:
    begin
      Button12.Caption := 'O';
      Button12.enabled:=false;
    end;
    8:
    begin
      Button13.Caption := 'O';
      Button13.enabled:=false;
    end;
  end;

end;

end.
