unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
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
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public
    r1,r2,r3,r4,r5,g1,g2,g3,g4,g5,b1,b2,b3,b4,b5:integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button2Click(Sender: TObject);
var r,g,b:integer; check:byte;
begin
  if RadioButton1.Checked=true then check:=1
  else if RadioButton2.Checked=true then check:=2
  else if RadioButton3.Checked=true then check:=3
  else if RadioButton4.Checked=true then check:=4
  else if RadioButton5.Checked=true then check:=5;
  case check of
   1: begin
     r:=208-r1;
     g:=244-g1;
     b:=237-b1;
   end;
   2: begin
     r:=208-r2;
     g:=244-g2;
     b:=237-b2;
   end;
   3: begin
     r:=208-r3;
     g:=244-g3;
     b:=237-b3;
   end;
   4: begin
     r:=208-r4;
     g:=244-g4;
     b:=237-b4;
   end;
   5: begin
     r:=208-r5;
     g:=244-g5;
     b:=237-b5;
   end;
  end;
  if r1+r<=255 then Edit1.Text:=InttoStr(abs(r+r1))
  else Edit1.Text:=InttoStr(abs(255-(r+r1-255)));
  if r2+r<=255 then Edit4.Text:=InttoStr(abs(r+r2))
  else Edit4.Text:=InttoStr(abs(255-(r+r2-255)));
  if r3+r<=255 then Edit7.Text:=InttoStr(abs(r+r3))
  else Edit7.Text:=InttoStr(abs(255-(r+r3-255)));
  if r4+r<=255 then Edit10.Text:=InttoStr(abs(r+r4))
  else Edit10.Text:=InttoStr(abs(255-(r+r4-255)));
  if r5+r<=255 then Edit13.Text:=InttoStr(abs(r+r5))
  else Edit13.Text:=InttoStr(abs(255-(r+r5-255)));
  if g1+g<=255 then Edit2.Text:=InttoStr(abs(g+g1))
  else Edit2.Text:=InttoStr(abs(255-(g+g1-255)));
  if g2+g<=255 then Edit5.Text:=InttoStr(abs(g+g2))
  else Edit5.Text:=InttoStr(abs(255-(g+g2-255)));
  if g3+g<=255 then Edit8.Text:=InttoStr(abs(g+g3))
  else Edit8.Text:=InttoStr(abs(255-(g+g3-255)));
  if g4+g<=255 then Edit11.Text:=InttoStr(abs(g+g4))
  else Edit11.Text:=InttoStr(abs(255-(g+g4-255)));
  if g5+g<=255 then Edit14.Text:=InttoStr(abs(g+g5))
  else Edit14.Text:=InttoStr(abs(255-(g+g5-255)));
  if b1+b<=255 then Edit3.Text:=InttoStr(abs(b+b1))
  else Edit3.Text:=InttoStr(abs(255-(b+b1-255)));
  if b2+b<=255 then Edit6.Text:=InttoStr(abs(b+b2))
  else Edit6.Text:=InttoStr(abs(255-(b+b2-255)));
  if b3+b<=255 then Edit9.Text:=InttoStr(abs(b+b3))
  else Edit9.Text:=InttoStr(abs(255-(b+b3-255)));
  if b4+b<=255 then Edit12.Text:=InttoStr(abs(b+b4))
  else Edit12.Text:=InttoStr(abs(255-(b+b4-255)));
  if b5+b<=255 then Edit15.Text:=InttoStr(abs(b+b5))
  else Edit15.Text:=InttoStr(abs(255-(b+b5-255)));
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   r1:=StrToInt(Edit1.Text);
   r2:=StrToInt(Edit4.Text);
   r3:=StrToInt(Edit7.Text);
   r4:=StrToInt(Edit10.Text);
   r5:=StrToInt(Edit13.Text);
   g1:=StrToInt(Edit2.Text);
   g2:=StrToInt(Edit5.Text);
   g3:=StrToInt(Edit8.Text);
   g4:=StrToInt(Edit11.Text);
   g5:=StrToInt(Edit14.Text);
   b1:=StrToInt(Edit3.Text);
   b2:=StrToInt(Edit6.Text);
   b3:=StrToInt(Edit9.Text);
   b4:=StrToInt(Edit12.Text);
   b5:=StrToInt(Edit15.Text);
end;

end.

