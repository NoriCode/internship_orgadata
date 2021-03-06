unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Math,
  LcLtype, StdCtrls, ExtCtrls, ComCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button3: TButton;
    Image1: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure punkteplus;
    procedure aliensladen;
    procedure Timer1Timer(Sender: TObject);
    procedure neuesspiel;
    procedure sichtbar;
    procedure Timer2Timer(Sender: TObject);
    procedure schusszurueck;
    procedure timerspeed;
    procedure neueslevelladen;
  private
    { private declarations }
  public
    richtung, punkte, level, speed, check: integer;
    alienspeed: double;
    runter, rechts, go, schuss: boolean;
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if go = True then
  begin
    if (key = vk_left) and ((Image13.left > 16)) then
    begin
      Image13.left := Image13.left - 10;
    end;
    if (key = vk_right) and ((Image13.left + Image13.Width) < (Form1.Width - 16)) then
    begin
      Image13.left := Image13.left + 10;
    end;
  end;
  if (key = vk_space) and (Image14.Visible = false)then
  begin
    schusszurueck;
    schuss := True;
  end;
  if (key = vk_P)then
  begin
    if Timer1.Enabled = True then
    begin
      Timer1.Enabled := False;
      Timer2.Enabled:= false;
      button1.Enabled := True;
      button3.Enabled := True;
    end
    else
    begin
      Timer1.Enabled := True;
      button3.Enabled := False;
    end;
  end;
end;

procedure TForm1.neuesspiel;
begin
  Image1.left := 16;
  Image2.left := 100;
  Image3.left := 184;
  Image4.left := 268;
  Image5.left := 16;
  Image6.left := 100;
  Image7.left := 184;
  Image8.left := 268;
  Image9.left := 16;
  Image10.left := 100;
  Image11.left := 184;
  Image12.left := 268;

  Image1.top := 150;
  Image2.top := 150;
  Image3.top := 150;
  Image4.top := 150;
  Image5.top := 192;
  Image6.top := 192;
  Image7.top := 192;
  Image8.top := 192;
  Image9.top := 234;
  Image10.top := 234;
  Image11.top := 234;
  Image12.top := 234;

  runter := True;
  rechts := True;

  check:=1;

  if punkte=0 then
  begin
    level:=1;
  end;
end;

procedure TForm1.timerspeed;
begin
  case level of
    1: speed:=1;
    2: speed:=2;
    3: speed:=4;
    4: speed:=6;
    5: speed:=8;
    6: speed:=10;
    7: speed:=12;
    8: speed:=14;
    9: speed:=16;
    10: speed:=18;
    11: speed:=20;
    12: speed:=22;
    13: speed:=24;
    14: speed:=26;
    15: speed:=28;
    16: speed:=30;
    17: speed:=32;
    18: speed:=34;
  end;

end;

procedure TForm1.schusszurueck;
begin
  Image14.Visible := False;
  Image14.Top := Image13.top + 5;
  Image14.Left := Image13.left + 5;
  schuss := False;
end;

procedure TForm1.sichtbar;
begin
  Image1.Visible := True;
  Image2.Visible := True;
  Image3.Visible := True;
  Image4.Visible := True;
  Image5.Visible := True;
  Image6.Visible := True;
  Image7.Visible := True;
  Image8.Visible := True;
  Image9.Visible := True;
  Image10.Visible := True;
  Image11.Visible := True;
  Image12.Visible := True;
  Image13.Visible := True;
  Label2.Visible := True;
  Label3.Visible := True;
  Label4.Visible := True;
  Label4.Visible := True;
  Label5.Visible := True;
end;

procedure TForm1.neueslevelladen;
begin
  level := level + 1;
  aliensladen;
  neuesspiel;
  sichtbar;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  if (schuss = True) then
  begin
    image14.top := image14.top - 5;
    Image14.Visible := True;
  end;

  if (Image14.top < 150) then
  begin
    Image14.Visible := False;
  end;

  if (image1.Visible = True) and (image14.Top < (Image1.top + Image1.Height)) and
    (image14.Top > (Image1.top)) and (image14.left < (image1.left + image1.Width)) and
    (image14.left > (image1.left)) then
  begin
    punkte := punkte + 100;
    image1.Visible := False;
    schusszurueck;
  end;

  if (image2.Visible = True) and (image14.Top < (Image2.top + Image2.Height)) and
    (image14.Top > (Image2.top)) and (image14.left < (image2.left + image2.Width)) and
    (image14.left > (image2.left)) then
  begin
    punkte := punkte + 100;
    image2.Visible := False;
    schusszurueck;
  end;

  if (image3.Visible = True) and (image14.Top < (Image3.top + Image3.Height)) and
    (image14.Top > (Image3.top)) and (image14.left < (image3.left + image3.Width)) and
    (image14.left > (image3.left)) then
  begin
    punkte := punkte + 100;
    image3.Visible := False;
    schusszurueck;
  end;

  if (image4.Visible = True) and (image14.Top < (Image4.top + Image4.Height)) and
    (image14.Top > (Image4.top)) and (image14.left < (image4.left + image4.Width)) and
    (image14.left > (image4.left)) then
  begin
    punkte := punkte + 100;
    image4.Visible := False;
    schusszurueck;
  end;

  if (schuss = True) then
  begin
    image14.top := image14.top - 5;
  end;

  if (image5.Visible = True) and (image14.Top < (Image5.top + Image5.Height)) and
    (image14.Top > (Image5.top)) and (image14.left < (image5.left + image5.Width)) and
    (image14.left > (image5.left)) then
  begin
    punkte := punkte + 100;
    image5.Visible := False;
    schusszurueck;
  end;

  if (image6.Visible = True) and (image14.Top < (Image6.top + Image6.Height)) and
    (image14.Top > (Image6.top)) and (image14.left < (image6.left + image6.Width)) and
    (image14.left > (image6.left)) then
  begin
    punkte := punkte + 100;
    image6.Visible := False;
    schusszurueck;
  end;

  if (image7.Visible = True) and (image14.Top < (Image7.top + Image7.Height)) and
    (image14.Top > (Image7.top)) and (image14.left < (image7.left + image7.Width)) and
    (image14.left > (image7.left)) then
  begin
    punkte := punkte + 100;
    image7.Visible := False;
    schusszurueck;
  end;

  if (schuss = True) then
  begin
    image14.top := image14.top - 5;
  end;
  if (image8.Visible = True) and (image14.Top < (Image8.top + Image8.Height)) and
    (image14.Top > (Image8.top)) and (image14.left < (image8.left + image8.Width)) and
    (image14.left > (image8.left)) then
  begin
    punkte := punkte + 100;
    image8.Visible := False;
    schusszurueck;
  end;

  if (image9.Visible = True) and (image14.Top < (Image9.top + Image9.Height)) and
    (image14.Top > (Image9.top)) and (image14.left < (image9.left + image9.Width)) and
    (image14.left > (image9.left)) then
  begin
    punkte := punkte + 100;
    image9.Visible := False;
    schusszurueck;
  end;

  if (image10.Visible = True) and (image14.Top < (Image10.top + Image10.Height)) and
    (image14.Top > (Image10.top)) and (image14.left <
    (image10.left + image10.Width)) and (image14.left > (image10.left)) then
  begin
    punkte := punkte + 100;
    image10.Visible := False;
    schusszurueck;
  end;

  if (image11.Visible = True) and (image14.Top < (Image11.top + Image11.Height)) and
    (image14.Top > (Image11.top)) and (image14.left <
    (image11.left + image11.Width)) and (image14.left > (image11.left)) then
  begin
    punkte := punkte + 100;
    image11.Visible := False;
    schusszurueck;
  end;

  if (image12.Visible = True) and (image14.Top < (Image12.top + Image12.Height)) and
    (image14.Top > (Image12.top)) and (image14.left <
    (image12.left + image12.Width)) and (image14.left > (image12.left)) then
  begin
    punkte := punkte + 100;
    image12.Visible := False;
    schusszurueck;
  end;

  if (punkte / 1200 = 1) and (punkte<>0)  and (level = 1) and (check = 1)then
  begin
    neueslevelladen;
  end
  else if (punkte / 1200 = 2) and (punkte<>0)  and (level = 2) and (check = 1)then
  begin
    neueslevelladen;
  end
  else if (punkte / 1200 = 3) and (punkte<>0)  and (level = 3) and (check = 1)then
  begin
    neueslevelladen;
  end
  else if (punkte / 1200 = 4) and (punkte<>0)  and (level = 4) and (check = 1)then
  begin
    neueslevelladen;
  end
  else if (punkte / 1200 = 5) and (punkte<>0)  and (level = 5) and (check = 1)then
  begin
    neueslevelladen;
  end
  else if (punkte / 1200 = 6) and (punkte<>0)  and (level = 6) and (check = 1)then
  begin
    neueslevelladen;
  end
  else if (punkte / 1200 = 7) and (punkte<>0)  and (level = 7) and (check = 1)then
  begin
    neueslevelladen;
  end
  else if (punkte / 1200 = 8) and (punkte<>0)  and (level = 8) and (check = 1)then
  begin
    neueslevelladen;
  end
  else if (punkte / 1200 = 9) and (punkte<>0)  and (level = 9) and (check = 1)then
  begin
    neueslevelladen;
  end
  else if (punkte / 1200 = 10) and (punkte<>0)  and (level = 10) and (check = 1)then
  begin
    neueslevelladen;
  end
  else if (punkte / 1200 = 11) and (punkte<>0)  and (level = 11) and (check = 1)then
  begin
    neueslevelladen;
  end
  else if (punkte / 1200 = 12) and (punkte<>0)  and (level = 12) and (check = 1)then
  begin
    neueslevelladen;
  end
  else if (punkte / 1200 = 13) and (punkte<>0)  and (level = 13) and (check = 1)then
  begin
    neueslevelladen;
  end
  else if (punkte / 1200 = 14) and (punkte<>0)  and (level = 14) and (check = 1)then
  begin
    neueslevelladen;
  end
  else if (punkte / 1200 = 15) and (punkte<>0)  and (level = 15) and (check = 1)then
  begin
    neueslevelladen;
  end
  else if (punkte / 1200 = 16) and (punkte<>0)  and (level = 16) and (check = 1)then
  begin
    neueslevelladen;
  end
  else if (punkte / 1200 = 17) and (punkte<>0)  and (level = 17) and (check = 1)then
  begin
    neueslevelladen;
  end
  else if (punkte / 1200 = 18) and (punkte<>0)  and (level = 18) and (check = 1)then
  begin
    neueslevelladen;
  end;

  if level > 18 then
  begin
    Level:=1;
    punkte := 0;
    Timer1.Enabled := False;
    button3.Enabled := True;
    ShowMessage('Vac banned from secure Servers');
  end;


end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Timer1.Enabled := True;
  button1.Enabled := False;
  button3.Enabled := False;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if Timer1.Enabled = True then
  begin
    Timer1.Enabled := False;
    button1.Enabled := True;
    button3.Enabled := True;
  end
  else
  begin
    Timer1.Enabled := True;
    button3.Enabled := False;
  end;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  punkte := 0;
  neuesspiel;
  form1.Height := 850;
  button3.top := 800;
  button3.Left := 16;
  go := True;
  aliensladen;
  button1.Enabled := True;
  button3.Enabled := False;
  Label4.Width := Form1.Width;
  sichtbar;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  aliensladen;
  runter := False;
  rechts := True;
  schuss := False;
  go := False;
  Label4.Width := Form1.Width;
  Form1.color := clBlack;
  form1.Height := 130;
  level := 1;
end;

procedure TForm1.punkteplus;
begin
  punkte := punkte + 100;
end;

procedure TForm1.aliensladen;
begin
  case level of
    1:
    begin
      Image1.Picture.LoadFromFile('silver1.png');
      Image2.Picture.LoadFromFile('silver1.png');
      Image3.Picture.LoadFromFile('silver1.png');
      Image4.Picture.LoadFromFile('silver1.png');
      Image5.Picture.LoadFromFile('silver1.png');
      Image6.Picture.LoadFromFile('silver1.png');
      Image7.Picture.LoadFromFile('silver1.png');
      Image8.Picture.LoadFromFile('silver1.png');
      Image9.Picture.LoadFromFile('silver1.png');
      Image10.Picture.LoadFromFile('silver1.png');
      Image11.Picture.LoadFromFile('silver1.png');
      Image12.Picture.LoadFromFile('silver1.png');
      Image13.Picture.LoadFromFile('silver1.png');
    end;
    2:
    begin
      Image1.Picture.LoadFromFile('silver2.png');
      Image2.Picture.LoadFromFile('silver2.png');
      Image3.Picture.LoadFromFile('silver2.png');
      Image4.Picture.LoadFromFile('silver2.png');
      Image5.Picture.LoadFromFile('silver2.png');
      Image6.Picture.LoadFromFile('silver2.png');
      Image7.Picture.LoadFromFile('silver2.png');
      Image8.Picture.LoadFromFile('silver2.png');
      Image9.Picture.LoadFromFile('silver2.png');
      Image10.Picture.LoadFromFile('silver2.png');
      Image11.Picture.LoadFromFile('silver2.png');
      Image12.Picture.LoadFromFile('silver2.png');
      Image13.Picture.LoadFromFile('silver2.png');
    end;
    3:
    begin
      Image1.Picture.LoadFromFile('silver3.png');
      Image2.Picture.LoadFromFile('silver3.png');
      Image3.Picture.LoadFromFile('silver3.png');
      Image4.Picture.LoadFromFile('silver3.png');
      Image5.Picture.LoadFromFile('silver3.png');
      Image6.Picture.LoadFromFile('silver3.png');
      Image7.Picture.LoadFromFile('silver3.png');
      Image8.Picture.LoadFromFile('silver3.png');
      Image9.Picture.LoadFromFile('silver3.png');
      Image10.Picture.LoadFromFile('silver3.png');
      Image11.Picture.LoadFromFile('silver3.png');
      Image12.Picture.LoadFromFile('silver3.png');
      Image13.Picture.LoadFromFile('silver3.png');
    end;
    4:
    begin
      Image1.Picture.LoadFromFile('silver4.png');
      Image2.Picture.LoadFromFile('silver4.png');
      Image3.Picture.LoadFromFile('silver4.png');
      Image4.Picture.LoadFromFile('silver4.png');
      Image5.Picture.LoadFromFile('silver4.png');
      Image6.Picture.LoadFromFile('silver4.png');
      Image7.Picture.LoadFromFile('silver4.png');
      Image8.Picture.LoadFromFile('silver4.png');
      Image9.Picture.LoadFromFile('silver4.png');
      Image10.Picture.LoadFromFile('silver4.png');
      Image11.Picture.LoadFromFile('silver4.png');
      Image12.Picture.LoadFromFile('silver4.png');
      Image13.Picture.LoadFromFile('silver4.png');
    end;
    5:
    begin
      Image1.Picture.LoadFromFile('silver5.png');
      Image2.Picture.LoadFromFile('silver5.png');
      Image3.Picture.LoadFromFile('silver5.png');
      Image4.Picture.LoadFromFile('silver5.png');
      Image5.Picture.LoadFromFile('silver5.png');
      Image6.Picture.LoadFromFile('silver5.png');
      Image7.Picture.LoadFromFile('silver5.png');
      Image8.Picture.LoadFromFile('silver5.png');
      Image9.Picture.LoadFromFile('silver5.png');
      Image10.Picture.LoadFromFile('silver5.png');
      Image11.Picture.LoadFromFile('silver5.png');
      Image12.Picture.LoadFromFile('silver5.png');
      Image13.Picture.LoadFromFile('silver5.png');
    end;
    6:
    begin
      Image1.Picture.LoadFromFile('silver6.png');
      Image2.Picture.LoadFromFile('silver6.png');
      Image3.Picture.LoadFromFile('silver6.png');
      Image4.Picture.LoadFromFile('silver6.png');
      Image5.Picture.LoadFromFile('silver6.png');
      Image6.Picture.LoadFromFile('silver6.png');
      Image7.Picture.LoadFromFile('silver6.png');
      Image8.Picture.LoadFromFile('silver6.png');
      Image9.Picture.LoadFromFile('silver6.png');
      Image10.Picture.LoadFromFile('silver6.png');
      Image11.Picture.LoadFromFile('silver6.png');
      Image12.Picture.LoadFromFile('silver6.png');
      Image13.Picture.LoadFromFile('silver6.png');
    end;
    7:
    begin
      Image1.Picture.LoadFromFile('gn1.png');
      Image2.Picture.LoadFromFile('gn1.png');
      Image3.Picture.LoadFromFile('gn1.png');
      Image4.Picture.LoadFromFile('gn1.png');
      Image5.Picture.LoadFromFile('gn1.png');
      Image6.Picture.LoadFromFile('gn1.png');
      Image7.Picture.LoadFromFile('gn1.png');
      Image8.Picture.LoadFromFile('gn1.png');
      Image9.Picture.LoadFromFile('gn1.png');
      Image10.Picture.LoadFromFile('gn1.png');
      Image11.Picture.LoadFromFile('gn1.png');
      Image12.Picture.LoadFromFile('gn1.png');
      Image13.Picture.LoadFromFile('gn1.png');
    end;
    8:
    begin
      Image1.Picture.LoadFromFile('gn2.png');
      Image2.Picture.LoadFromFile('gn2.png');
      Image3.Picture.LoadFromFile('gn2.png');
      Image4.Picture.LoadFromFile('gn2.png');
      Image5.Picture.LoadFromFile('gn2.png');
      Image6.Picture.LoadFromFile('gn2.png');
      Image7.Picture.LoadFromFile('gn2.png');
      Image8.Picture.LoadFromFile('gn2.png');
      Image9.Picture.LoadFromFile('gn2.png');
      Image10.Picture.LoadFromFile('gn2.png');
      Image11.Picture.LoadFromFile('gn2.png');
      Image12.Picture.LoadFromFile('gn2.png');
      Image13.Picture.LoadFromFile('gn2.png');
    end;
    9:
    begin
      Image1.Picture.LoadFromFile('gn3.png');
      Image2.Picture.LoadFromFile('gn3.png');
      Image3.Picture.LoadFromFile('gn3.png');
      Image4.Picture.LoadFromFile('gn3.png');
      Image5.Picture.LoadFromFile('gn3.png');
      Image6.Picture.LoadFromFile('gn3.png');
      Image7.Picture.LoadFromFile('gn3.png');
      Image8.Picture.LoadFromFile('gn3.png');
      Image9.Picture.LoadFromFile('gn3.png');
      Image10.Picture.LoadFromFile('gn3.png');
      Image11.Picture.LoadFromFile('gn3.png');
      Image12.Picture.LoadFromFile('gn3.png');
      Image13.Picture.LoadFromFile('gn3.png');
    end;
    10:
    begin
      Image1.Picture.LoadFromFile('gn4.png');
      Image2.Picture.LoadFromFile('gn4.png');
      Image3.Picture.LoadFromFile('gn4.png');
      Image4.Picture.LoadFromFile('gn4.png');
      Image5.Picture.LoadFromFile('gn4.png');
      Image6.Picture.LoadFromFile('gn4.png');
      Image7.Picture.LoadFromFile('gn4.png');
      Image8.Picture.LoadFromFile('gn4.png');
      Image9.Picture.LoadFromFile('gn4.png');
      Image10.Picture.LoadFromFile('gn4.png');
      Image11.Picture.LoadFromFile('gn4.png');
      Image12.Picture.LoadFromFile('gn4.png');
      Image13.Picture.LoadFromFile('gn4.png');
    end;
    11:
    begin
      Image1.Picture.LoadFromFile('mg1.png');
      Image2.Picture.LoadFromFile('mg1.png');
      Image3.Picture.LoadFromFile('mg1.png');
      Image4.Picture.LoadFromFile('mg1.png');
      Image5.Picture.LoadFromFile('mg1.png');
      Image6.Picture.LoadFromFile('mg1.png');
      Image7.Picture.LoadFromFile('mg1.png');
      Image8.Picture.LoadFromFile('mg1.png');
      Image9.Picture.LoadFromFile('mg1.png');
      Image10.Picture.LoadFromFile('mg1.png');
      Image11.Picture.LoadFromFile('mg1.png');
      Image12.Picture.LoadFromFile('mg1.png');
      Image13.Picture.LoadFromFile('mg1.png');
    end;
    12:
    begin
      Image1.Picture.LoadFromFile('mg2.png');
      Image2.Picture.LoadFromFile('mg2.png');
      Image3.Picture.LoadFromFile('mg2.png');
      Image4.Picture.LoadFromFile('mg2.png');
      Image5.Picture.LoadFromFile('mg2.png');
      Image6.Picture.LoadFromFile('mg2.png');
      Image7.Picture.LoadFromFile('mg2.png');
      Image8.Picture.LoadFromFile('mg2.png');
      Image9.Picture.LoadFromFile('mg2.png');
      Image10.Picture.LoadFromFile('mg2.png');
      Image11.Picture.LoadFromFile('mg2.png');
      Image12.Picture.LoadFromFile('mg2.png');
      Image13.Picture.LoadFromFile('mg2.png');
    end;
    13:
    begin
      Image1.Picture.LoadFromFile('mge.png');
      Image2.Picture.LoadFromFile('mge.png');
      Image3.Picture.LoadFromFile('mge.png');
      Image4.Picture.LoadFromFile('mge.png');
      Image5.Picture.LoadFromFile('mge.png');
      Image6.Picture.LoadFromFile('mge.png');
      Image7.Picture.LoadFromFile('mge.png');
      Image8.Picture.LoadFromFile('mge.png');
      Image9.Picture.LoadFromFile('mge.png');
      Image10.Picture.LoadFromFile('mge.png');
      Image11.Picture.LoadFromFile('mge.png');
      Image12.Picture.LoadFromFile('mge.png');
      Image13.Picture.LoadFromFile('mge.png');
    end;
    14:
    begin
      Image1.Picture.LoadFromFile('dmg.png');
      Image2.Picture.LoadFromFile('dmg.png');
      Image3.Picture.LoadFromFile('dmg.png');
      Image4.Picture.LoadFromFile('dmg.png');
      Image5.Picture.LoadFromFile('dmg.png');
      Image6.Picture.LoadFromFile('dmg.png');
      Image7.Picture.LoadFromFile('dmg.png');
      Image8.Picture.LoadFromFile('dmg.png');
      Image9.Picture.LoadFromFile('dmg.png');
      Image10.Picture.LoadFromFile('dmg.png');
      Image11.Picture.LoadFromFile('dmg.png');
      Image12.Picture.LoadFromFile('dmg.png');
      Image13.Picture.LoadFromFile('dmg.png');
    end;
    15:
    begin
      Image1.Picture.LoadFromFile('le.png');
      Image2.Picture.LoadFromFile('le.png');
      Image3.Picture.LoadFromFile('le.png');
      Image4.Picture.LoadFromFile('le.png');
      Image5.Picture.LoadFromFile('le.png');
      Image6.Picture.LoadFromFile('le.png');
      Image7.Picture.LoadFromFile('le.png');
      Image8.Picture.LoadFromFile('le.png');
      Image9.Picture.LoadFromFile('le.png');
      Image10.Picture.LoadFromFile('le.png');
      Image11.Picture.LoadFromFile('le.png');
      Image12.Picture.LoadFromFile('le.png');
      Image13.Picture.LoadFromFile('le.png');
    end;
    16:
    begin
      Image1.Picture.LoadFromFile('lem.png');
      Image2.Picture.LoadFromFile('lem.png');
      Image3.Picture.LoadFromFile('lem.png');
      Image4.Picture.LoadFromFile('lem.png');
      Image5.Picture.LoadFromFile('lem.png');
      Image6.Picture.LoadFromFile('lem.png');
      Image7.Picture.LoadFromFile('lem.png');
      Image8.Picture.LoadFromFile('lem.png');
      Image9.Picture.LoadFromFile('lem.png');
      Image10.Picture.LoadFromFile('lem.png');
      Image11.Picture.LoadFromFile('lem.png');
      Image12.Picture.LoadFromFile('lem.png');
      Image13.Picture.LoadFromFile('lem.png');
    end;
    17:
    begin
      Image1.Picture.LoadFromFile('supreme.png');
      Image2.Picture.LoadFromFile('supreme.png');
      Image3.Picture.LoadFromFile('supreme.png');
      Image4.Picture.LoadFromFile('supreme.png');
      Image5.Picture.LoadFromFile('supreme.png');
      Image6.Picture.LoadFromFile('supreme.png');
      Image7.Picture.LoadFromFile('supreme.png');
      Image8.Picture.LoadFromFile('supreme.png');
      Image9.Picture.LoadFromFile('supreme.png');
      Image10.Picture.LoadFromFile('supreme.png');
      Image11.Picture.LoadFromFile('supreme.png');
      Image12.Picture.LoadFromFile('supreme.png');
      Image13.Picture.LoadFromFile('supreme.png');
    end;
    18:
    begin
      Image1.Picture.LoadFromFile('ge.png');
      Image2.Picture.LoadFromFile('ge.png');
      Image3.Picture.LoadFromFile('ge.png');
      Image4.Picture.LoadFromFile('ge.png');
      Image5.Picture.LoadFromFile('ge.png');
      Image6.Picture.LoadFromFile('ge.png');
      Image7.Picture.LoadFromFile('ge.png');
      Image8.Picture.LoadFromFile('ge.png');
      Image9.Picture.LoadFromFile('ge.png');
      Image10.Picture.LoadFromFile('ge.png');
      Image11.Picture.LoadFromFile('ge.png');
      Image12.Picture.LoadFromFile('ge.png');
      Image13.Picture.LoadFromFile('ge.png');
    end;
  end;
  Image14.Picture.LoadFromFile('bullet.png');
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  i: integer;
begin
  timerspeed;
  if (((Image1.left + Image1.Width) < (Form1.Width - 16)) and
    (rechts = True) and (Image1.Visible = True)) or
    (((Image2.left + Image2.Width) < (Form1.Width - 16)) and
    (rechts = True) and (Image2.Visible = True)) or
    (((Image3.left + Image3.Width) < (Form1.Width - 16)) and
    (rechts = True) and (Image3.Visible = True)) or
    (((Image4.left + Image4.Width) < (Form1.Width - 16)) and
    (rechts = True) and (Image4.Visible = True)) or
    (((Image5.left + Image5.Width) < (Form1.Width - 16)) and
    (rechts = True) and (Image5.Visible = True)) or
    (((Image6.left + Image6.Width) < (Form1.Width - 16)) and
    (rechts = True) and (Image6.Visible = True)) or
    (((Image7.left + Image7.Width) < (Form1.Width - 16)) and
    (rechts = True) and (Image7.Visible = True)) or
    (((Image8.left + Image8.Width) < (Form1.Width - 16)) and
    (rechts = True) and (Image8.Visible = True)) or
    (((Image9.left + Image9.Width) < (Form1.Width - 16)) and
    (rechts = True) and (Image9.Visible = True)) or
    (((Image10.left + Image10.Width) < (Form1.Width - 16)) and
    (rechts = True) and (Image10.Visible = True)) or
    (((Image11.left + Image11.Width) < (Form1.Width - 16)) and
    (rechts = True) and (Image11.Visible = True)) or
    (((Image12.left + Image12.Width) < (Form1.Width - 16)) and
    (rechts = True) and (Image12.Visible = True)) then
  begin
    Image1.left := Image1.left + speed;
    Image2.left := Image2.left + speed;
    Image3.left := Image3.left + speed;
    Image4.left := Image4.left + speed;
    Image5.left := Image5.left + speed;
    Image6.left := Image6.left + speed;
    Image7.left := Image7.left + speed;
    Image8.left := Image8.left + speed;
    Image9.left := Image9.left + speed;
    Image10.left := Image10.left + speed;
    Image11.left := Image11.left + speed;
    Image12.left := Image12.left + speed;
    runter := True;
  end
  else if ((Image1.left > 16) and (rechts = False) and (Image1.Visible = True)) or
    ((Image2.left > 16) and (rechts = False) and (Image2.Visible = True)) or
    ((Image3.left > 16) and (rechts = False) and (Image3.Visible = True)) or
    ((Image4.left > 16) and (rechts = False) and (Image4.Visible = True)) or
    ((Image5.left > 16) and (rechts = False) and (Image5.Visible = True)) or
    ((Image6.left > 16) and (rechts = False) and (Image6.Visible = True)) or
    ((Image7.left > 16) and (rechts = False) and (Image7.Visible = True)) or
    ((Image8.left > 16) and (rechts = False) and (Image8.Visible = True)) or
    ((Image9.left > 16) and (rechts = False) and (Image9.Visible = True)) or
    ((Image10.left > 16) and (rechts = False) and (Image10.Visible = True)) or
    ((Image11.left > 16) and (rechts = False) and (Image11.Visible = True)) or
    ((Image12.left > 16) and (rechts = False) and (Image12.Visible = True)) then
  begin
    Image1.left := Image1.left - speed;
    Image2.left := Image2.left - speed;
    Image3.left := Image3.left - speed;
    Image4.left := Image4.left - speed;
    Image5.left := Image5.left - speed;
    Image6.left := Image6.left - speed;
    Image7.left := Image7.left - speed;
    Image8.left := Image8.left - speed;
    Image9.left := Image9.left - speed;
    Image10.left := Image10.left - speed;
    Image11.left := Image11.left - speed;
    Image12.left := Image12.left - speed;
    runter := True;
  end;

  if (((Image1.left + Image1.Width) = (Form1.Width - 16)) and
    (runter = True) and (Image1.Visible = True)) or
    (((Image2.left + Image2.Width) = (Form1.Width - 16)) and
    (runter = True) and (Image2.Visible = True)) or
    (((Image3.left + Image3.Width) = (Form1.Width - 16)) and
    (runter = True) and (Image3.Visible = True)) or
    (((Image4.left + Image4.Width) = (Form1.Width - 16)) and
    (runter = True) and (Image4.Visible = True)) or
    (((Image5.left + Image5.Width) = (Form1.Width - 16)) and
    (runter = True) and (Image5.Visible = True)) or
    (((Image6.left + Image6.Width) = (Form1.Width - 16)) and
    (runter = True) and (Image6.Visible = True)) or
    (((Image7.left + Image7.Width) = (Form1.Width - 16)) and
    (runter = True) and (Image7.Visible = True)) or
    (((Image8.left + Image8.Width) = (Form1.Width - 16)) and
    (runter = True) and (Image8.Visible = True)) or
    (((Image9.left + Image9.Width) = (Form1.Width - 16)) and
    (runter = True) and (Image9.Visible = True)) or
    (((Image10.left + Image10.Width) = (Form1.Width - 16)) and
    (runter = True) and (Image10.Visible = True)) or
    (((Image11.left + Image11.Width) = (Form1.Width - 16)) and
    (runter = True) and (Image11.Visible = True)) or
    (((Image12.left + Image12.Width) = (Form1.Width - 16)) and
    (runter = True) and (Image12.Visible = True)) or
    (((Image1.left = 16) and (runter = True)) and (Image1.Visible = True)) or
    (((Image2.left = 16) and (runter = True)) and (Image2.Visible = True)) or
    (((Image3.left = 16) and (runter = True)) and (Image3.Visible = True)) or
    (((Image4.left = 16) and (runter = True)) and (Image4.Visible = True)) or
    (((Image5.left = 16) and (runter = True)) and (Image5.Visible = True)) or
    (((Image6.left = 16) and (runter = True)) and (Image6.Visible = True)) or
    (((Image7.left = 16) and (runter = True)) and (Image7.Visible = True)) or
    (((Image8.left = 16) and (runter = True)) and (Image8.Visible = True)) or
    (((Image9.left = 16) and (runter = True)) and (Image9.Visible = True)) or
    (((Image10.left = 16) and (runter = True)) and (Image10.Visible = True)) or
    (((Image11.left = 16) and (runter = True)) and (Image11.Visible = True)) or
    (((Image12.left = 16) and (runter = True)) and (Image12.Visible = True)) then
  begin
    Image1.top := Image1.top + 5;
    Image2.top := Image2.top + 5;
    Image3.top := Image3.top + 5;
    Image4.top := Image4.top + 5;
    Image5.top := Image5.top + 5;
    Image6.top := Image6.top + 5;
    Image7.top := Image7.top + 5;
    Image8.top := Image8.top + 5;
    Image9.top := Image9.top + 5;
    Image10.top := Image10.top + 5;
    Image11.top := Image11.top + 5;
    Image12.top := Image12.top + 5;
    runter := False;

    if rechts = True then
    begin
      rechts := False;
    end
    else
    begin
      rechts := True;
    end;
  end;

  if ((image1.Top + image1.Height) > label4.top) or
    ((image2.Top + image2.Height) > label4.top) or
    ((image3.Top + image3.Height) > label4.top) or
    ((image4.Top + image4.Height) > label4.top) or
    ((image5.Top + image5.Height) > label4.top) or
    ((image6.Top + image6.Height) > label4.top) or
    ((image7.Top + image7.Height) > label4.top) or
    ((image8.Top + image8.Height) > label4.top) or
    ((image9.Top + image9.Height) > label4.top) or
    ((image10.Top + image10.Height) > label4.top) or
    ((image11.Top + image11.Height) > label4.top) or
    ((image12.Top + image12.Height) > label4.top) then
  begin
    Timer1.Enabled := False;
    button3.Enabled := True;

    ShowMessage('Du hast verloren');
    neuesspiel;
  end;
  Label3.Caption := IntToStr(punkte);
  if Label4.Width < Form1.Width then
  begin
    Label4.Width := Form1.Width;
  end;
end;

end.
