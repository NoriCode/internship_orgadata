unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, LcLtype,
  Math, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Timer4: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Spieler1Feld;
    procedure Spieler2Feld;
    procedure Gegner;
    procedure newgame;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
  private
    { private declarations }
    tick, tick2, punkte, punkte2, leben1, leben2, speed1, speed2: integer;
    spielfeld1, spielfeld2, gegnerauto, gegnerauto2: array of TImage;
    tastel, taster, pause, aktiv: boolean;
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
procedure TForm1.newgame;
begin
  Spieler1Feld;
  Spieler2Feld;
  Gegner;
  Image1.Picture.LoadFromFile('autospieler1.bmp');
  Image1.Transparent := True;
  Image1.top := Spielfeld1[32].top;
  Image1.left := Spielfeld1[32].left;
  Image1.BringToFront;
  Image2.Picture.LoadFromFile('autospieler2.bmp');
  Image2.Transparent := True;
  Image2.top := Spielfeld2[32].top;
  Image2.left := Spielfeld2[32].left;
  Image2.BringToFront;
  tick := 0;
  tick2 := 0;
  punkte := 0;
  punkte2 := 0;
  leben1 := 10;
  leben2 := 10;
  speed1 := 10;
  speed2 := 10;
end;

procedure TForm1.Spieler1Feld;   //speilfeld spieler 1
var
  i, j1, j2, j3, links, oben: integer;
begin
  setlength(Spielfeld1, 40);
  links := 0;
  oben := 0;
  j1 := 1;
  j2 := 2;
  j3 := 3;
  for i := 0 to high(Spielfeld1) do
  begin
    Spielfeld1[i] := timage.Create(self);
    Spielfeld1[i].parent := self;
    Spielfeld1[i].Width := 50;
    Spielfeld1[i].Height := 100;

    if (i = 0) then
    begin
      Spielfeld1[i].Picture.LoadFromFile('wand.bmp');
    end
    else if (i > (high(Spielfeld1) - 5)) then
    begin
      Spielfeld1[i].Picture.LoadFromFile('wandunten.bmp');
      Spielfeld1[i].Height := 25;
    end
    else if (i mod j1 = 0) then
    begin
      Spielfeld1[i].Picture.LoadFromFile('bodenlinkerrand.bmp');
      j1 := j1 + 5;
    end
    else if (i mod j2 = 0) then
    begin
      Spielfeld1[i].Picture.LoadFromFile('bodenmitte.bmp');
      j2 := j2 + 5;
    end
    else if (i mod j3 = 0) then
    begin
      Spielfeld1[i].Picture.LoadFromFile('bodenrechterrand.bmp');
      j3 := j3 + 5;
    end;

    if ((i mod 5 = 0) and (i > 0)) then
    begin
      oben := oben + 100;
      links := 0;
      Spielfeld1[i].Picture.LoadFromFile('wand.bmp');
      Spielfeld1[i - 1].Picture.LoadFromFile('wand.bmp');
    end;

    Spielfeld1[i].Left := links;
    Spielfeld1[i].Top := oben;
    links := links + 50;
  end;
end;

procedure TForm1.Spieler2Feld;   //speilfeld spieler 2
var
  i, j1, j2, j3, links, oben: integer;
begin
  setlength(Spielfeld2, 64);
  links := 350;
  oben := 0;
  j1 := 1;
  j2 := 2;
  j3 := 3;
  for i := 0 to high(Spielfeld2) do
  begin
    Spielfeld2[i] := timage.Create(self);
    Spielfeld2[i].parent := self;
    Spielfeld2[i].Width := 50;
    Spielfeld2[i].Height := 100;

    if (i = 0) then
    begin
      Spielfeld2[i].Picture.LoadFromFile('wand.bmp');
    end
    else if (i > (high(Spielfeld2) - 5)) then
    begin
      Spielfeld2[i].Picture.LoadFromFile('wandunten.bmp');
      Spielfeld2[i].Height := 25;
    end
    else if (i mod j1 = 0) then
    begin
      Spielfeld2[i].Picture.LoadFromFile('bodenlinkerrand.bmp');
      j1 := j1 + 5;
    end
    else if (i mod j2 = 0) then
    begin
      Spielfeld2[i].Picture.LoadFromFile('bodenmitte.bmp');
      j2 := j2 + 5;
    end
    else if (i mod j3 = 0) then
    begin
      Spielfeld2[i].Picture.LoadFromFile('bodenrechterrand.bmp');
      j3 := j3 + 5;
    end;

    if ((i mod 5 = 0) and (i > 0)) then
    begin
      oben := oben + 100;
      links := 350;
      Spielfeld2[i].Picture.LoadFromFile('wand.bmp');
      Spielfeld2[i - 1].Picture.LoadFromFile('wand.bmp');
    end;

    Spielfeld2[i].Left := links;
    Spielfeld2[i].Top := oben;
    links := links + 50;
  end;
end;

procedure TForm1.Gegner;   //gegnerautos erstellen und laden
var
  i, links, links2: integer;
begin
  setlength(gegnerauto, 2);
  setlength(gegnerauto2, 2);
  links := 50;
  links2 := 400;

  for i := 0 to high(gegnerauto) do
  begin
    gegnerauto[i] := timage.Create(self);
    gegnerauto[i].parent := self;
    gegnerauto[i].Width := 50;
    gegnerauto[i].Height := 100;
    gegnerauto[i].Picture.LoadFromFile('autogegner1.bmp');
    gegnerauto[i].Transparent := True;
    gegnerauto[i].top := RandomRange(-100, -500);
    gegnerauto[i].Left := links;
    links := links + 50;
    gegnerauto[i].BringToFront;

    gegnerauto2[i] := timage.Create(self);
    gegnerauto2[i].parent := self;
    gegnerauto2[i].Width := 50;
    gegnerauto2[i].Height := 100;
    gegnerauto2[i].Picture.LoadFromFile('autogegner2.bmp');
    gegnerauto2[i].Transparent := True;
    gegnerauto2[i].top := RandomRange(-100, -500);
    gegnerauto2[i].Left := links2;
    links2 := links2 + 50;
    gegnerauto2[i].BringToFront;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);  //spieler 1 gegner
var
  fahren, j, i: integer;
begin
  gegnerauto[tick].top := (gegnerauto[tick].top + speed1);

  if (gegnerauto[tick].top >= Spielfeld1[39].top) and
    (gegnerauto[tick].Visible = True) then
  begin
    gegnerauto[tick].top := -200;
    gegnerauto[tick].left := Spielfeld1[RandomRange(1, 4)].left;

    while (gegnerauto[1].left = gegnerauto[0].left) and
      ((gegnerauto[0].top + 100 >= gegnerauto[1].top) or
        (gegnerauto[1].top + 100 >= gegnerauto[0].top)) do
    begin
      gegnerauto[tick].left := Spielfeld1[RandomRange(1, 4)].left;
    end;

    gegnerauto[tick].Visible := True;
    punkte := punkte + (10 * speed1);
    Label1.Caption := IntToStr(punkte);
  end;

  if ((Image1.top + 50 > gegnerauto[tick].top) and
    (Image1.top + 50 < (gegnerauto[tick].top + gegnerauto[tick].Height)) and
    (Image1.left + 25 < (gegnerauto[tick].left + gegnerauto[tick].Width)) and
    (Image1.left + 25 > gegnerauto[tick].left)) and (Image1.Visible = True) and
    (gegnerauto[tick].Visible = True) then
  begin
    gegnerauto[tick].top := RandomRange(-100, -500);
    gegnerauto[tick].left := Spielfeld1[RandomRange(1, 4)].left;

    while (gegnerauto[1].left = gegnerauto[0].left) and
      ((gegnerauto[0].top + 100 >= gegnerauto[1].top) or
        (gegnerauto[1].top + 100 >= gegnerauto[0].top)) do
    begin
      gegnerauto[tick].left := Spielfeld1[RandomRange(1, 4)].left;
    end;

    leben1 := leben1 - 1;
  end;

  tick := tick + 1;
  if tick = 2 then
  begin
    tick := 0;
  end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);  //spieler 2 gegner
var
  fahren, j, i: integer;
begin
  gegnerauto2[tick2].top := (gegnerauto2[tick2].top + speed2);

  if (gegnerauto2[tick2].top >= Spielfeld2[39].top) and
    (gegnerauto2[tick].Visible = True) then
  begin
    gegnerauto2[tick2].top := RandomRange(-100, -500);
    gegnerauto2[tick].left := Spielfeld2[RandomRange(1, 4)].left;

    while (gegnerauto2[1].left = gegnerauto2[0].left) and
      ((gegnerauto2[0].top + 100 >= gegnerauto2[1].top) or
        (gegnerauto2[1].top + 100 >= gegnerauto2[0].top)) do
    begin
      gegnerauto2[tick].left := Spielfeld2[RandomRange(1, 4)].left;
    end;
    gegnerauto2[tick].Visible := True;
    punkte2 := punkte2 + (10 * speed2);
    Label2.Caption := IntToStr(punkte2);
  end;

  if ((Image2.top + 50 > gegnerauto2[tick].top) and
    (Image2.top + 50 < (gegnerauto2[tick].top + gegnerauto2[tick].Height)) and
    (Image2.left + 25 < (gegnerauto2[tick].left + gegnerauto2[tick].Width)) and
    (Image2.left + 25 > gegnerauto2[tick].left)) and (Image2.Visible = True) and
    (gegnerauto2[tick].Visible = True) then
  begin
    gegnerauto2[tick2].top := RandomRange(-100, -500);
    gegnerauto2[tick].left := Spielfeld2[RandomRange(1, 4)].left;

    while (gegnerauto2[1].left = gegnerauto2[0].left) and
      ((gegnerauto2[0].top + 100 >= gegnerauto2[1].top) or
        (gegnerauto2[1].top + 100 >= gegnerauto2[0].top)) do
    begin
      gegnerauto2[tick].left := Spielfeld2[RandomRange(1, 4)].left;
    end;

    leben2 := leben2 - 1;
  end;

  tick2 := tick2 + 1;
  if tick2 = 2 then
  begin
    tick2 := 0;
  end;

end;

procedure TForm1.Timer3Timer(Sender: TObject);  //lebens anzeige
var
  i: integer;
begin

  case leben1 of
    0: Image3.Picture.LoadFromFile('Leben00.bmp');
    1: Image3.Picture.LoadFromFile('Leben10.bmp');
    2: Image3.Picture.LoadFromFile('Leben20.bmp');
    3: Image3.Picture.LoadFromFile('Leben30.bmp');
    4: Image3.Picture.LoadFromFile('Leben40.bmp');
    5: Image3.Picture.LoadFromFile('Leben50.bmp');
    6: Image3.Picture.LoadFromFile('Leben60.bmp');
    7: Image3.Picture.LoadFromFile('Leben70.bmp');
    8: Image3.Picture.LoadFromFile('Leben80.bmp');
    9: Image3.Picture.LoadFromFile('Leben90.bmp');
    10: Image3.Picture.LoadFromFile('Leben100.bmp');
  end;

  case leben2 of
    0: Image4.Picture.LoadFromFile('Leben00.bmp');
    1: Image4.Picture.LoadFromFile('Leben10.bmp');
    2: Image4.Picture.LoadFromFile('Leben20.bmp');
    3: Image4.Picture.LoadFromFile('Leben30.bmp');
    4: Image4.Picture.LoadFromFile('Leben40.bmp');
    5: Image4.Picture.LoadFromFile('Leben50.bmp');
    6: Image4.Picture.LoadFromFile('Leben60.bmp');
    7: Image4.Picture.LoadFromFile('Leben70.bmp');
    8: Image4.Picture.LoadFromFile('Leben80.bmp');
    9: Image4.Picture.LoadFromFile('Leben90.bmp');
    10: Image4.Picture.LoadFromFile('Leben100.bmp');
  end;

  if (leben1 = 0) then
  begin
    timer1.Enabled := False;
    leben1 := 11;
    image1.Visible := False;
    gegnerauto[0].Visible := False;
    gegnerauto[1].Visible := False;
  end;
  if (leben2 = 0) then
  begin
    Timer2.Enabled := False;
    leben2 := 11;
    Image2.Visible := False;
    gegnerauto2[0].Visible := False;
    gegnerauto2[1].Visible := False;
  end;
  if (leben1 = 11) and (leben2 = 11) then
  begin
    Button1.Enabled := True;
  end;
end;

procedure TForm1.Timer4Timer(Sender: TObject);
//wenn max speed speed kleiner auf zufalligen wert
begin
  if (speed1 = 50) then
  begin
    speed1 := randomrange(20, 30);
    label6.caption := InttoStr(speed1);
  end
  else if (speed2 = 50) then
  begin
    speed2 := randomrange(20, 30);
    label7.caption := InttoStr(speed2);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);  //spiel öffnen
begin
  Form1.Left := 250;
  Form1.Top := 114;
  newgame;
end;

procedure TForm1.Button1Click(Sender: TObject); //spiel start
var
  i: integer;
begin
  newgame;
  timer1.Enabled := True;
  timer2.Enabled := True;
  Image1.Visible := True;
  Image2.Visible := True;
  button1.Enabled := False;
  aktiv := True;

  for i := 35 to 39 do
  begin
    Spielfeld1[i].BringToFront;
    Spielfeld2[i].BringToFront;
  end;
  Label1.Caption := IntToStr(punkte);
  Label2.Caption := IntToStr(punkte2);
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (key = vk_a) and (Image1.Left > (50)) then
  begin
    Image1.left := (Image1.Left - Image1.Width);
  end;
  if (key = vk_d) and (Image1.Left < (Spielfeld1[33].left)) then
  begin
    Image1.left := (Image1.Left + Image1.Width);
  end;
  if (key = vk_w) then
  begin
    speed1 := speed1 + 1;
    if speed1 >= 50 then
    begin
      speed1 := 50;
    end;
    label6.caption := InttoStr(speed1);
  end;

  if (key = vk_left) and (Image2.Left > (400)) then
  begin
    Image2.left := (Image2.Left - Image2.Width);
  end;
  if (key = vk_right) and (Image2.Left < (Spielfeld2[33].left)) then
  begin
    Image2.left := (Image2.Left + Image2.Width);
  end;
  if (key = vk_up) then
  begin
    speed2 := speed2 + 1;
    if speed2 >= 50 then
    begin
      speed2 := 50;
    end;
    label7.caption := InttoStr(speed2);
  end;

  if (key = vk_p) then
  begin
    if (pause = False) and (aktiv = True) then
    begin
      timer1.Enabled := False;
      timer2.Enabled := False;
      timer3.Enabled := False;
      timer4.Enabled := False;
      pause := True;
    end;
    if (pause = True) and (aktiv = False) then
    begin
      timer1.Enabled := True;
      timer2.Enabled := True;
      timer3.Enabled := True;
      timer4.Enabled := True;
      pause := False;
      aktiv := True;
    end;
  end;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (key = vk_p) then
  begin
    if (pause = True) then
    begin
      aktiv := False;
    end;
  end;
end;


end.
