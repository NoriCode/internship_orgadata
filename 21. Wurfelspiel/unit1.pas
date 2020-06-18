unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Math, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { private declarations }
  var
    spieler1, spieler2, bis: integer;
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  bis := StrToInt(Edit1.Text);
  spieler1 := RandomRange(0, bis);
  Label4.Caption := IntToStr(spieler1);

  Button2.Visible := True;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  bis := StrToInt(Edit1.Text);
  spieler2 := RandomRange(0, bis+1);
  Label5.Caption := IntToStr(spieler2);



  if spieler1 < spieler2 then
  begin
    label3.Caption := 'Spieler 2';
  end
  else
  begin
    label3.Caption := 'Spieler 1';
  end;

  if spieler1 = spieler2 then
  begin
    Label3.Caption :='Keiner';
  end;
end;


end.
