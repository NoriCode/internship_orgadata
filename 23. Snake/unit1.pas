unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Math, LcLtype, StdCtrls, ComCtrls;

const
  farben: Array [0..2] of TColor = (clBlack, clMaroon, clGreen); //Bg food snkae
  raster = 10;
  breite = 50; //0 bis 24 -> 25
  hoehe = 50;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    PaintBox1: TPaintBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioGroup1: TRadioGroup;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure wieschwer;
  private
    { private declarations }
    map: Array [0..breite] of Array [0..hoehe] of Integer;
    kopf,
    richtung,
    futter: TPoint;
    laenge,
    punkte, score, schwierigkeit, apfel, highscore, highlaenge, highapfel: Integer;
    ende: Boolean;
    bmp: TBitmap;
    procedure spiel_ende;
    procedure neues_futter;
    procedure paint_map;
    procedure calc_snake;
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.spiel_ende;
begin
  ende := True;
  Timer1.Enabled := False;

  if (score > highscore) then
  begin
    highscore := score;
    Label4.Caption:=InttoStr(highscore);
  end;

  if (laenge > highlaenge) then
  begin
    highlaenge := laenge;
    Label5.Caption:=InttoStr(highlaenge);
  end;

  if (apfel > highapfel) then
  begin
    highapfel := apfel;
    Label6.Caption:=InttoStr(highapfel);
  end;

  laenge := 5;
  score :=0;
  apfel := 0;
  Label1.Caption:=InttoStr(apfel);
  Label2.Caption:=InttoStr(score);
  Label3.Caption:=InttoStr(laenge);

  Button1.Enabled := True;
  Radiobutton1.enabled:= true;
  Radiobutton2.enabled:= true;
  Radiobutton3.enabled:= true;
  Radiobutton4.enabled:= true;
  Radiobutton5.enabled:= true;
end;

procedure TForm1.neues_futter;
begin
  futter := Point(Randomrange(1,breite), Randomrange(1,hoehe));
  while map[futter.X, futter.Y]<>0 do
    futter := Point(Random(breite), Random(hoehe));
  map[futter.X,futter.Y] := -1;
end;

procedure TForm1.paint_map;
var
  i, j: Integer;
  col: TColor;
begin
  for i := 1 to breite do
    for j := 1 to hoehe do
    begin
      case map[i, j] of
        -1: col := farben[1];
         0: col := farben[0];
      else
        col := farben[2];
      end;
      PaintBox1.Canvas.Brush.Color:=col;
      PaintBox1.Canvas.FillRect(Rect(i*raster, j*raster, (i+1)*raster, (j+1)*raster));
    end;
end;

procedure TForm1.calc_snake;
var
  i, j: Integer;
begin
  for i := 0 to breite do
    for j := 0 to hoehe do
      if map[i, j]>0 then
        Dec(map[i, j]);
  Inc(kopf.X, richtung.X);
  Inc(kopf.Y, richtung.Y);
  if (kopf.X=0) or (kopf.X=breite) or (kopf.Y=0) or (kopf.Y=hoehe) then
  begin
    spiel_ende;
    ShowMessage('Sie haben den Rand berührt!');
  end
  else if (map[kopf.X, kopf.Y]>0) and (not ende) then
  begin
    spiel_ende;
    ShowMessage('Sie haben sich selbst gebissen!');
  end;
  if (kopf.X=futter.X) and (kopf.Y=futter.Y) then
  begin
    Inc(laenge);
    score:= score+(200-Timer1.interval+apfel);
    apfel := apfel+1;
    neues_futter;
    Label1.Caption:=InttoStr(apfel);
    Label2.Caption:=InttoStr(score);
    Label3.Caption:=InttoStr(laenge);
  end;
  map[kopf.X, kopf.Y] := laenge;
end;

procedure TForm1.wieschwer;
begin
  if Radiobutton1.checked = true then
  begin
    Timer1.interval:=200;
  end
  else if Radiobutton2.checked = true then
  begin
    Timer1.interval:=100;
  end
  else if Radiobutton3.checked = true then
  begin
    Timer1.interval:=75;
  end
  else if Radiobutton4.checked = true then
  begin
    Timer1.interval:=25;
  end
  else if Radiobutton5.checked = true then
  begin
    Timer1.interval:=1;
  end;
  Radiobutton1.enabled:= false;
  Radiobutton2.enabled:= false;
  Radiobutton3.enabled:= false;
  Radiobutton4.enabled:= false;
  Radiobutton5.enabled:= false;
end;

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  calc_snake;
  if not ende then
    paint_map;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i, j: Integer;
begin
  Button1.Enabled := False;
  for i:=0 to breite do
    for j:=0 to hoehe do
      map[i, j] := 0;
  kopf := Point(1, 1);
  laenge := 5;
  richtung := Point(0, 1);
  map[kopf.X, kopf.Y] := laenge;
  neues_futter;
  paint_map;
  ende := False;
  wieschwer;
  Timer1.Enabled := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_left then
  begin
    if richtung.X=0 then richtung := Point(-1, 0);
  end;
  if key = vk_up then
  begin
    if richtung.Y=0 then  richtung := Point(0, -1);
  end;
  if key = vk_right then
  begin
    if richtung.X=0 then richtung := Point(1, 0);
  end;
  if key = vk_down then
  begin
    if richtung.Y=0 then  richtung := Point(0, 1);
  end;
end;


end.

