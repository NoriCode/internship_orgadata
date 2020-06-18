unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls, LcLtype, Math,
  ExtCtrls;

type

  { TForm1 }


  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
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
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: word);
    procedure FormResize(Sender: TObject);
    procedure neuesspiel;
    procedure MaperstellenohneTexturen;
    procedure texturenladen;
    procedure bausteinzuordnung;
    procedure level1;
    procedure level5;
    procedure spielerladen;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
  private
    { private declarations }
    spielerposition, ziel, level, bausteinwahl, powerup, falle, welchespowerup: integer;
    s: string;
    Daten: TextFile;
    marker: array of integer;
    baustein: array of string;
    mapteil: array of TImage;
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}


{ TForm1 }



procedure Tform1.neuesspiel;
begin
  Label12.Visible := false;
  Label15.Visible := false;
  Button1.Visible := false;
  timer2.Enabled := false;
  Randomize;
  level := 1;
  form1.color := clblack;
  setlength(baustein, 400);
  setlength(marker, 401);
  MaperstellenohneTexturen;
  Level1;
  spielerladen;
  timer1.enabled:= true;
  timer2.enabled:= true;
end;

procedure Tform1.MaperstellenohneTexturen;
//Alle Felder erstellen und Rand mit Texturen füllen
var
  links, oben, i: integer;
begin
  setlength(mapteil, 400);
  links := 0;
  oben := 0;

  for i := 0 to high(mapteil) do
  begin
    mapteil[i] := timage.Create(self);
    mapteil[i].parent := self;
    mapteil[i].Width := 50;//Round((Form1.Width-200)/20);
    mapteil[i].Height := 50;//Round(Form1.Height/20);
    mapteil[i].tag := 0;

    if (i mod 20 = 0) and (i > 0) then
    begin
      oben := oben + 50;//Round(Form1.Height/20);
      links := 0;
    end;

    if (i < 20) or (i > 379) then
    begin
      mapteil[i].Picture.LoadFromFile('blocko.png');
      mapteil[i].tag := 1;
      marker[i + 1] := 1;
    end;

    if (mapteil[i].tag <> 1) then
    begin
      mapteil[i].Picture.LoadFromFile('boden.png');
      mapteil[i].tag := 0;
      marker[i + 1] := 0;
    end;

    mapteil[i].left := links;
    mapteil[i].top := oben;

    links := links + 50;//Round((Form1.Width-200)/20);
  end;
end;

procedure TForm1.texturenladen;  //texturen laden
var
  i, tester: integer;
  powerupstart, fallelegen: boolean;
begin
  powerupstart := False;
  fallelegen := False;
  for i := 1 to 400 do
  begin
    if marker[i] = 1 then
    begin
      mapteil[i - 1].Picture.LoadFromFile('blocko.png');
      mapteil[i - 1].tag := 1;

      tester := randomrange(1, 100);
    end;
    if marker[i] = 0 then
    begin
      mapteil[i - 1].Picture.LoadFromFile('boden.png');
      mapteil[i - 1].tag := 0;

      if (powerupstart = False) then
      begin
        tester := randomrange(1, 100);
        if (tester mod 5 = 0) and (i > 100) then
        begin
          powerup := i - 1;
          mapteil[i - 1].Picture.LoadFromFile('powerup.png');
          mapteil[i - 1].tag := 0;
          powerupstart := True;
        end;
      end;
      if (fallelegen = false) then
      begin
        tester := randomrange(1, 100);
        if (tester mod 5 = 0) and (i > 100) and (level <> 1)then
        begin
          falle := i - 1;
          mapteil[i - 1].Picture.LoadFromFile('falle.png');
          mapteil[i - 1].tag := 0;
          fallelegen := True;
        end;
      end;
    end;
    mapteil[i-1].stretch:= true;
  end;
end;

procedure TForm1.bausteinzuordnung;  //welcher baustein für 3x3 feld
var
  i, tester: integer;
begin
  tester := 10;
  for i := 22 to 337 do
  begin
    if marker[i] > 1 then
    begin
      bausteinwahl := random(tester);
      case bausteinwahl of
        1:
        begin
          marker[i] := 0;
          marker[i + 1] := 0;
          marker[i + 2] := 0;
          marker[i + 20] := 0;
          marker[i + 21] := 1;
          marker[i + 22] := 1;
          marker[i + 40] := 0;
          marker[i + 41] := 1;
          marker[i + 42] := 0;
        end;
        2:
        begin
          marker[i] := 0;
          marker[i + 1] := 0;
          marker[i + 2] := 0;
          marker[i + 20] := 1;
          marker[i + 21] := 1;
          marker[i + 22] := 0;
          marker[i + 40] := 0;
          marker[i + 41] := 1;
          marker[i + 42] := 0;
        end;
        3:
        begin
          marker[i] := 0;
          marker[i + 1] := 1;
          marker[i + 2] := 0;
          marker[i + 20] := 0;
          marker[i + 21] := 1;
          marker[i + 22] := 1;
          marker[i + 40] := 0;
          marker[i + 41] := 0;
          marker[i + 42] := 0;

        end;
        4:
        begin
          marker[i] := 0;
          marker[i + 1] := 1;
          marker[i + 2] := 0;
          marker[i + 20] := 1;
          marker[i + 21] := 1;
          marker[i + 22] := 0;
          marker[i + 40] := 0;
          marker[i + 41] := 0;
          marker[i + 42] := 0;
        end;
        5:
        begin
          marker[i] := 0;
          marker[i + 1] := 0;
          marker[i + 2] := 0;
          marker[i + 20] := 1;
          marker[i + 21] := 1;
          marker[i + 22] := 1;
          marker[i + 40] := 0;
          marker[i + 41] := 1;
          marker[i + 42] := 0;
        end;
        6:
        begin
          marker[i] := 0;
          marker[i + 1] := 1;
          marker[i + 2] := 0;
          marker[i + 20] := 1;
          marker[i + 21] := 1;
          marker[i + 22] := 0;
          marker[i + 40] := 0;
          marker[i + 41] := 1;
          marker[i + 42] := 0;
        end;
        7:
        begin
          marker[i] := 0;
          marker[i + 1] := 1;
          marker[i + 2] := 0;
          marker[i + 20] := 1;
          marker[i + 21] := 1;
          marker[i + 22] := 1;
          marker[i + 40] := 0;
          marker[i + 41] := 0;
          marker[i + 42] := 0;
        end;
        8:
        begin
          marker[i] := 0;
          marker[i + 1] := 1;
          marker[i + 2] := 0;
          marker[i + 20] := 0;
          marker[i + 21] := 1;
          marker[i + 22] := 1;
          marker[i + 40] := 0;
          marker[i + 41] := 1;
          marker[i + 42] := 0;
        end;
      end;
    end;
    if (i mod 20 = 0) or (i > 379) or (i <= 20) or (i mod 20 = 1) then
    begin
      marker[i] := 1;
    end;
  end;
end;

procedure TForm1.level1;  //level 1
var
  i: integer;
begin
  ziel := 211;
 AssignFile(Daten, 'level1.txt');
  reset(daten);

  for i := 1 to 400 do
  begin
    ReadLn(Daten, s);
    marker[i] := StrToInt(s);
  end;

  texturenladen;
  CloseFile(Daten);
  mapteil[ziel].Picture.LoadFromFile('bodenziel.png');
  mapteil[ziel].tag := 0;
  Form1.Caption := 'Jail Escape Level ' + IntToStr(level);
  Label10.Caption := 'Jail Escape Level ' + IntToStr(level);
end;

procedure Tform1.level5;  //level 5 und höher
var
  i: integer;
begin
  Button1.Enabled:=true;
  Timer3.enabled:= true;
  ziel := randomrange(21, 338);
  while (ziel mod 20 = 0) or ((ziel + 1) mod 20 = 0) or (ziel = spielerposition) do
  begin
    ziel := randomrange(21, 338);
  end;

  for i := 1 to 400 do
  begin
    if (i mod 20 = 0) or (i > 379) or (i <= 20) or (i mod 20 = 1) then
    begin
      marker[i] := 1;
    end
    else
    begin
      marker[i] := 2;
    end;
  end;
  bausteinzuordnung;

  texturenladen;
  mapteil[ziel].Picture.LoadFromFile('bodenziel.png');
  mapteil[ziel].tag := 0;
  mapteil[spielerposition].Picture.LoadFromFile('spielerlinks.png');
  mapteil[spielerposition].tag := 0;
  Form1.Caption := 'Jail Escape Level ' + IntToStr(level);
  Label10.Caption := 'Jail Escape Level ' + IntToStr(level);
end;

procedure Tform1.spielerladen;  //spieler erstellen
var
  a: integer;
begin
  a := 183;
  mapteil[a].Picture.LoadFromFile('spielerrunter.png');
  mapteil[a].tag := 0;
  marker[a + 1] := 0;
  spielerposition := a;
end;

procedure TForm1.Timer1Timer(Sender: TObject); //ist spieler im ziel und "lichtkegel"
var
  i, tester, powerupstopp: integer;
begin
  mapteil[spielerposition - 21].Visible := True;
  mapteil[spielerposition - 20].Visible := True;
  mapteil[spielerposition - 19].Visible := True;
  mapteil[spielerposition - 1].Visible := True;
  mapteil[spielerposition].Visible := True;
  mapteil[spielerposition + 1].Visible := True;
  mapteil[spielerposition + 19].Visible := True;
  mapteil[spielerposition + 20].Visible := True;
  mapteil[spielerposition + 21].Visible := True;

  if (spielerposition = ziel) then
  begin
    level := level + 1;

    Form1.Caption := 'Jail Escape Level ' + IntToStr(level);
    Label10.Caption := 'Jail Escape Level ' + IntToStr(level);

    spielerposition := ziel;
    welchespowerup := 0;
    Label12.Visible := true;
    Label15.Visible := true;
    Button1.Visible := true;
    timer2.Enabled := True;
    for i := 0 to 399 do
    begin
      mapteil[i].Visible := False;
    end;

    for i := 0 to high(mapteil) do
    begin
      mapteil[i].tag := 0;
    end;
    level5;
    case level of
      1: level1;
    end;
  end;

  if level >= 101 then
  begin
    timer1.enabled:= false;
    timer3.enabled:= false;
    showmessage('Du hast alle Level geschaft oder doch nicht');
    neuesspiel;
  end;

  if level = 0 then
  begin
    timer1.enabled:= false;
    timer3.enabled:= false;
    showmessage('Du startest wieder in Level 1');
    neuesspiel;
  end;

  if (spielerposition = falle) then
  begin
    falle := 501;
    level := level-1;
    welchespowerup := 10;
    level5;
  end;

  if (spielerposition = powerup) then
  begin
    powerup := 500;
    tester := random(100);
    if tester mod 21 = 0 then
    begin
      welchespowerup := 3;
    end
    else if tester mod 10 = 0 then
    begin
      welchespowerup := 2;
    end
    else
    begin
      welchespowerup := 1;
    end;
  end;

  if welchespowerup = 1 then
  begin
    if spielerposition - 42 > 1 then
      mapteil[spielerposition - 42].Visible := True;
    if spielerposition - 41 > 1 then
      mapteil[spielerposition - 41].Visible := True;
    if spielerposition - 40 > 1 then
      mapteil[spielerposition - 40].Visible := True;
    if spielerposition - 39 > 1 then
      mapteil[spielerposition - 39].Visible := True;
    if spielerposition - 38 > 1 then
      mapteil[spielerposition - 38].Visible := True;
    if spielerposition - 22 > 1 then
      mapteil[spielerposition - 22].Visible := True;
    if spielerposition - 18 > 1 then
      mapteil[spielerposition - 18].Visible := True;
    if spielerposition - 2 > 1 then
      mapteil[spielerposition - 2].Visible := True;

    if spielerposition + 2 > 1 then
      mapteil[spielerposition + 2].Visible := True;
    if spielerposition + 18 < 400 then
      mapteil[spielerposition + 18].Visible := True;
    if spielerposition + 22 < 400 then
      mapteil[spielerposition + 22].Visible := True;
    if spielerposition + 38 < 400 then
      mapteil[spielerposition + 38].Visible := True;
    if spielerposition + 39 < 400 then
      mapteil[spielerposition + 39].Visible := True;
    if spielerposition + 40 < 400 then
      mapteil[spielerposition + 40].Visible := True;
    if spielerposition + 41 < 400 then
      mapteil[spielerposition + 41].Visible := True;
    if spielerposition + 42 < 400 then
      mapteil[spielerposition + 42].Visible := True;
  end
  else if welchespowerup = 2 then
  begin
    mapteil[ziel].Visible := True;
  end
  else if welchespowerup = 3 then
  begin
    timer2.Enabled := False;
    for i:=0 to 399 do
    begin
      mapteil[i].visible := true;
    end;
  end;
end;

procedure TForm1.Timer2Timer(Sender: TObject); //alles wieder dunkel
var
  i: integer;
begin
  for i := 0 to 399 do
  begin
    mapteil[i].Visible := False;
  end;
end;

procedure TForm1.Timer3Timer(Sender: TObject);  //button klickbar timer 10sek
begin
  Button1.Enabled:=true;
end;

procedure TForm1.FormCreate(Sender: TObject); //spielstart
begin
  neuesspiel;
  form1.left := 0;
  form1.top := 50;
end;

procedure TForm1.Button1Click(Sender: TObject);  //level zu schwer neues level button
begin
  level-=1;
  level5;
  Button1.Enabled:=false;
  Timer3.enabled:= true;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: word);
//steuerung
var
  i: integer;
begin
  if (key = vk_up) then //hoch
  begin
    if (mapteil[spielerposition - 20].tag = 0) then
    begin
      mapteil[spielerposition].Picture.LoadFromFile('boden.png');
      spielerposition := spielerposition - 20;
    end;

    mapteil[spielerposition].Picture.LoadFromFile('spielerhoch.png');
  end;

  if (key = vk_right) then //rechts
  begin
    if (mapteil[spielerposition + 1].tag = 0) then
    begin
      mapteil[spielerposition].Picture.LoadFromFile('boden.png');
      spielerposition := spielerposition + 1;
    end;

    mapteil[spielerposition].Picture.LoadFromFile('spielerrechts.png');
  end;

  if (key = vk_down) and (mapteil[spielerposition + 20].tag = 0) then //runter
  begin
    if (mapteil[spielerposition + 20].tag = 0) then
    begin
      mapteil[spielerposition].Picture.LoadFromFile('boden.png');
      spielerposition := spielerposition + 20;
    end;

    mapteil[spielerposition].Picture.LoadFromFile('spielerrunter.png');
  end;

  if (key = vk_left) then //links
  begin
    if (mapteil[spielerposition - 1].tag = 0) then
    begin
      mapteil[spielerposition].Picture.LoadFromFile('boden.png');
      spielerposition := spielerposition - 1;
    end;

    mapteil[spielerposition].Picture.LoadFromFile('spielerlinks.png');
  end;

  if (key = vk_q) and (spielerposition - 21 > 10) then
  begin
    if (mapteil[spielerposition - 21].tag = 0) then
    begin
      mapteil[spielerposition].Picture.LoadFromFile('boden.png');
      spielerposition := spielerposition - 21;
    end;

    mapteil[spielerposition].Picture.LoadFromFile('spielerhoch.png');
  end;

  if (key = vk_e) then
  begin
    if (mapteil[spielerposition - 19].tag = 0) then
    begin
      mapteil[spielerposition].Picture.LoadFromFile('boden.png');
      spielerposition := spielerposition - 19;
    end;

    mapteil[spielerposition].Picture.LoadFromFile('spielerhoch.png');
  end;

  if (key = vk_a) then
  begin
    if (mapteil[spielerposition + 19].tag = 0) then
    begin
      mapteil[spielerposition].Picture.LoadFromFile('boden.png');
      spielerposition := spielerposition + 19;
    end;

    mapteil[spielerposition].Picture.LoadFromFile('spielerrunter.png');
  end;

  if (key = vk_d) then
  begin
    if (mapteil[spielerposition + 21].tag = 0) and (spielerposition + 21 < 400) then
    begin
      mapteil[spielerposition].Picture.LoadFromFile('boden.png');
      spielerposition := spielerposition + 21;
    end;

    mapteil[spielerposition].Picture.LoadFromFile('spielerrunter.png');
  end;
  if (key = VK_0) then
  begin
    //if timer2.Enabled = True then
    //begin
    //  timer2.Enabled := False;
    //  for i := 0 to 399 do
    //  begin
    //    mapteil[i].Visible := True;
    //  end;
    //end
    //else
    //begin
    //  timer2.Enabled := True;
    //end;
  end;
end;

procedure TForm1.FormResize(Sender: TObject);
var
  i, oben, links:integer;
begin
  //Form1.height := 500;
  label1.left := Form1.Width-200;
  label2.left := Form1.Width-200;
  label3.left := Form1.Width-200;
  label4.left := Form1.Width-200;
  label5.left := Form1.Width-200;
  label6.left := Form1.Width-200;
  label7.left := Form1.Width-200;
  label8.left := Form1.Width-200;
  label9.left := Form1.Width-200;
  label10.left := Form1.Width-200;
  label11.left := Form1.Width-200;
  label12.left := Form1.Width-200;
  label13.left := Form1.Width-200;
  label14.left := Form1.Width-200;
  label15.left := Form1.Width-200;
  Button1.Left := Form1.Width-200;
end;

end.
