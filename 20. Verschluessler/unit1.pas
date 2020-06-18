unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { private declarations }
    uverschluesselt:string;
    verschluesselt:String;
    schluesselgrad, lange :integer;
    code: array of integer;
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
  i:integer;
begin
  schluesselgrad:=StrtoInt(Edit4.text);
  uverschluesselt:=Edit1.text;

  lange:=length(uverschluesselt);

  setlength(code, lange);
  Edit1.text:='';

  for i:=0 to lange-1 do
  begin
    code[i]:=Ord(uverschluesselt[i+1]);
    code[i]:=code[i]+schluesselgrad;
    verschluesselt:= verschluesselt + Chr(code[i]);
  end;

  Edit2.text:=verschluesselt;
  Edit3.text:='';
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i:integer;
begin
  schluesselgrad:=StrtoInt(Edit4.text);
  verschluesselt:=Edit2.text;
  uverschluesselt := '';

  lange:=length(verschluesselt);

  setlength(code, lange);
  Edit2.text:='';

  for i:=0 to lange -1 do
  begin
    code[i]:=Ord(verschluesselt[i+1]);
    code[i]:=code[i]-schluesselgrad;
    uverschluesselt:= uverschluesselt + Chr(code[i]);
  end;
  Edit3.text:=uverschluesselt;

end;

end.

