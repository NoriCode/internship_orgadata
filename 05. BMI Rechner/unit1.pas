unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
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
  gewicht, groesse, bmi:double;
  bmi2, bmineu:integer;
begin
  gewicht:= StrtoFloat(edit1.text);
  groesse:= StrtoFloat(edit2.text);
  bmi:= gewicht/Power((groesse/100),2);
  bmi:= bmi*10;
  bmi2:= round(bmi);
  bmi:= bmi2/10;
  bmineu:=round(bmi);


  Label5.caption:='Ihr ermittelter BMI: ' +FloattoStr(bmi);

  if (RadioButton1.Checked = True)then
  begin

  end//Radio 1 check ende
  else
  case bmi2 of
    0..18:
      begin
          Label6.caption:='Sie haben Untergewicht';
      end;
    19..24:
      begin
          Label6.caption:='Sie haben Normalgewicht';
      end;
    25..30:
      begin
          Label6.caption:='Sie haben Übergewicht';
      end;
    31..40:
      begin
          Label6.caption:='Sie haben Adipositas';
      end;
    41..100:
      begin
          Label6.caption:='Sie haben starke Adipositas';
      end;
    end;
  begin
    case bmineu of
    0..19:
      begin
          Label6.caption:='Sie haben Untergewicht';
      end;
    20..25:
      begin
          Label6.caption:='Sie haben Normalgewicht';
      end;
    26..30:
      begin
          Label6.caption:='Sie haben Übergewicht';
      end;
    31..40:
      begin
          Label6.caption:='Sie haben Adipositas';
      end;
    41..100:
      begin
          Label6.caption:='Sie haben starke Adipositas';
      end;
    end;
  end;//else ende
end;

end.

