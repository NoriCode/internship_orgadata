unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Math, LcLtype, ExtCtrls;

const
  farben: array [0..2] of TColor = (clLime, clBlack, clMaroon); //Bg food snkae
  raster = 10;
  breite = 25; //0 bis 24 -> 25
  hoehe = 25;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure NeuesFeld;
    procedure level1;
    procedure level2;
    procedure level3;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { private declarations }
    spielfeld: array of TImage;
    feld: TImage;
    gegner, spieler, wohin, score, ziel: integer;
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
procedure TForm1.NeuesFeld;
var
  i, b, links, oben, test, wand: integer;
begin
  setlength(Spielfeld, 441);
  links := 0;
  oben := 0;
  wand := 1;
  spieler := 1;
  tag := 1;
  for i := 0 to 440 do
  begin
    test := Randomrange(0, 400);
    Spielfeld[i] := timage.Create(self);
    Spielfeld[i].parent := self;

    if (i < 21) or (i > 419) or ((test mod 3 = 0) and (test mod 5 = 0)) or
      ((test mod 3 = 0) and (test mod 2 = 0)) then
    begin
      Spielfeld[i].Picture.LoadFromFile('wand.png');
      wand := 1;
      Spielfeld[i].tag := 1;
    end
    else
    begin
      Spielfeld[i].Picture.LoadFromFile('boden.png');
    end;


    if ((i mod 21 = 0) and (i > 0)) then
    begin
      oben := oben + 25;
      links := 0;
      Spielfeld[i].Picture.LoadFromFile('wand.png');
      Spielfeld[i - 1].Picture.LoadFromFile('wand.png');
      Spielfeld[i].tag := 1;
      Spielfeld[i - 1].tag := 1;
    end;

    Spielfeld[i].Left := links;
    Spielfeld[i].Top := oben;
    links := links + 25;
  end;

  gegner := Randomrange(300, 419);

  Spielfeld[gegner].Picture.LoadFromFile('gegner.png');
  ziel:=gegner;
  Spielfeld[ziel].Picture.LoadFromFile('ziel.png');
  Spielfeld[22].Picture.LoadFromFile('spieler.png');
  Timer1.Enabled := True;
  Spielfeld[1].Enabled := False;
end;

procedure TForm1.level1;
var
  i, links, oben, test, wand: integer;
begin
  setlength(Spielfeld, 441);
  links := 0;
  oben := 0;
  wand := 1;
  spieler := 1;
  tag := 1;
  for i := 0 to 440 do
  begin
    if (i > 21) or (i < 419) then
    begin
      Spielfeld[i].Picture.LoadFromFile('boden.png');
    end;

    if ((i mod 21 = 0) and (i > 0)) then
    begin
      oben := oben + 25;
      links := 0;
    end;
  end;

end;

procedure TForm1.level2;
begin

end;

procedure TForm1.level3;
begin

end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  wohin2: integer;
begin
  wohin := RandomRange(1, 5);
  if wohin = 1 then
  begin
    wohin2 := gegner - 21;
  end
  else if wohin = 2 then
  begin
    wohin2 := gegner + 21;
  end
  else if wohin = 3 then
  begin
    wohin2 := gegner - 1;
  end
  else if wohin = 4 then
  begin
    wohin2 := gegner + 1;
  end;

  if (wohin2 < 1) or (wohin2 > 419) or (Gegner = spieler) or
    (Spielfeld[wohin2].Tag = 1) then
  begin
    wohin := RandomRange(1, 5);
    wohin2 := gegner;
  end
  else
  begin
    Spielfeld[wohin2].Picture.LoadFromFile('gegner.png');
    Spielfeld[gegner].Picture.LoadFromFile('boden.png');


    if gegner = ziel then
    begin
      Spielfeld[ziel].Picture.LoadFromFile('ziel.png');
      Spielfeld[ziel].Tag:=0;
    end;
    gegner := wohin2;
  end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);

procedure TForm1.Button1Click(Sender: TObject);
var
  test, i: integer;
begin
  NeuesFeld;
  button1.Enabled := False;
  timer1.Enabled := True;
  timer2.Enabled := True;
  wohin := 1;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
var
  wohin2: integer;
begin
  if key = vk_left then
  begin
    wohin2 := spieler - 1;
  end;
  if key = vk_up then
  begin
    wohin2 := spieler - 21;
  end;
  if key = vk_right then
  begin
    wohin2 := spieler + 1;
  end;
  if key = vk_down then
  begin
    wohin2 := spieler + 21;
  end;
  if (wohin2 < 1) or (wohin2 > 441) or (Spielfeld[wohin2].tag = 1) then
  begin

  end
  else
  begin
    Spielfeld[wohin2].Picture.LoadFromFile('spieler.png');
    Spielfeld[spieler].Picture.LoadFromFile('boden.png');
    spieler := wohin2;
  end;
  Spielfeld[1].Picture.LoadFromFile('wand.png');
end;

end.
