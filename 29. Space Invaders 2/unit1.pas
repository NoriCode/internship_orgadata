unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, LcLtype,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button3: TButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Texturenladen;
    procedure schuss;
    procedure position;
    procedure sichtbar;
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
    punkte, punkte2, links, oben, aliens, wvreihe, speed: integer;
    gegner, geschoss: array of TImage;
    runter, rechts: array of boolean;
    schuesse, pause, aktiv, bewegungrechts, bewegunglinks: boolean;
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Texturenladen; //Texturen auxswahl
var
  i: integer;
begin
  setlength(gegner, aliens);
  setlength(geschoss, 1);

  for i := 0 to high(gegner) do
  begin
    gegner[i] := timage.Create(self);
    gegner[i].parent := self;
    gegner[i].Width := 30;
    gegner[i].Height := 35;
    gegner[i].Transparent := True;
    gegner[i].Picture.LoadFromFile('gegner2.bmp');
  end;

  for i := 0 to high(geschoss) do
  begin
    geschoss[i] := timage.Create(self);
    geschoss[i].parent := self;
    geschoss[i].Width := 5;
    geschoss[i].Height := 30;
    geschoss[i].Picture.LoadFromFile('schuss.bmp');
    geschoss[i].Visible := False;
  end;

  position;
end;

procedure TForm1.position; //aliens auf ausgangsposition setzen
var
  i: integer;
begin
  links := 575;
  oben := 80;
  for i := 0 to high(gegner) do
  begin
    if (i mod wvreihe = 0) and (i > 0) then
    begin
      oben := oben + 35;
      links := 575;
    end;

    gegner[i].Left := links;
    gegner[i].Top := oben;
    links := links + 30;

    runter[i] := False;
    rechts[i] := True;
  end;
end;

procedure TForm1.sichtbar; //aliens sichtbar machen
var
  i: integer;
begin
  for i := 0 to (aliens - 1) do
  begin
    gegner[i].Visible := True;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject); //treffer und bewegung (alien, geschoss)
var
  i: integer;
begin
  links := 0;
  oben := 105;

  for i := 0 to high(gegner) do
  begin
    if ((gegner[i].left + gegner[i].Width) < Form1.Width - 1) and (rechts[i] = True) then
    begin
      gegner[i].left := gegner[i].left + speed;
      runter[i] := True;
    end
    else if ((gegner[i].left + gegner[i].Width) > 1) and (rechts[i] = False) and
      (gegner[i].Visible = True) then
    begin
      gegner[i].left := gegner[i].left - speed;
      runter[i] := True;
    end;
    if (((gegner[i].left + gegner[i].Width) >= (Form1.Width - 1)) and
      (runter[i] = True)) or (((gegner[i].left) <= (1)) and (runter[i] = True)) and
      (gegner[i].Visible = True) then
    begin
      gegner[i].top := gegner[i].top + (round(aliens / wvreihe) * 35);
      if rechts[i] = True then
      begin
        runter[i] := False;
        rechts[i] := False;
      end
      else
      begin
        runter[i] := False;
        rechts[i] := True;
      end;
    end;

    if ((gegner[i].top + gegner[i].Height) > Label2.Top) then
    begin
      gegner[i].Visible := False;
      Button1.Enabled := True;
      if (gegner[0].Visible = False) then
      begin
        Timer1.Enabled := False;
        speed := 2;
        ShowMessage('Du hast verloren');
      end;
    end;
  end;

  if (punkte2 mod (100 * aliens) = 0) and (punkte2 > 0) then
  begin
    position;
    sichtbar;
    punkte2 := 0;
    speed := speed + 1;
  end;
  if (punkte mod (500 * aliens) = 0) and (punkte > 0) then
  begin
    timer1.Enabled := False;
    Punkte := 0;
    Punkte2 := punkte;
    Label4.Caption := 'Punkte: ' + IntToStr(punkte);
    ShowMessage('Du hast gewonnen');
    speed := 2;
    Position;
    Button1.Enabled := True;
  end;

  if (schuesse = True) and (geschoss[0].Visible = False) then
  begin
    geschoss[0].Visible := True;
  end;

  if geschoss[0].Visible = True then
  begin
    geschoss[0].top := geschoss[0].top - 25;
  end;

  if (geschoss[0].top < 90) and (geschoss[0].Visible = True) then
  begin
    geschoss[0].Visible := False;
  end;

  for i := 0 to high(gegner) do
  begin

    if (geschoss[0].top > gegner[i].top) and (geschoss[0].top <
      gegner[i].top + gegner[i].Height) and (geschoss[0].left <
      gegner[i].left + gegner[i].Width) and (geschoss[0].left > gegner[i].left) and
      (geschoss[0].Visible = True) and (gegner[i].Visible = True) then
    begin
      gegner[i].Visible := False;
      image3.Visible := False;
      schuss;
      punkte := punkte + 100;
      punkte2 := punkte;
      Label4.Caption := 'Punkte: ' + IntToStr(punkte);
    end;
  end;

  if (bewegunglinks = True) and ((Image2.left > 1)) and (pause = False) then
  begin
    Image2.left := Image2.left - 5;
  end;
  if (bewegungrechts = True) and ((Image2.left + Image2.Width) < (Form1.Width - 1)) and
    (pause = False) then
  begin
    Image2.left := Image2.left + 5;
  end;

end;


procedure TForm1.Button3Click(Sender: TObject); //Spielstart
begin
  Form1.Height := 900;
  Button3.Top := 865;
  Button3.Left := 10;
  speed := 2;

  Texturenladen;

  Image1.Visible := True;
  Timer1.Enabled := True;

  Button3.Enabled := False;
  Button1.Enabled := False;

  pause := False;
  aktiv := True;
end;

procedure TForm1.Button1Click(Sender: TObject); //Neues Spiel
begin
  position;
  sichtbar;
  button1.Enabled := False;
  Timer1.Enabled := True;
  pause := False;
  aktiv := True;
  punkte := 0;
  speed := 2;

  Punkte := 0;
  Punkte2 := punkte;
  Label4.Caption := 'Punkte: ' + IntToStr(punkte);
end;

procedure TForm1.schuss; //schuss zurücksetzen
var
  i: integer;
begin
  for i := 0 to 9 do
  begin
    if geschoss[0].Visible = True then
    begin
      geschoss[0].Top := Image2.top + 15;
      geschoss[0].Left := Image2.left + 27;
      geschoss[0].Visible := False;
      schuesse := False;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject); //spiel öffnen
var
  i: integer;
begin
  Form1.DoubleBuffered := True;
  Form1.color := clBlack;
  Form1.Height := 105;
  Form1.Left := 50;
  Image1.Picture.LoadfromFile('background.jpg');
  Image2.Picture.LoadfromFile('spieler.bmp');
  Image3.Picture.LoadfromFile('schuss.bmp');
  aliens := 30;
  punkte := 0;
  wvreihe := round(aliens / 2);

  setlength(runter, (aliens - 1));
  setlength(rechts, (aliens - 1));
  for i := 0 to (aliens - 1) do
  begin
    runter[i] := True;
    rechts[i] := True;
  end;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: word;
  Shift: TShiftState);//Steuerung
begin
  if (key = vk_left) and ((Image2.left > 1)) and (pause = False) then
  begin
    bewegunglinks := True;
    //Image2.left := Image2.left - 25;
  end;

  if (key = vk_right) and ((Image2.left + Image2.Width) < (Form1.Width - 1)) and
    (pause = False) then
  begin
    bewegungrechts := True;
    //Image2.left := Image2.left + 25;
  end;

  if (key = vk_space) and (pause = False) then
  begin
    if geschoss[0].Visible = False then
    begin
      schuesse := True;
      geschoss[0].Top := Image2.top + 15;
      geschoss[0].Left := Image2.left + 27;
      geschoss[0].Visible := True;
    end;
  end;

  if (key = vk_p) then
  begin
    if (pause = False) and (aktiv = True) then
    begin
      timer1.Enabled := False;
      pause := True;
    end;
    if (pause = True) and (aktiv = False) then
    begin
      timer1.Enabled := True;
      pause := False;
      aktiv := True;
    end;
  end;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
//steuerung zusatz
begin
  if (key = vk_right) then
  begin
    bewegungrechts := False;
  end;

  if (key = vk_left) then
  begin
    bewegunglinks := False;
  end;

  if (key = vk_p) then
  begin
    if (pause = True) then
    begin
      aktiv := False;
    end;
  end;
end;

end.
