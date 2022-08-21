unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Menus,
  StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    door: TImage;
    Image2: TImage;
    Image3: TImage;
    pswLabel: TLabel;
    shs: TImage;
    pswEdit: TEdit;
    Image1: TImage;
    main: TImage;
    gg: TImage;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image2Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure pswEditChange(Sender: TObject);

    procedure Timer1StopTimer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
   procedure room_update;
  public

  const step: byte=0;
   var side,sw1: boolean;
     but: Word;
      coord,xl,xr:integer;
      room,rm5:byte;
      rm5an:array [1..7] of byte;
      pass5: array [1..9] of byte;
      rmp:array [1..7] of boolean;
      ll,swud:array[1..5] of boolean;
      path,pass2,newname:string;
      wind,switch1,psw,blf,matr,reb:TImage;
      lamp,swh:array [1..5] of TImage;
      lbl1,lbl2,lbl3:TLabel;
  end;

var
  Form1: TForm1;
  k:byte;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var i,j,zz:integer; zup:array [1..6] of integer; z0:array [1..6] of integer;
begin
  randomize;
  path:='C:/Users/Домашний ПК/Desktop/Лабораторная работа 10/';
  //pswLabel.Visible:=false;
  room:=1;
   gg.Picture.Loadfromfile(path+'Move/standrightcut.png');
   main.Picture.Loadfromfile(path+'Background/backtest.png');
  for i:=Low(rmp) to High(rmp) do
  rmp[i]:=false;
  xl:=990;
  xr:=110;
  room_update;
  sw1:=false;
  rm5:=random(3)+1;
  case rm5 of
    1: begin
      rm5an[1]:=8;
      rm5an[2]:=6;
      rm5an[3]:=1;
      rm5an[4]:=5;
      rm5an[5]:=3;
      rm5an[6]:=2;
      rm5an[7]:=6;
    end;

    2: begin
      rm5an[1]:=9;
      rm5an[2]:=4;
      rm5an[3]:=5;
      rm5an[4]:=6;
      rm5an[5]:=3;
      rm5an[6]:=9;
      rm5an[7]:=2;
    end;
    3: begin
      rm5an[1]:=1;
      rm5an[2]:=3;
      rm5an[3]:=2;
      rm5an[4]:=4;
      rm5an[5]:=5;
      rm5an[6]:=9;
      rm5an[7]:=8;
    end;
    end;
  for i:=1 to 9 do
  pass5[i]:=random(9)+1;
  pass2:='';
  newname:='';
  for i:=1 to 5 do
  begin
  ll[i]:=false;
  swud[i]:=false;
  end;
  for i:=1 to 6 do
   begin
    j:=random(10);
    pass2:=pass2+IntToStr(j);
    z0[i]:=-1;
   end;
   for i:=1 to 6 do
  begin
   zz:=random(6)+1;
   while z0[zz]<>-1 do
   zz:=random(6)+1;
   z0[zz]:=strtoint(pass2[i]);
   zup[zz]:=i-zz;
  end;
  for i:=1 to 6 do
  begin
   newname:=newname+inttostr(z0[i]);
    while zup[i]<>0 do
   begin
    if zup[i]>0 then
     begin
      newname:=newname+'->';
      dec(zup[i]);
     end
    else begin
      newname:=newname+'<-';
      inc(zup[i]);
    end;
   end;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
    case but of
   37: begin
    if gg.Left>xr then
    begin
      inc(step);
      if step=9 then step:=1;

     case step of
      1: begin
      gg.Picture.Loadfromfile(path+'Move/moveleft1.png');
      gg.Left:=gg.Left-40;
      end;
      2: begin
      gg.Picture.Loadfromfile(path+'Move/moveleft2.png');
        gg.Left:=gg.Left-35;
      end;
      3: begin
      gg.Picture.Loadfromfile(path+'Move/moveleft3.png');
          gg.Left:=gg.Left-25;
      end;
      4: begin
      gg.Picture.Loadfromfile(path+'Move/moveleft4.png');
         gg.Left:=gg.Left-35;
      end;
       5: begin
      gg.Picture.Loadfromfile(path+'Move/moveleft5.png');
         gg.Left:=gg.Left-35;
      end;
       6: begin
      gg.Picture.Loadfromfile(path+'Move/moveleft6.png');
         gg.Left:=gg.Left-35;
      end;
       7: begin
      gg.Picture.Loadfromfile(path+'Move/moveleft7.png');
         gg.Left:=gg.Left-35;
      end;
       8: begin
      gg.Picture.Loadfromfile(path+'Move/moveleft8.png');
         gg.Left:=gg.Left-35;
      end;
      end;
     end;
  end;

  39:    begin
  if gg.Left<xl then
   begin
      inc(step);
      if step=9 then step:=1;
        case step of
      1:  begin
        gg.Picture.Loadfromfile(path+'Move/moveright1cut.png');
        gg.Left:=gg.Left+40;
          end;
      2:  begin
        gg.Picture.Loadfromfile(path+'Move/moveright2cut.png');
          gg.Left:=gg.Left+35;
         end;
      3: begin
        gg.Picture.Loadfromfile(path+'Move/moveright3cut.png');
        gg.Left:=gg.Left+25;
          end;
      4: begin
      gg.Picture.Loadfromfile(path+'Move/moveright4cut.png');
      gg.Left:=gg.Left+35;
      end;
      5: begin
      gg.Picture.Loadfromfile(path+'Move/moveright5cut.png');
      gg.Left:=gg.Left+35;
      end;
      6: begin
      gg.Picture.Loadfromfile(path+'Move/moveright6cut.png');
      gg.Left:=gg.Left+35;
      end;
      7: begin
      gg.Picture.Loadfromfile(path+'Move/moveright7cut.png');
      gg.Left:=gg.Left+35;
      end;
      8: begin
      gg.Picture.Loadfromfile(path+'Move/moveright8cut.png');
      gg.Left:=gg.Left+35;
      end;
      end;
   end;
end;
end;
    if gg.Left>1050 then
     begin
      inc(room);
       room_update;
     end
    else if gg.Left<50 then
     begin
       dec(room);
       room_update;
     end;
    end;

procedure TForm1.room_update;
begin
//  pswLabel.Caption:=inttostr(room);
if side=false then gg.Left:=88 else gg.Left:=1048;
if room=7 then gg.Left:=550;
if rmp[room]=true then
begin
 door.Picture.Loadfromfile(path+'Background/dooropencut.png');
 xl:=1200;
end
else begin
door.Picture.Loadfromfile(path+'Background/doorclosecut.png');
xl:=990;
end;
if rmp[room-1]=true then
begin
 // image1.Picture.Loadfromfile(path+'Background/dooropenleftins.png');
 // xr:=0;
 end;
 //xr:=110;

  case room of
   1:
   begin
     if side=true then
     begin
       wind.Free;
       if rmp[room-1]=true then
       begin
   //      image2.Picture.LoadFromFile(path+'dooropenleftins.png');
     //     xr:=0;
         end;
   if rmp[2]=false then psw.free;
      end;
     if sw1=true then begin
      switch1:=TImage.Create(self);
     switch1.Parent:=form1;
     switch1.Left:=900;
     switch1.Top:=375;
    switch1.Picture.LoadFromFile(path+'Stuff/switch2.png');
     switch1.Autosize:=true;
     switch1.SendToBack;
     main.SendToBack;
     end
     else begin
      switch1:=TImage.Create(self);
     switch1.Parent:=form1;
     switch1.Left:=900;
     switch1.Top:=375;
    switch1.Picture.LoadFromFile(path+'Stuff/switch1.png');
     switch1.Autosize:=true;
     switch1.SendToBack;
     main.SendToBack;
     end;
     if rmp[High(rmp)]=false then xr:=100 else
       begin
      xr:=0;
      image1.Picture.Loadfromfile(path+'Background/dooropenleftcut.png');
     end;
   end;
   2: begin
  if side=false then switch1.free
  else begin
      for k:=1 to 5 do
      begin
        lamp[k].Free;
        swh[k].Free;
       end;
    end;
    pswEdit.Caption:='';
     wind:=TImage.Create(self);
     wind.Parent:=form1;
     wind.Left:=450;
     wind.Top:=150;
    wind.Picture.LoadFromFile(path+'Stuff/windcut.png');
     wind.Autosize:=true;
     wind.SendToBack;
     main.SendToBack;
   if rmp[room]=false then begin
    psw:=TImage.Create(self);
     psw.Parent:=form1;
     psw.Left:=1135;
     psw.Top:=410;
    psw.Picture.LoadFromFile(path+'Background/pswcut.png');
     psw.Autosize:=true;
     psw.SendToBack;
     end;


     door.SendToBack;
     main.SendToBack;
     end;
   3:begin
   if side=false then  wind.Free
   else begin
   end;
    for k:=1 to 5 do
    begin
       lamp[k]:=TImage.create(self);
       swh[k]:=TImage.create(self);
       lamp[k].Parent:=form1;
       swh[k].Parent:=form1;
       lamp[k].left:=120+170*k;
       swh[k].left:=165+150*k;
       lamp[k].Top:=250;
       swh[k].Top:=375;
     if ll[k]=false then lamp[k].Picture.Loadfromfile(path+'Stuff/lampbl.png')
     else lamp[k].Picture.Loadfromfile(path+'Stuff/lampy.png');
     if swud[k]=false then swh[k].Picture.Loadfromfile(path+'Stuff/switch1.png')
     else swh[k].Picture.Loadfromfile(path+'Stuff/switch2.png');
     lamp[k].Autosize:=true;
      swh[k].Autosize:=true;
    lamp[k].SendToBack;
        swh[k].SendToBack;
      end;
     main.SendToBack;

     //door.Picture.Loadfromfile(path+'Background/dooropencut.png');
     //  rmp[3]:=true;
     //  xl:=1200;
     end;

   4: begin
    if side=false then
    begin
      for k:=1 to 5 do
      begin
        lamp[k].Free;
        swh[k].Free;
       end;
      end
    else  begin
    main.Picture.Loadfromfile(path+'Background/backtest.png');
    wind.Free;
  // pswLabel.Free;
   lbl1.Free;
    lbl2.Free;
    lbl3.Free;
    matr.Free;
  if rmp[5]=false then  psw.Free;
    end;
    image3.Visible:=true;
    image3.Sendtoback;
    main.SendToBack;
    //pswLabel.Caption:='Расставьте арифметические знаки, чтобы уравнение стало верным';
   end;
    5:begin
     //pswLabel.Visible:=false;
     image3.Visible:=false;
        pswEdit.Caption:='';
     main.Picture.Loadfromfile(path+'Background/backsh'+inttostr(rm5)+'.png');
     wind:=TImage.Create(self);
     wind.Parent:=form1;
     wind.Left:=450;
     wind.Top:=150;
    wind.Picture.LoadFromFile(path+'Stuff/windcut.png');
     wind.Autosize:=true;
     wind.SendToBack;
     main.SendToBack;
   if rmp[room]=false then begin  psw:=TImage.Create(self);
     psw.Parent:=form1;
     psw.Left:=1135;
     psw.Top:=410;
    psw.Picture.LoadFromFile(path+'Background/pswcut.png');
     psw.Autosize:=true;
     psw.SendToBack;
     end;
         lbl1:=TLabel.Create(self);
     lbl1.Parent:=form1;
     lbl1.AutoSize:=false;
     lbl1.Left:=880;
     lbl1.Top:=275;
     lbl1.Height:=50;
    lbl1.Width:=150;
     lbl1.BringToFront;
     lbl1.Font.Size:=20;
     lbl1.Font.Name:='Comic Sans MS';
     lbl1.Caption:='  '+inttostr(pass5[1])+'    '+inttostr(pass5[2])+'    '
     +inttostr(pass5[3]);

     lbl2:=TLabel.Create(self);
     lbl2.Parent:=form1;
     lbl2.AutoSize:=false;
     lbl2.Left:=880;
     lbl2.Top:=325;
     lbl2.Height:=50;
    lbl2.Width:=150;
     lbl2.BringToFront;
     lbl2.Font.Size:=20;
     lbl2.Font.Name:='Comic Sans MS';
     lbl2.Caption:='  '+inttostr(pass5[4])+'    '+inttostr(pass5[5])+'    '
     +inttostr(pass5[6]);


    lbl3:=TLabel.Create(self);
     lbl3.Parent:=form1;
     lbl3.AutoSize:=false;
     lbl3.Left:=880;
     lbl3.Top:=375;
     lbl3.Height:=50;
    lbl3.Width:=150;
     lbl3.BringToFront;
     lbl3.Font.Size:=20;
     lbl3.Font.Name:='Comic Sans MS';
     lbl3.Caption:='  '+inttostr(pass5[7])+'    '+inttostr(pass5[8])+'    '
     +inttostr(pass5[9]);
     matr:=TImage.Create(self);
     matr.Parent:=form1;
     matr.Left:=880;
     matr.Top:=270;
    matr.Picture.LoadFromFile(path+'Stuff/matr.png');
    door.SendToBack;
     lbl1.SendToBack;
     lbl2.SendToBack;
     lbl3.SendToBack;
     matr.Autosize:=true;

     matr.SendToBack;

     main.SendToBack;
    end;

    6: begin
    if side=false then begin
        main.Picture.Loadfromfile(path+'Background/backtest.png');
    wind.Free;
  //  pswLabel.Free;
  lbl1.Free;
    lbl2.Free;
    lbl3.Free;
    matr.Free;

     end;
    image3.Visible:=true;
    reb:=TImage.Create(self);
    reb.Parent:=form1;
    reb.AutoSize:=true;
     reb.Left:=450;
     reb.Top:=170;
    reb.Picture.LoadFromFile(path+'Stuff/rb.png');
       pswEdit.Caption:='';
psw:=TImage.Create(self);
     psw.Parent:=form1;
     psw.Left:=1135;
     psw.Top:=410;
    psw.Picture.LoadFromFile(path+'Background/pswcut.png');
    reb.SendToBack;
    image3.SendToBack;
     psw.Autosize:=true;
     psw.SendToBack;
   door.SendToBack;
     main.SendToBack;
    end;
    7:begin
    Timer1.Enabled:=false;
    door.Picture.Clear;
  //  main.Picture.Clear;
    main.Picture.Loadfromfile(path+'Background/white.png');
    main.BringToFront;
    gg.BringToFront;
    shs.BringToFront;
  //  pswLabel.BringToFront;
         rmp[7]:=true;
         shs.Visible:=true;
       // xl:=1200;
    end;
  end;
   end;
procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
var k,center:integer;
begin
  but:=Key;
  if (room=7) and (but<>39) then close else   if room<>7 then
   case but of
  37: begin
    if (side=false) or (gg.Left<=xr) then
    begin
      gg.Picture.Loadfromfile(path+'Move/standleft.png');
     side:=true;
    end
  else if Timer1.Enabled=false then Timer1.Enabled:=True;
  end;
   39:    begin
    if   (side=true) or (gg.Left>=xl) then
    begin
       gg.Picture.Loadfromfile(path+'Move/standrightcut.png');
      side:=false;
    end
   else if Timer1.Enabled=false then Timer1.Enabled:=True;
   end;
   32: begin
   case room of
    1: if  (gg.Left+gg.Width>=switch1.Left+30) and (gg.Left<=switch1.Left+switch1.Width-30) and (sw1=false) then
     begin
       switch1.Picture.Loadfromfile(path+'Stuff/switch2.png');
       door.Picture.Loadfromfile(path+'Background/dooropencut.png');
       rmp[1]:=true;
       sw1:=True;
       xl:=1200;
     end;
    2,5,6: if (gg.Left>=950) and (rmp[room]=false) then
     begin
       main.BringToFront;
       gg.Enabled:=false;
       main.Enabled:=false;
       door.Enabled:=false;
       image1.Enabled:=false;
        image2.Visible:=true;
           image2.Enabled:=true;
           image2.BringToFront;
      main.Picture.LoadFromFile(path+'Background/pswbig.png');
        pswEdit.Visible:=true;
     pswEdit.Enabled:=true;
//       pswLabel:=TLabel.Create(self);
//     pswLabel.Parent:=form1;

     pswLabel.Left:=350;
     pswLabel.Top:=200;

     pswLabel.Visible:=true;
     pswLabel.BringToFront;

     pswLabel.Font.Size:=30;
     pswLabel.Font.Name:='Comic Sans MS';
     pswLabel.Caption:='Введите пароль';
   if room=2 then  Form1.Caption:=newname;
   end;
    3:if rmp[3]=false then begin
      center:=gg.Left+gg.Width div 2;
   //  pswLabel.Caption:=inttostr(center);
      case center of
        300..365:
        begin
         ll[1]:=not ll[1];
       if ll[4]=true then ll[4]:=false;
          swud[1]:=not swud[1];
     //   if ll[1]=true then swh[1].Picture.Loadfromfile(path+'Stuff/switch2.png')
      //   else swh[1].Picture.Loadfromfile(path+'Stuff/switch1.png');

    //     room_update;
        end;
        450..515:
        begin
         ll[2]:=not ll[2];
         ll[5]:=not ll[5];
    //      ll[3]:=not ll[3];
         swud[2]:= not swud[2];
  //       room_update;
        end;
       600..665:
       begin
         swud[3]:= not swud[3];
          ll[4]:=not ll[4];
          ll[1]:=not ll[1];
          ll[3]:=not ll[3];
       end;
        750..815:
       begin
         swud[4]:= not swud[4];
    //      ll[4]:=not ll[4];
          ll[2]:=not ll[2];
          ll[3]:=not ll[3];
       end;
        910..960:
       begin
         swud[5]:= not swud[5];
          if ll[3]=false then ll[3]:=true;
          ll[5]:=not ll[5];
       end;
      end;
      for k:=1 to 5 do begin
        if ll[k]=true then lamp[k].Picture.Loadfromfile(path+'Stuff/lampy.png')
        else lamp[k].Picture.Loadfromfile(path+'Stuff/lampbl.png');
        if swud[k]=true then swh[k].Picture.Loadfromfile(path+'Stuff/switch2.png')
        else swh[k].Picture.Loadfromfile(path+'Stuff/switch1.png');
        end;
        for k:=1 to 5 do
        if ll[k]=true then rmp[3]:=true
        else begin
          rmp[3]:=false;
          break;
        end;
        if rmp[3]=true then
         begin
           door.Picture.Loadfromfile(path+'Background/dooropencut.png');
           xl:=1200;
         end;
      end;
      4:if (gg.Left<=image3.Left+image3.width) and (gg.Left>=image3.Left) and (rmp[4]=false) then
       begin

           main.BringToFront;
           pswLabel.Visible:=true;
           //pswLabel.BringToFront;
        image2.Visible:=true;
        form1.Caption:='Расставьте арифметические знаки, чтобы получить верное равенство';
           image2.Enabled:=true;
           image2.BringToFront;
      main.Picture.LoadFromFile(path+'Background/dskb.png');
        pswEdit.Visible:=true;
     pswEdit.Enabled:=true;
    //   pswLabel:=TLabel.Create(self);
 //    pswLabel.Parent:=form1;

     pswLabel.Left:=700;
     pswLabel.Top:=200;
     pswEdit.left:=200;
     pswEdit.Top:=200;
     pswEdit.Text:='9999';
     pswLabel.BringToFront;

     pswLabel.Font.Size:=30;
     pswLabel.Font.Name:='Comic Sans MS';
     pswLabel.Caption:='=100';
   if room=2 then  Form1.Caption:=newname;
   end;
       end;
     end;
  27:begin if ( room=2) and (pswEdit.Visible=true) then
   begin
    pswLabel.Visible:=false;
    main.Picture.Loadfromfile(path+'Background/backtest.png');
    main.SendToBack;
    pswEdit.Visible:=false;
    pswEdit.Enabled:=false;
  //  pswLabel.Free;
    form1.Caption:='Escape from University';
//     Form1.Caption:='IHNG!!!!';
   end
  else if (room=5) and (pswEdit.Visible=true) then
   begin
     pswLabel.Visible:=false;
    main.Picture.Loadfromfile(path+'Background/backsh'+inttostr(rm5)+'.png');
    main.SendToBack;
    pswEdit.Visible:=false;
    pswEdit.Enabled:=false;
    pswLabel.Free;

   end
  else if (room=6) and (pswEdit.Visible=true)  then
   begin
          pswLabel.Visible:=false;
      main.Picture.Loadfromfile(path+'Background/backtest.png');
    main.SendToBack;
    pswEdit.Visible:=false;
    pswEdit.Enabled:=false;
 //   pswLabel.Free;
    end
   else if (room=4) and (pswEdit.Visible=true)  then
   begin
      pswLabel.Visible:=false;
      main.Picture.Loadfromfile(path+'Background/backtest.png');
    main.SendToBack;
    pswEdit.Visible:=false;
    pswEdit.Enabled:=false;
 //   pswLabel.Free;
    form1.Caption:='Escape from University';
    end;
    image2.Visible:=false;
     image2.Enabled:=false;
  end;
   end;
   end;
procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Timer1.Enabled:=False;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  begin if ( room=2) and (pswEdit.Visible=true) then
   begin
     pswLabel.Visible:=false;
    main.Picture.Loadfromfile(path+'Background/backtest.png');
    main.SendToBack;
    pswLabel.Visible:=false;
    pswEdit.Visible:=false;
    pswEdit.Enabled:=false;
  //  pswLabel.Free;
    form1.Caption:='Escape from University';
//     Form1.Caption:='IHNG!!!!';
   end
  else if (room=5) and (pswEdit.Visible=true) then
   begin
     pswLabel.Visible:=false;
    main.Picture.Loadfromfile(path+'Background/backsh'+inttostr(rm5)+'.png');
    main.SendToBack;
    pswEdit.Visible:=false;
    pswEdit.Enabled:=false;
  //  pswLabel.Free;

   end
  else if (room=6) and (pswEdit.Visible=true)  then
   begin
     pswLabel.Visible:=false;
      main.Picture.Loadfromfile(path+'Background/backtest.png');
    main.SendToBack;
    pswEdit.Visible:=false;
    pswEdit.Enabled:=false;
  //  pswLabel.Free;
    end
   else if (room=4) and (pswEdit.Visible=true)  then
   begin
     pswLabel.Visible:=false;
      main.Picture.Loadfromfile(path+'Background/backtest.png');
    main.SendToBack;
    pswEdit.Visible:=false;
    pswEdit.Enabled:=false;
 //   pswLabel.Free;
    form1.Caption:='Escape from University';
    end;
    image2.Visible:=false;
     image2.Enabled:=false;
  end;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.pswEditChange(Sender: TObject);
var s:string;i:byte;
begin
//  form1.Caption:=pswEdit.Text;
case room of
2: if  pswEdit.Text=pass2 then
 begin
 main.Picture.LoadfromFile(path+'Background/backtest.png');
 main.SendToBack;
 //pswLabel.free;
 psw.Free;
 pswEdit.Visible:=false;
 pswEdit.Enabled:=false;
  door.Picture.Loadfromfile(path+'Background/dooropencut.png');
       rmp[2]:=true;
       xl:=1200;
       form1.Caption:='IHTG!!!!';
       image2.Visible:=false;
image2.Enabled:=false;
pswLabel.Visible:=false;
form1.Caption:='Escape from University';
end;
5: begin
s:='';
  for i:=1 to 7 do
  s:=s+inttostr(pass5[rm5an[i]]);
    if  pswEdit.Text=s then
 begin
  main.Picture.Loadfromfile(path+'Background/backsh'+inttostr(rm5)+'.png');
 main.SendToBack;
// pswLabel.free;
 psw.Free;
 pswEdit.Visible:=false;
 pswEdit.Enabled:=false;
  door.Picture.Loadfromfile(path+'Background/dooropencut.png');
       rmp[5]:=true;
       xl:=1200;
     //  form1.Caption:='IHTG!!!!';
        pswLabel.Visible:=false;
       image2.Visible:=false;
image2.Enabled:=false;
  end;
end;
 6:
 begin
   if (pswEdit.Text='бакалавр') or (pswEdit.Text='Бакалавр')  then
    begin
       main.Picture.LoadfromFile(path+'Background/backtest.png');
 main.SendToBack;
// pswLabel.free;
 psw.Free;
 pswEdit.Visible:=false;
 pswEdit.Enabled:=false;
 door.Picture.Loadfromfile(path+'Background/dooropencut.png');
   rmp[6]:=true;
       xl:=1200;
        pswLabel.Visible:=false;
  image2.Visible:=false;
image2.Enabled:=false;
    end;
 end;
 4: if (pswEdit.Text='99+9/9') or (pswEdit.Text='9/9+99') then
 begin
 main.Picture.LoadfromFile(path+'Background/backtest.png');
 main.SendToBack;
 form1.Caption:='Escape from University';
 // pswLabel.free;
 //psw.Free;
 pswEdit.Visible:=false;
  pswLabel.Visible:=false;
 pswEdit.Enabled:=false;
 pswEdit.top:=350;
 pswEdit.left:=350;
  door.Picture.Loadfromfile(path+'Background/dooropencut.png');
       rmp[4]:=true;
       xl:=1200;
       image2.Visible:=false;
image2.Enabled:=false;
end;
end;
end;
procedure TForm1.Timer1StopTimer(Sender: TObject);
begin
   if  step>0 then
  begin
   if side=false then gg.Picture.Loadfromfile(path+'Move/standrightcut.png')
   else gg.Picture.Loadfromfile(path+'Move/standleft.png');
   step:=0;
  end;
end;

end.

