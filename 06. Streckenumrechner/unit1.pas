unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
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
  zahl1, zahl2: double;
begin
  zahl1:=StrtoFloat(edit1.Text);

  case ComboBox1.itemindex of
    0:
      begin
          case ComboBox2.itemindex of
            0:
              begin
                  zahl2:=zahl1;
              end;//ende case 0
            1:
              begin
                  zahl2:=zahl1/10;
              end;//ende case 1
            2:
              begin
                  zahl2:=zahl1/100;
              end;//ende case 2
            3:
              begin
                  zahl2:=zahl1/1000;
              end;//ende case 3
            4:
              begin
                  zahl2:=zahl1/1000000;
              end;//ende case 4
          end; //ende case combobox2
      end;//ende case 0
    1:
      begin
          case ComboBox2.itemindex of
            0:
              begin
                  zahl2:=zahl1*10;
              end;//ende case 0
            1:
              begin
                  zahl2:=zahl1;
              end;//ende case 1
            2:
              begin
                  zahl2:=zahl1/10;
              end;//ende case 2
            3:
              begin
                  zahl2:=zahl1/100;
              end;//ende case 3
            4:
              begin
                  zahl2:=zahl1/10000;
              end;//ende case 4
          end; //ende case combobox2
      end; //ende case1
    2:
      begin
          case ComboBox2.itemindex of
            0:
              begin
                  zahl2:=zahl1*100;
              end;//ende case 0
            1:
              begin
                  zahl2:=zahl1*10;
              end;//ende case 1
            2:
              begin
                  zahl2:=zahl1;
              end;//ende case 2
            3:
              begin
                  zahl2:=zahl1/10;
              end;//ende case 3
            4:
              begin
                  zahl2:=zahl1/1000;
              end;//ende case 4
          end; //ende case combobox2
      end; //ende case 2
    3:
      begin
          case ComboBox2.itemindex of
            0:
              begin
                  zahl2:=zahl1*1000;
              end;//ende case 0
            1:
              begin
                  zahl2:=zahl1*100;
              end;//ende case 1
            2:
              begin
                  zahl2:=zahl1*10;
              end;//ende case 2
            3:
              begin
                  zahl2:=zahl1;
              end;//ende case 3
            4:
              begin
                  zahl2:=zahl1/1000;
              end;//ende case 4
          end; //ende case combobox2
      end; //ende case 3
    4:
      begin
          case ComboBox2.itemindex of
            0:
              begin
                  zahl2:=zahl1*1000000;
              end;//ende case 0
            1:
              begin
                  zahl2:=zahl1*100000;
              end;//ende case 1
            2:
              begin
                  zahl2:=zahl1*10000;
              end;//ende case 2
            3:
              begin
                  zahl2:=zahl1*1000;
              end;//ende case 3
            4:
              begin
                  zahl2:=zahl1;
              end;//ende case 4
          end; //ende case combobox2
      end; //ende case4
  end;  //ende case combobox1
  Label4.caption:=FloattoStr(zahl1)+' sind '+FloattoStr(zahl2);
end;

end.

