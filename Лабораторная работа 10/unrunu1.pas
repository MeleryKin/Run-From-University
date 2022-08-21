unit UnRunU1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Menus,
  StdCtrls, Buttons;

type
   m3=record
    x:integer;
    y:integer;
    end;
  { TForm1 }

  TForm1 = class(TForm)
    door: TImage;
    m6: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    m1: TImage;
    m2: TImage;
    m3: TImage;
    m4: TImage;
    m5: TImage;
    Label1: TLabel;
    Label2: TLabel;
    BordBin: TLabel;
    pswLabel: TLabel;
    pswEdit: TEdit;
    Image1: TImage;
    main: TImage;
    gg: TImage;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    shs: TImage;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure doorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ggClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure m1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure m1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure m1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mainClick(Sender: TObject);
    procedure mainMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure MenuItem2Click(Sender: TObject);
    procedure pswEditChange(Sender: TObject);
    procedure pswEditEnter(Sender: TObject);

    procedure Timer1StopTimer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2StopTimer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure PassClick(Sender: Tobject);
    procedure PassMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
    procedure PassMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  private
   procedure room_update;
  public

  const step: byte=0;
  speak:byte=0;
   var side,sw1,r3,chk,Try8,GraphMode,graphchecked,graphon,haffcheck,anothercheck: boolean;
     but: Word;
      coord,xl,xr,readtext,HighBin,LowBin:integer;
      room,rm5,graphroom:byte;
      rm5an:array [1..7] of byte;
      pass5: array [1..9] of byte;
      rmp:array [1..10] of boolean;
      ll,swud:array[1..5] of boolean;
      path,pass2,newname,CurrentText,PassBin:string;
      wind,switch1,psw,blf,matr,reb,PassBtn:TImage;
      lamp,swh:array [1..5] of TImage;
      lbl1,lbl2,lbl3:TLabel;
      textf:text;
       mos,gr:m3;
       doorback,doornumb:array[1..3] of TImage;
       numbgraph:array[1..6] of integer;

  end;

var
  Form1: TForm1;
  k:byte;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var i,j,zz:integer; zup:array [1..6] of integer; z0:array [1..6] of integer;  gtmp:array[101..106] of boolean;
begin
  randomize;
  path:=ExtractFilePath(Application.ExeName);
  room:=8;
  speak:=0;
  gr.x:=0;
  gr.y:=0;
  GraphMode:=false;
  haffcheck:=false;
  anothercheck:=false;
  chk:=false;
  Try8:=false;
  graphon:=false;
   gg.Picture.Loadfromfile(path+'Move/standrightcut.png');
   main.Picture.Loadfromfile(path+'Background/backtest.png');
    Image1.Picture.Loadfromfile(path+'Background/doorcloseleftcut.png');
  for i:=Low(rmp) to High(rmp) do
  rmp[i]:=false;
  xl:=990;
  xr:=110;
  for i:=101 to 106 do
  gtmp[i]:=false;
  for i:=1 to 6 do
  begin
    numbgraph[i]:=random(6)+101;
    while  gtmp[numbgraph[i]]=true  do numbgraph[i]:=random(6)+101;
    gtmp[numbgraph[i]]:=true;
  end;
  graphchecked:=false;
  passbin:=passbin+inttostr(random(9)+1);
  for i:=2 to 4 do
  begin
   passbin:=passbin+inttostr(random(10));
  end;
  room_update;
  gg.Left:=550;
  sw1:=false;
  rm5:=random(3)+1;
  HighBin:=9999;
  LowBin:=0;
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
   gg.Picture.BitMap.TransparentColor := clWhite;
   AssignFile(textf,path+'Text/scene.txt');
   reset(textf);
   readln(textf,CurrentText);
   Label1.Caption:=CurrentText;
   readtext:=1;
   Timer2.Enabled:=true;
   r3:=false;
   m1.Picture.LoadFromFile(path+'Stuff/mag1.png');
             m2.Picture.LoadFromFile(path+'Stuff/mag2.png');
              m3.Picture.LoadFromFile(path+'Stuff/mag3.png');
               m4.Picture.LoadFromFile(path+'Stuff/mag4.png');
                m5.Picture.LoadFromFile(path+'Stuff/mag5.png');
                 m6.Picture.LoadFromFile(path+'Stuff/mag6.png');
                 m1.Top:=150;
                 m1.Left:=200;
                 m2.Top:=300;
                 m2.Left:=200;
                 m3.Top:=450;
                 m3.Left:=200;
                 m4.Top:=150;
                 m4.Left:=1000;
                 m5.Top:=300;
                 m5.Left:=1000;
                 m6.Top:=450;
                 m6.Left:=1000;
                 case numbgraph[1] of
                   101:  begin
                           m1.Top:=425;
                 m1.Left:=855;
                    end;
                    102: begin
                             m2.Top:=425;
                 m2.Left:=855;
                        end;
                    103:  begin
                       m3.Top:=425;
                 m3.Left:=855;
                          end;
                    104:  begin
                         m4.Top:=425;
                 m4.Left:=855;
                    end;

                    105:    begin
                          m5.Top:=425;
                 m5.Left:=855;
                    end;

                    106:begin
                           m6.Top:=425;
                 m6.Left:=855;
                    end;
                 end;
                 m1.Visible:=false;
                  m2.Visible:=false;
                   m3.Visible:=false;
                    m4.Visible:=false;
                     m5.Visible:=false;
                      m6.Visible:=false;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  closefile(textf);
end;

procedure TForm1.doorClick(Sender: TObject);
begin
    if (Timer2.Enabled=false) and ((readtext<>3) or (r3=true)) then begin

  end
  else
  begin
   if  Label1.Caption='Конечно же, заперто.' then    begin
          Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
        main.BringToFront;
                gg.Enabled:=false;
                main.Enabled:=false;
                door.Enabled:=false;
                image1.Enabled:=false;
        image2.Visible:=true;
           image2.Enabled:=true;
           PassBtn:=Timage.Create(Form1);
       PassBtn.Parent:=Form1;
       PassBtn.Top:=0;
       PassBtn.Left:=0;
       PassBtn.AutoSize:=true;
       PassBtn.OnClick:=@PassClick;
       PassBtn.OnDblClick:=@PassClick;
       PassBtn.OnMouseMove:=@PassMouseMove;
       PassBtn.OnMouseDown:=@PassMouseDown;
        PassBtn.Picture.LoadFromFile(path+'Background/pswbtn.png');
        PassBtn.BringToFront;
          image2.BringToFront;
        pswEdit.Visible:=true;
        pswEdit.Enabled:=true;
  pswEdit.SetFocus;
        pswEdit.SelStart := Length( pswEdit.Text );
  pswEdit.SelLength := 0;
        Image2.Top:=630;
        Image2.Left:=1150;
   end
   else
    case ReadText of
     1,4,6..13,17..20,22,24..29,31..34: begin
           readln(textf,CurrentText);
           Label1.Caption:=CurrentText;
           inc(readtext);
        end;
     2: begin
           readln(textf,CurrentText);
           Label1.Caption:=CurrentText;
           inc(readtext);
           Timer2.Enabled:=false;
           Label1.Font.Color:=13536044;
        end;
     35: begin
        close;
      end;
     3,5,14,16,21,23,30:begin
       Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
       if (readtext=14) and (room=8) then
       begin
        BordBin.Visible:=true;
        BordBin.Caption:=inttostr(LowBin)+' - '+inttostr(HighBin);
       end;
     Label1.Font.Color:=16777215;
       if ReadText=5 then
       begin
        main.BringToFront;
        gg.Enabled:=false;
        main.Enabled:=false;
        door.Enabled:=false;
        image1.Enabled:=false;
        image2.Visible:=true;
        image2.Enabled:=true;

           PassBtn:=Timage.Create(Form1);
       PassBtn.Parent:=Form1;
       PassBtn.Top:=0;
       PassBtn.Left:=0;
       PassBtn.AutoSize:=true;
       PassBtn.OnClick:=@PassClick;
       PassBtn.OnDblClick:=@PassClick;
       PassBtn.OnMouseMove:=@PassMouseMove;
       PassBtn.OnMouseDown:=@PassMouseDown;
        PassBtn.Picture.LoadFromFile(path+'Background/pswbtn.png');
        PassBtn.BringToFront;

           image2.BringToFront;
      //  main.Picture.LoadFromFile(path+'Background/pswbtn.png');
        pswEdit.Visible:=true;
        pswEdit.Enabled:=true;
        Image2.Top:=630;
        Image2.Left:=1150;
         pswEdit.Top:=148;
         pswEdit.Left:=243;
         pswEdit.Height:=88;
         pswEdit.Width:=715;
         pswEdit.SetFocus;
         pswEdit.Caption:='';
         try8:=false;
       end
       else if readtext=3 then r3:=true;
     end;
      15: begin
            Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
       GraphMode:=true;
       Graphroom:=1;
       room_update;
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

procedure TForm1.Timer2StopTimer(Sender: TObject);
begin
    if  speak>0 then
  begin
   if side=false then gg.Picture.Loadfromfile(path+'Move/standrightcut.png')
   else gg.Picture.Loadfromfile(path+'Move/standleft.png');
   speak:=0;
  end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
   inc(speak);
   if speak=5 then speak:=1;
   if side=false then begin
   case speak of
     1: gg.Picture.LoadfromFile(path+'Move/speak2col.png');
     2: gg.Picture.LoadfromFile(path+'Move/speak1col.png');
     3: gg.Picture.LoadfromFile(path+'Move/speak3col.png');
     4: gg.Picture.LoadfromFile(path+'Move/speak1col.png');
     end;
   end
   else begin
       case speak of
     1: gg.Picture.LoadfromFile(path+'Move/speak2left.png');
     2: gg.Picture.LoadfromFile(path+'Move/speak1left.png');
     3: gg.Picture.LoadfromFile(path+'Move/speak3left.png');
     4: gg.Picture.LoadfromFile(path+'Move/speak1left.png');
     end;
   end;
end;

procedure TForm1.PassClick(Sender: Tobject);
begin

end;

procedure TForm1.PassMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
    mos.x:=X;
  mos.y:=y;
end;

procedure TForm1.PassMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var s:string;  a1,a2:longint;   i:integer;
begin
 // if (room=8) and (rmp[8]=false) then begin
  case mos.x of
      243..359:
      begin
        case mos.y of
            286..372: begin
             if (pswEdit.Caption='больше') or (pswEdit.Caption='меньше') then pswEdit.Caption:='';
             pswEdit.Caption:=pswEdit.Caption+'1';
            end;
            373..457:    begin
             if (pswEdit.Caption='больше') or (pswEdit.Caption='меньше') then pswEdit.Caption:='';
              pswEdit.Caption:=pswEdit.Caption+'2';
            end;

            458..544: begin
             if (pswEdit.Caption='больше') or (pswEdit.Caption='меньше') then pswEdit.Caption:='';
              pswEdit.Caption:=pswEdit.Caption+'3';
            end;
        end;
      end;
      398..515:
       begin
        case mos.y of
            286..372: begin
             if (pswEdit.Caption='больше') or (pswEdit.Caption='меньше') then pswEdit.Caption:='';
              pswEdit.Caption:=pswEdit.Caption+'4';
            end;
            373..457: begin
             if (pswEdit.Caption='больше') or (pswEdit.Caption='меньше') then pswEdit.Caption:='';
              pswEdit.Caption:=pswEdit.Caption+'5';
            end;
            458..544: begin
             if (pswEdit.Caption='больше') or (pswEdit.Caption='меньше') then pswEdit.Caption:='';
              pswEdit.Caption:=pswEdit.Caption+'6';
            end;
        end;
      end;
      554..670:
       begin
        case mos.y of
            286..372: begin
             if (pswEdit.Caption='больше') or (pswEdit.Caption='меньше') then pswEdit.Caption:='';
              pswEdit.Caption:=pswEdit.Caption+'7';
            end;
            373..457: begin
             if (pswEdit.Caption='больше') or (pswEdit.Caption='меньше') then pswEdit.Caption:='';
              pswEdit.Caption:=pswEdit.Caption+'8';
            end;
            458..544: begin
             if (pswEdit.Caption='больше') or (pswEdit.Caption='меньше') then pswEdit.Caption:='';
              pswEdit.Caption:=pswEdit.Caption+'9';
            end;
        end;
      end;
       692..809:
       begin
        case mos.y of
            371..458: begin
             if (pswEdit.Caption='больше') or (pswEdit.Caption='меньше') then pswEdit.Caption:='';
              pswEdit.Caption:=pswEdit.Caption+'0';
            end;
        end;
      end;
      847..1032:
       begin
        case mos.y of
            325..400:
            begin
             s:=pswEdit.Caption;
            delete(s,length(s),1);
            pswEdit.Caption:=s;
            end;
            438..512:  begin
     //       Form1.Caption:=passbin;

            s:=pswEdit.Caption;
            if room=8 then begin
                if pswEdit.Caption=passbin then
                 begin
                    if Try8=false then begin
              for i:=readtext to 13 do
              begin
              readln(textf,CurrentText);
              end;
              readtext:=14;
              Try8:=true;
            end;

                   pswEdit.Visible:=false;
                   PassBtn.Free;
                   pswEdit.Enabled:=false;
                   door.Picture.Loadfromfile(path+'Background/dooropencut.png');
                    gg.Visible:=true;
                    psw.Visible:=false;
        door.Visible:=true;
        image1.Visible:=true;
        main.SendToBack;
                  rmp[8]:=true;
                   xl:=1200;
                   image2.Visible:=false;
                   image2.Enabled:=false;
                 end
                else begin
                     chk:=true;
                     val(passbin,a1);
                     val(s,a2);
          //           showmessage(inttostr(a1)+' '+inttostr(a2));
                     if a1<a2 then begin
                      pswEdit.Caption:='меньше';
                      if a2<HighBin then HighBin:=a2;
                      BordBin.Caption:=inttostr(LowBin)+' - '+inttostr(HighBin);
                     end
                     else begin pswEdit.Caption:='больше';
                         if a2>LowBin then LowBin:=a2;
                         BordBin.Caption:=inttostr(LowBin)+' - '+inttostr(HighBin);
                     end;
                end;
            end
            else if room=9 then begin

             s:=inttostr(numbgraph[4]);
         //          Form1.Caption:=s;
             if (s=pswEdit.Caption) then begin
                    if graphchecked=false then begin
              for i:=readtext to 20 do
              begin
              readln(textf,CurrentText);
              end;
              readtext:=21;
              graphchecked:=true;
            end;
                   pswEdit.Visible:=false;
                   pswEdit.Enabled:=false;
                   door.Picture.Loadfromfile(path+'Background/dooropencut.png');
                    gg.Visible:=true;
                    psw.Visible:=false;
        door.Visible:=true;
         PassBtn.Free;
        image1.Visible:=true;
        main.SendToBack;
                  rmp[9]:=true;
                   xl:=1200;
                   image2.Visible:=false;
                   image2.Enabled:=false;
             end
                else pswEdit.Caption:='';
            end
            else if room=10 then
            begin
               if pswEdit.Caption='0110100101101110100' then
            begin
                          if haffcheck=false then begin
              for i:=readtext to 29 do
              begin
              readln(textf,CurrentText);
              end;
              readtext:=30;
              haffcheck:=true;
            end;
                    pswEdit.Visible:=false;
                   pswEdit.Enabled:=false;
                   door.Picture.Loadfromfile(path+'Background/dooropencut.png');
                    gg.Visible:=true;
                    psw.Visible:=false;
        door.Visible:=true;
         PassBtn.Free;
        image1.Visible:=true;
        main.SendToBack;
                   image2.Visible:=false;
                   image2.Enabled:=false;
                     inc(readtext);
              readln(textf,CurrentText);
              Label1.Caption:=CurrentText;
              Image4.Visible:=true;
              Label1.Visible:=true;
              Timer2.Enabled:=true;
            end
               else pswEdit.Caption:='';
            end;

        end;
      end;
       end;
  end;
end;

procedure TForm1.room_update;
var i:byte;
begin
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
{if rmp[room-1]=true then
begin
  image1.Picture.Loadfromfile(path+'Background/dooropenleftins.png');
  xr:=0;
 end;      }
 //xr:=110;
  if GraphMode=false then begin
   // showmessage(inttostr(room));
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
     psw.Left:=1131;
     psw.Top:=400;
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
        Image3.Picture.LoadFromFile(path+'Background/dskb.png');
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
     psw.Left:=1131;
     psw.Top:=400;
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
     psw.Left:=1131;
     psw.Top:=400;
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
    8:
    begin
      psw:=TImage.Create(self);
      psw.Parent:=form1;
      psw.Left:=1131;
      psw.Top:=400;
      psw.Picture.LoadFromFile(path+'Background/pswcut.png');
      psw.Autosize:=true;
      psw.SendToBack;
      door.SendToBack;
      main.SendToBack;
      Image3.Picture.LoadFromFile(path+'Background/dskb.png');
    image3.Visible:=true;
    image3.Sendtoback;
    main.SendToBack;
  //  showmessage(passbin);
  //     pswEdit.Caption:='';
    end;
    9: begin
        BordBin.Visible:=false;
        Image3.Visible:=false;
        door.Visible:=true;
     {    wind:=TImage.Create(self);
     wind.Parent:=form1;
     wind.Left:=300;
     wind.Top:=170;
    wind.Picture.LoadFromFile(path+'Stuff/windcut.png');
     wind.Autosize:=true;
     wind.SendToBack;
     main.SendToBack;
    }
    psw.Visible:=true;
    pswEdit.Enabled:=true;
    pswEdit.Visible:=true;
    pswEdit.Text:='';
    pswEdit.Visible:=false;

    if graphon=false then  begin
     for i:=1 to 3 do
     begin
      doorback[i]:=TImage.Create(self);
     doorback[i].Parent:=form1;
    doorback[i].Picture.LoadFromFile(path+'Background/d1.png');
     doorback[i].Autosize:=true;
     doorback[i].Proportional:=true;
     doorback[i].SendToBack;
     doornumb[i]:=TImage.Create(self);
     doornumb[i].Parent:=form1;
   //  showmessage('WTF');
//    doornumb[i].Picture.LoadFromFile(path+'Background/101.png');
     doornumb[i].Autosize:=true;
     //  doornumb[i].Proportional:=true;
     // doornumb[i].SendToBack;
     end;
     end
    else gg.Left:=doorback[1].Left;
     graphon:=true;
     doorback[1].Visible:=true;
     doorback[2].Visible:=false;
     doorback[3].Visible:=false;
   //  doornumb[1].Visible:=doorback[1].Visible;
     doornumb[1].Visible:=true;
     doornumb[2].Visible:=false;
     doornumb[3].Visible:=false;
         doorback[1].Left:=750;
            doornumb[1].Picture.LoadFromFile(path+'Background/'+inttostr(numbgraph[1])+'.png');
         doornumb[1].Left:=doorback[1].Left+doorback[1].Width div 2-doornumb[1].Width div 2;

     doorback[1].Top:=297;
        doornumb[1].Top:=doorback[1].Top+67;
        doornumb[1].BringToFront;
        doorback[1].SendToBack;
   //     doorback[1].Visible:=false;
     //   main.Visible:=false;
        doornumb[1].Visible:=true;
        doornumb[1].BringToFront;
        main.SendToBack;
    end;
    10: begin
      for i:=1 to 3 do
      begin
      doorback[i].Free;
      doornumb[i].Free;
      end;
       pswEdit.Enabled:=true;
    pswEdit.Visible:=true;
    pswEdit.Text:='';
    pswEdit.Visible:=false;
      image3.Visible:=true;
      image3.Picture.LoadfromFile(path+'/Background/dskbhaf.png');
      image3.Left:=main.width div 2 - image3.Width div 2;
      psw.Visible:=true;
      inc(readtext);
              readln(textf,CurrentText);
              Label1.Caption:=CurrentText;
              Image4.Visible:=true;
              Label1.Visible:=true;
              Timer2.Enabled:=true;
    end;
  end;
  end
  else begin
 //   showmessage(inttostr(graphroom));
  door.Visible:=false;
  if graphroom>1 then
   begin
  image1.Visible:=false;
  gg.Left:=main.Width div 2 - (gg.Width div 2);
  end
  else image1.Visible:=true;
  case graphroom of
        1: begin
         psw.Visible:=false;
             doorback[2].Visible:=false;
           doorback[3].Visible:=false;
           if side=false then gg.Left:=88 else
             begin
              gg.Left:=88;
              gg.Picture.LoadfromFile(path+'Move/standrightcut.png');
              side:=false;
                 end;
              Image3.Picture.LoadFromFile(path+'Background/dskbgraph.png');
              image3.Visible:=true;
              image3.Left:=220;
              image3.Top:=image3.Top-10;
              image3.Sendtoback;
              main.SendToBack;
              doorback[1].Left:=850;
              if readtext=15 then
              begin
              inc(readtext);
              readln(textf,CurrentText);
              Label1.Caption:=CurrentText;
              Image4.Visible:=true;
              Label1.Visible:=true;
              Timer2.Enabled:=true;

              end;
                  doornumb[1].Visible:=doorback[1].Visible;
               doornumb[2].Visible:=doorback[2].Visible;
               doornumb[3].Visible:=doorback[3].Visible;
               doornumb[1].Left:=doorback[1].Left+doorback[1].Width div 2-doornumb[1].Width div 2;
               doornumb[2].Left:=doorback[2].Left+doorback[2].Width div 2-doornumb[2].Width div 2;
               doornumb[3].Left:=doorback[3].Left+doorback[3].Width div 2-doornumb[3].Width div 2;
                doornumb[1].Picture.LoadFromFile(path+'Background/'+inttostr(numbgraph[2])+'.png');
                doornumb[2].Top:=doornumb[1].Top;
                 doornumb[3].Top:=doornumb[1].Top;
             end;
        2: begin
           image3.Visible:=false;

           doorback[2].Left:=250;
           doorback[2].Visible:=false;
           doorback[3].Visible:=false;
           doorback[1].Left:=450;
           doorback[2].Top:=doorback[1].Top;
           doorback[3].Top:=doorback[1].Top;
           doornumb[1].Visible:=doorback[1].Visible;
               doornumb[2].Visible:=doorback[2].Visible;
               doornumb[3].Visible:=doorback[3].Visible;
                   doornumb[1].Picture.LoadFromFile(path+'Background/'+inttostr(numbgraph[3])+'.png');
               doornumb[1].Left:=doorback[1].Left+doorback[1].Width div 2-doornumb[1].Width div 2;
               doornumb[2].Left:=doorback[2].Left+doorback[2].Width div 2-doornumb[2].Width div 2;
               doornumb[3].Left:=doorback[3].Left+doorback[3].Width div 2-doornumb[3].Width div 2;


         end;
        3: begin
             doorback[2].Visible:=true;
           doorback[3].Visible:=false;
           doorback[1].Left:=800;
           doorback[2].Left:=250;
           doornumb[1].Visible:=doorback[1].Visible;
               doornumb[2].Visible:=doorback[2].Visible;
               doornumb[3].Visible:=doorback[3].Visible;
                   doornumb[1].Picture.LoadFromFile(path+'Background/'+inttostr(numbgraph[5])+'.png');
                doornumb[2].Picture.LoadFromFile(path+'Background/'+inttostr(numbgraph[4])+'.png');
               doornumb[1].Left:=doorback[1].Left+doorback[1].Width div 2-doornumb[1].Width div 2;
               doornumb[2].Left:=doorback[2].Left+doorback[2].Width div 2-doornumb[2].Width div 2;
               doornumb[3].Left:=doorback[3].Left+doorback[3].Width div 2-doornumb[3].Width div 2;

         end;
        4: begin
            doorback[2].Visible:=true;
           doorback[3].Visible:=false;
           doorback[1].Left:=700;
           doorback[2].Left:=300;
           doornumb[1].Visible:=doorback[1].Visible;
               doornumb[2].Visible:=doorback[2].Visible;
               doornumb[3].Visible:=doorback[3].Visible;
                   doornumb[1].Picture.LoadFromFile(path+'Background/'+inttostr(numbgraph[6])+'.png');
                doornumb[2].Picture.LoadFromFile(path+'Background/'+inttostr(numbgraph[3])+'.png');
               doornumb[1].Left:=doorback[1].Left+doorback[1].Width div 2-doornumb[1].Width div 2;
               doornumb[2].Left:=doorback[2].Left+doorback[2].Width div 2-doornumb[2].Width div 2;
               doornumb[3].Left:=doorback[3].Left+doorback[3].Width div 2-doornumb[3].Width div 2;

         end;
        5: begin
           doorback[2].Visible:=true;
           doorback[3].Visible:=true;
           doorback[1].Left:=850;
           doorback[2].Left:=600;
           doorback[3].Left:=250;
           doornumb[1].Visible:=doorback[1].Visible;
               doornumb[2].Visible:=doorback[2].Visible;
               doornumb[3].Visible:=doorback[3].Visible;
                     doornumb[1].Picture.LoadFromFile(path+'Background/'+inttostr(numbgraph[6])+'.png');
                doornumb[2].Picture.LoadFromFile(path+'Background/'+inttostr(numbgraph[3])+'.png');
                doornumb[3].Picture.LoadFromFile(path+'Background/'+inttostr(numbgraph[2])+'.png');
               doornumb[1].Left:=doorback[1].Left+doorback[1].Width div 2-doornumb[1].Width div 2;
               doornumb[2].Left:=doorback[2].Left+doorback[2].Width div 2-doornumb[2].Width div 2;
               doornumb[3].Left:=doorback[3].Left+doorback[3].Width div 2-doornumb[3].Width div 2;

         end;
        6: begin
            doorback[2].Visible:=true;
           doorback[3].Visible:=true;
           doorback[1].Left:=750;
           doorback[2].Left:=470;
           doorback[3].Left:=250;
           doornumb[1].Visible:=doorback[1].Visible;
               doornumb[2].Visible:=doorback[2].Visible;
               doornumb[3].Visible:=doorback[3].Visible;
               doornumb[1].Picture.LoadFromFile(path+'Background/'+inttostr(numbgraph[5])+'.png');
                doornumb[2].Picture.LoadFromFile(path+'Background/'+inttostr(numbgraph[4])+'.png');
                doornumb[3].Picture.LoadFromFile(path+'Background/'+inttostr(numbgraph[1])+'.png');
               doornumb[1].Left:=doorback[1].Left+doorback[1].Width div 2-doornumb[1].Width div 2;
               doornumb[2].Left:=doorback[2].Left+doorback[2].Width div 2-doornumb[2].Width div 2;
               doornumb[3].Left:=doorback[3].Left+doorback[3].Width div 2-doornumb[3].Width div 2;

         end;
        end;


  end;
end;
procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
var k,center,i:integer;
begin
  but:=Key;
  if (Timer2.Enabled=false) and ((readtext<>3) or (r3=true)) then begin
  if (room=7) and (but<>39) then close else   if (room<>7) then

   case but of
  37: begin
    if (side=false) or (gg.Left<=xr) then
    begin
      gg.Picture.Loadfromfile(path+'Move/standleft.png');
      side:=true;
      if Timer1.Enabled=false then Timer1.Enabled:=True;
    end
  else if Timer1.Enabled=false then Timer1.Enabled:=True;
  end;
   39:    begin
    if   (side=true) or (gg.Left>=xl) then
    begin
       gg.Picture.Loadfromfile(path+'Move/standrightcut.png');
       side:=false;
       if Timer1.Enabled=false then Timer1.Enabled:=True;
    end
   else if Timer1.Enabled=false then Timer1.Enabled:=True;
   end;
   32: begin
    if graphmode=false then begin
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
      main.Picture.LoadFromFile(path+'Background/dskblarge.png');
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
      8: begin
        if (gg.Left>950) and (rmp[8]=false) then
         begin
          case readtext of
            3:
             begin
              inc(readtext);
              readln(textf,CurrentText);
              Label1.Caption:=CurrentText;
              Image4.Visible:=true;
              Label1.Visible:=true;
              Timer2.Enabled:=true;
             end;
            14:begin
                main.BringToFront;
                gg.Enabled:=false;
                main.Enabled:=false;
                door.Enabled:=false;
                image1.Enabled:=false;
        image2.Visible:=true;
           image2.Enabled:=true;
             BordBin.Visible:=false;
           PassBtn:=Timage.Create(Form1);
       PassBtn.Parent:=Form1;
       PassBtn.Top:=0;
       PassBtn.Left:=0;
       PassBtn.AutoSize:=true;
       PassBtn.OnClick:=@PassClick;
       PassBtn.OnDblClick:=@PassClick;
       PassBtn.OnMouseMove:=@PassMouseMove;
       PassBtn.OnMouseDown:=@PassMouseDown;
        PassBtn.Picture.LoadFromFile(path+'Background/pswbtn.png');
        PassBtn.BringToFront;
          image2.BringToFront;
        pswEdit.Visible:=true;
        pswEdit.Enabled:=true;
        if (pswEdit.Caption='больше') or  (pswEdit.Caption='меньше') then pswEdit.Caption:='' ;
  pswEdit.SetFocus;
        pswEdit.SelStart := Length( pswEdit.Text );
  pswEdit.SelLength := 0;
        Image2.Top:=630;
        Image2.Left:=1150;
              end;
            end;
          end;
      end;
      9: begin
       if (gg.Left>950) then begin
         Label1.Caption:='Конечно же, заперто.';
         Label1.Visible:=true;
         Timer2.Enabled:=true;
         Image4.Visible:=true;
       end
    {   else if (gg.Left>(doorback[1].Left-100)) and (gg.Left<(doorback[1].Left+doorback[1].Width-50)) then
        begin
              Label1.Caption:='Даже тут заперто. Все сделали, чтобы мне не выбраться отсюда...';
         Label1.Visible:=true;
         Timer2.Enabled:=true;
         Image4.Visible:=true;
        end;  }
         else if (gg.Left>(doorback[1].Left-100)) and (gg.Left<(doorback[1].Left+doorback[1].Width-50)) then
           begin
            if anothercheck=false then begin
             anothercheck:=true;
              inc(readtext);
              readln(textf,CurrentText);
              Label1.Caption:=CurrentText;
              Image4.Visible:=true;
              Label1.Visible:=true;
              Timer2.Enabled:=true;
              graphroom:=1;
              end
            else begin
           //  showmessage('wtfit');
                   GraphMode:=true;
       Graphroom:=1;
       room_update;
             end;
           end
         else begin
          //    showmessage(inttostr(gg.left)+' '+inttostr(doorback[1].Left));
         end;
      end;
     10: begin
         if (gg.Left>image3.Left-50) and (gg.Left<image3.Left+image3.Width-100) and (image2.Visible=false) then
            begin
              main.BringToFront;
        image2.Visible:=true;
        image2.Left:=1100;
        image2.Top:=550;
           image2.Enabled:=true;
           image2.BringToFront;
           main.Picture.LoadFromFile(path+'Background/dskbhaf.png');
     end
         else if gg.Left>950 then
          begin
                   main.BringToFront;
                gg.Enabled:=false;
                main.Enabled:=false;
                door.Enabled:=false;
                image1.Enabled:=false;
        image2.Visible:=true;
           image2.Enabled:=true;
           PassBtn:=Timage.Create(Form1);
       PassBtn.Parent:=Form1;
       PassBtn.Top:=0;
       PassBtn.Left:=0;
       PassBtn.AutoSize:=true;
       PassBtn.OnClick:=@PassClick;
       PassBtn.OnDblClick:=@PassClick;
       PassBtn.OnMouseMove:=@PassMouseMove;
       PassBtn.OnMouseDown:=@PassMouseDown;
        PassBtn.Picture.LoadFromFile(path+'Background/pswbtn.png');
        PassBtn.BringToFront;
          image2.BringToFront;
        pswEdit.Visible:=true;
        pswEdit.Enabled:=true;
  pswEdit.SetFocus;
        pswEdit.SelStart := Length( pswEdit.Text );
  pswEdit.SelLength := 0;
        Image2.Top:=630;
        Image2.Left:=1150;
          end;
     end;
     end;
   end
      else begin
    case graphroom of
       1: begin
        if (gg.Left>image3.Left-50) and (gg.Left<image3.Left+image3.Width-100) and (image2.Visible=false) then
        begin
              main.BringToFront;
        image2.Visible:=true;
        image2.Left:=1100;
        image2.Top:=550;
           image2.Enabled:=true;
           image2.BringToFront;
           main.Picture.LoadFromFile(path+'Background/dskbgraph.png');
           m1.Visible:=true;
            m2.Visible:=true;
            m3.Visible:=true;
            m4.Visible:=true;
            m5.Visible:=true;
            m6.Visible:=true;
            m1.AutoSize:=true;
            m2.AutoSize:=true;
            m3.AutoSize:=true;
            m4.AutoSize:=true;
            m5.AutoSize:=true;
            m6.AutoSize:=true;
            m1.BringToFront;
            m2.BringToFront;
            m3.BringToFront;
            m4.BringToFront;
            m5.BringToFront;
            m6.BringToFront;
        end
        else if (gg.Left>doorback[1].Left-100) and (gg.Left<doorback[1].Left+doorback[1].Width)
        and (image2.Visible=false) then
        begin
          graphroom:=2;
          room_update;
        end
         else if (side=true) and (gg.Left<image3.left) and (image2.Visible=false) then
          begin
             graphmode:=false;
             room_update;
           end;
       end;
       2: begin
        if (gg.Left>doorback[1].Left-100) and (gg.Left<doorback[1].Left+doorback[1].Width) then
           begin
             graphroom:=3;
             room_update;
           end;
        end;
       3:begin
          if (gg.Left>doorback[1].Left-100) and (gg.Left<doorback[1].Left+doorback[1].Width) then
              begin
                  graphroom:=5;
                  room_update;
               end
           else if (gg.Left>doorback[2].Left-100) and (gg.Left<doorback[2].Left+doorback[2].Width) then
              begin
                  graphroom:=4;
                  room_update;
               end;
          end;
       4: begin
             if (gg.Left>doorback[1].Left-100) and (gg.Left<doorback[1].Left+doorback[1].Width) then
              begin
                  graphroom:=6;
                  room_update;
               end
             else if     (gg.Left>doorback[2].Left-100) and (gg.Left<doorback[2].Left+doorback[2].Width) then
              begin
                  graphroom:=3;
                  room_update;
               end;
        end;
       5: begin
            if (gg.Left>doorback[1].Left-100) and (gg.Left<doorback[1].Left+doorback[1].Width) then
              begin
                  graphroom:=6;
                  room_update;
               end
             else if     (gg.Left>doorback[2].Left-100) and (gg.Left<doorback[2].Left+doorback[2].Width) then
              begin
                  graphroom:=3;
                  room_update;
               end
              else if     (gg.Left>doorback[3].Left-100) and (gg.Left<doorback[3].Left+doorback[3].Width) then
              begin
                  graphroom:=2;
                  room_update;
               end  ;
       end;
       6: begin
           if (gg.Left>doorback[1].Left-100) and (gg.Left<doorback[1].Left+doorback[1].Width) then
              begin
                  graphroom:=5;
                  room_update;
               end
             else if     (gg.Left>doorback[2].Left-100) and (gg.Left<doorback[2].Left+doorback[2].Width) then
              begin
                  graphroom:=4;
                  room_update;
               end
              else if     (gg.Left>doorback[3].Left-100) and (gg.Left<doorback[3].Left+doorback[3].Width) then
              begin
                  graphroom:=1;
                  room_update;
               end  ;
       end;

  end;
    end;
     end;


  {27:begin if ( room=2) and (pswEdit.Visible=true) then
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
    end
   else if (graphmode=true) and (image2.Visible=true)  then begin
       main.Picture.Loadfromfile(path+'Background/backtest.png');
    main.SendToBack;
    m1.Visible:=false;
    m2.Visible:=false;
    m3.Visible:=false;
    m4.Visible:=false;
    m5.Visible:=false;
    m6.Visible:=false;
   end;
    image2.Visible:=false;
     image2.Enabled:=false;
   //  Close;
  end;}
   end;
  end
  else if but=32 then
  begin
   if  Label1.Caption='Конечно же, заперто.' then    begin
          Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
        main.BringToFront;
                gg.Enabled:=false;
                main.Enabled:=false;
                door.Enabled:=false;
                image1.Enabled:=false;
        image2.Visible:=true;
           image2.Enabled:=true;
           PassBtn:=Timage.Create(Form1);
       PassBtn.Parent:=Form1;
       PassBtn.Top:=0;
       PassBtn.Left:=0;
       PassBtn.AutoSize:=true;
       PassBtn.OnClick:=@PassClick;
       PassBtn.OnDblClick:=@PassClick;
       PassBtn.OnMouseMove:=@PassMouseMove;
       PassBtn.OnMouseDown:=@PassMouseDown;
        PassBtn.Picture.LoadFromFile(path+'Background/pswbtn.png');
        PassBtn.BringToFront;
          image2.BringToFront;
        pswEdit.Visible:=true;
        pswEdit.Enabled:=true;
  pswEdit.SetFocus;
        pswEdit.SelStart := Length( pswEdit.Text );
  pswEdit.SelLength := 0;
        Image2.Top:=630;
        Image2.Left:=1150;
   end
   else
    case ReadText of
     1,4,6..13,17..20,22,24..29,31..34: begin
           readln(textf,CurrentText);
           Label1.Caption:=CurrentText;
           inc(readtext);
        end;
     2: begin
           readln(textf,CurrentText);
           Label1.Caption:=CurrentText;
           inc(readtext);
           Timer2.Enabled:=false;
           Label1.Font.Color:=13536044;
        end;
     35: begin
        close;
      end;
     3,5,14,16,21,23,30:begin
       Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
       if (readtext=14) and (room=8) then
       begin
        BordBin.Visible:=true;
        BordBin.Caption:=inttostr(LowBin)+' - '+inttostr(HighBin);
       end;
     Label1.Font.Color:=16777215;
       if ReadText=5 then
       begin
        main.BringToFront;
        gg.Enabled:=false;
        main.Enabled:=false;
        door.Enabled:=false;
        image1.Enabled:=false;
        image2.Visible:=true;
        image2.Enabled:=true;
           
           PassBtn:=Timage.Create(Form1);
       PassBtn.Parent:=Form1;
       PassBtn.Top:=0;
       PassBtn.Left:=0;
       PassBtn.AutoSize:=true;
       PassBtn.OnClick:=@PassClick;
       PassBtn.OnDblClick:=@PassClick;
       PassBtn.OnMouseMove:=@PassMouseMove;
       PassBtn.OnMouseDown:=@PassMouseDown;
        PassBtn.Picture.LoadFromFile(path+'Background/pswbtn.png');
        PassBtn.BringToFront;

           image2.BringToFront;
      //  main.Picture.LoadFromFile(path+'Background/pswbtn.png');
        pswEdit.Visible:=true;
        pswEdit.Enabled:=true;
        Image2.Top:=630;
        Image2.Left:=1150;
         pswEdit.Top:=148;
         pswEdit.Left:=243;
         pswEdit.Height:=88;
         pswEdit.Width:=715;
         pswEdit.SetFocus;
         pswEdit.Caption:='';
         try8:=false;
       end
       else if readtext=3 then r3:=true;
     end;
      15: begin
            Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
       GraphMode:=true;
       Graphroom:=1;
       room_update;
      end;
    end;
   end;
   end;
procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if but=Key then Timer1.Enabled:=False;
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TForm1.ggClick(Sender: TObject);
begin
      if (Timer2.Enabled=false) and ((readtext<>3) or (r3=true)) then begin

  end
  else
  begin
   if  Label1.Caption='Конечно же, заперто.' then    begin
          Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
        main.BringToFront;
                gg.Enabled:=false;
                main.Enabled:=false;
                door.Enabled:=false;
                image1.Enabled:=false;
        image2.Visible:=true;
           image2.Enabled:=true;
           PassBtn:=Timage.Create(Form1);
       PassBtn.Parent:=Form1;
       PassBtn.Top:=0;
       PassBtn.Left:=0;
       PassBtn.AutoSize:=true;
       PassBtn.OnClick:=@PassClick;
       PassBtn.OnDblClick:=@PassClick;
       PassBtn.OnMouseMove:=@PassMouseMove;
       PassBtn.OnMouseDown:=@PassMouseDown;
        PassBtn.Picture.LoadFromFile(path+'Background/pswbtn.png');
        PassBtn.BringToFront;
          image2.BringToFront;
        pswEdit.Visible:=true;
        pswEdit.Enabled:=true;
  pswEdit.SetFocus;
        pswEdit.SelStart := Length( pswEdit.Text );
  pswEdit.SelLength := 0;
        Image2.Top:=630;
        Image2.Left:=1150;
   end
   else
    case ReadText of
     1,4,6..13,17..20,22,24..29,31..34: begin
           readln(textf,CurrentText);
           Label1.Caption:=CurrentText;
           inc(readtext);
        end;
     2: begin
           readln(textf,CurrentText);
           Label1.Caption:=CurrentText;
           inc(readtext);
           Timer2.Enabled:=false;
           Label1.Font.Color:=13536044;
        end;
     35: begin
        close;
      end;
     3,5,14,16,21,23,30:begin
       Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
       if (readtext=14) and (room=8) then
       begin
        BordBin.Visible:=true;
        BordBin.Caption:=inttostr(LowBin)+' - '+inttostr(HighBin);
       end;
     Label1.Font.Color:=16777215;
       if ReadText=5 then
       begin
        main.BringToFront;
        gg.Enabled:=false;
        main.Enabled:=false;
        door.Enabled:=false;
        image1.Enabled:=false;
        image2.Visible:=true;
        image2.Enabled:=true;

           PassBtn:=Timage.Create(Form1);
       PassBtn.Parent:=Form1;
       PassBtn.Top:=0;
       PassBtn.Left:=0;
       PassBtn.AutoSize:=true;
       PassBtn.OnClick:=@PassClick;
       PassBtn.OnDblClick:=@PassClick;
       PassBtn.OnMouseMove:=@PassMouseMove;
       PassBtn.OnMouseDown:=@PassMouseDown;
        PassBtn.Picture.LoadFromFile(path+'Background/pswbtn.png');
        PassBtn.BringToFront;

           image2.BringToFront;
      //  main.Picture.LoadFromFile(path+'Background/pswbtn.png');
        pswEdit.Visible:=true;
        pswEdit.Enabled:=true;
        Image2.Top:=630;
        Image2.Left:=1150;
         pswEdit.Top:=148;
         pswEdit.Left:=243;
         pswEdit.Height:=88;
         pswEdit.Width:=715;
         pswEdit.SetFocus;
         pswEdit.Caption:='';
         try8:=false;
       end
       else if readtext=3 then r3:=true;
     end;
      15: begin
            Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
       GraphMode:=true;
       Graphroom:=1;
       room_update;
      end;
    end;
   end;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
    if (Timer2.Enabled=false) and ((readtext<>3) or (r3=true)) then begin

  end
  else
  begin
   if  Label1.Caption='Конечно же, заперто.' then    begin
          Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
        main.BringToFront;
                gg.Enabled:=false;
                main.Enabled:=false;
                door.Enabled:=false;
                image1.Enabled:=false;
        image2.Visible:=true;
           image2.Enabled:=true;
           PassBtn:=Timage.Create(Form1);
       PassBtn.Parent:=Form1;
       PassBtn.Top:=0;
       PassBtn.Left:=0;
       PassBtn.AutoSize:=true;
       PassBtn.OnClick:=@PassClick;
       PassBtn.OnDblClick:=@PassClick;
       PassBtn.OnMouseMove:=@PassMouseMove;
       PassBtn.OnMouseDown:=@PassMouseDown;
        PassBtn.Picture.LoadFromFile(path+'Background/pswbtn.png');
        PassBtn.BringToFront;
          image2.BringToFront;
        pswEdit.Visible:=true;
        pswEdit.Enabled:=true;
  pswEdit.SetFocus;
        pswEdit.SelStart := Length( pswEdit.Text );
  pswEdit.SelLength := 0;
        Image2.Top:=630;
        Image2.Left:=1150;
   end
   else
    case ReadText of
     1,4,6..13,17..20,22,24..29,31..34: begin
           readln(textf,CurrentText);
           Label1.Caption:=CurrentText;
           inc(readtext);
        end;
     2: begin
           readln(textf,CurrentText);
           Label1.Caption:=CurrentText;
           inc(readtext);
           Timer2.Enabled:=false;
           Label1.Font.Color:=13536044;
        end;
     35: begin
        close;
      end;
     3,5,14,16,21,23,30:begin
       Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
       if (readtext=14) and (room=8) then
       begin
        BordBin.Visible:=true;
        BordBin.Caption:=inttostr(LowBin)+' - '+inttostr(HighBin);
       end;
     Label1.Font.Color:=16777215;
       if ReadText=5 then
       begin
        main.BringToFront;
        gg.Enabled:=false;
        main.Enabled:=false;
        door.Enabled:=false;
        image1.Enabled:=false;
        image2.Visible:=true;
        image2.Enabled:=true;

           PassBtn:=Timage.Create(Form1);
       PassBtn.Parent:=Form1;
       PassBtn.Top:=0;
       PassBtn.Left:=0;
       PassBtn.AutoSize:=true;
       PassBtn.OnClick:=@PassClick;
       PassBtn.OnDblClick:=@PassClick;
       PassBtn.OnMouseMove:=@PassMouseMove;
       PassBtn.OnMouseDown:=@PassMouseDown;
        PassBtn.Picture.LoadFromFile(path+'Background/pswbtn.png');
        PassBtn.BringToFront;

           image2.BringToFront;
      //  main.Picture.LoadFromFile(path+'Background/pswbtn.png');
        pswEdit.Visible:=true;
        pswEdit.Enabled:=true;
        Image2.Top:=630;
        Image2.Left:=1150;
         pswEdit.Top:=148;
         pswEdit.Left:=243;
         pswEdit.Height:=88;
         pswEdit.Width:=715;
         pswEdit.SetFocus;
         pswEdit.Caption:='';
         try8:=false;
       end
       else if readtext=3 then r3:=true;
     end;
      15: begin
            Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
       GraphMode:=true;
       Graphroom:=1;
       room_update;
      end;
    end;
   end;
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
    end
   else if (room=8) and (pswEdit.Visible=true) then
   begin
       pswLabel.Visible:=false;
      main.Picture.Loadfromfile(path+'Background/backtest.png');
    main.SendToBack;
    pswEdit.Visible:=false;
    pswEdit.Enabled:=false;
    PassBtn.Free;
       if try8=false then      begin
           main.SendToBack;
           try8:=true;
          Label1.Visible:=true;
      Image4.Visible:=true;
        inc(readtext);
        readln(textf,CurrentText);
        Label1.Caption:=CurrentText;
        Timer2.Enabled:=true;
        end;
   end
    else if (room=9) and (pswEdit.Visible=true) then
   begin
       pswLabel.Visible:=false;
      main.Picture.Loadfromfile(path+'Background/backtest.png');
    main.SendToBack;
    pswEdit.Visible:=false;
    pswEdit.Enabled:=false;
    PassBtn.Free;
    bordbin.Visible:=false;
    bordbin.Caption:='';
   end
     else if (room=10) and (pswEdit.Visible=true) then
   begin
       pswLabel.Visible:=false;
      main.Picture.Loadfromfile(path+'Background/backtest.png');
    main.SendToBack;
    pswEdit.Visible:=false;
    pswEdit.Enabled:=false;
    PassBtn.Free;
     bordbin.Visible:=false;
   end
     else if (room=10) and (image3.Visible=true) then
   begin
       pswLabel.Visible:=false;
      main.Picture.Loadfromfile(path+'Background/backtest.png');
    main.SendToBack;
    pswEdit.Visible:=false;
    pswEdit.Enabled:=false;
     bordbin.Visible:=false;
    if haffcheck=false then
    begin
         haffcheck:=true;
          Label1.Visible:=true;
      Image4.Visible:=true;
        inc(readtext);
        readln(textf,CurrentText);
        Label1.Caption:=CurrentText;
        Timer2.Enabled:=true;
    end;
   end
   else if (graphmode=true) and (graphroom=1) then
      begin
          main.Picture.Loadfromfile(path+'Background/backtest.png');
    main.SendToBack;
    m1.Visible:=false;
    m2.Visible:=false;
    m3.Visible:=false;
    m4.Visible:=false;
    m5.Visible:=false;
    m6.Visible:=false;
    if graphchecked=false then
      begin
             graphchecked:=true;
        inc(readtext);
              readln(textf,CurrentText);
              Label1.Caption:=CurrentText;
              Image4.Visible:=true;
              Label1.Visible:=true;
              Timer2.Enabled:=true;
      end;
   end;
    image2.Visible:=false;
     image2.Enabled:=false;

 if (readtext=14) then BordBin.Visible:=true;
  end;
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
    if (Timer2.Enabled=false) and ((readtext<>3) or (r3=true)) then begin

  end
  else
  begin
   if  Label1.Caption='Конечно же, заперто.' then    begin
          Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
        main.BringToFront;
                gg.Enabled:=false;
                main.Enabled:=false;
                door.Enabled:=false;
                image1.Enabled:=false;
        image2.Visible:=true;
           image2.Enabled:=true;
           PassBtn:=Timage.Create(Form1);
       PassBtn.Parent:=Form1;
       PassBtn.Top:=0;
       PassBtn.Left:=0;
       PassBtn.AutoSize:=true;
       PassBtn.OnClick:=@PassClick;
       PassBtn.OnDblClick:=@PassClick;
       PassBtn.OnMouseMove:=@PassMouseMove;
       PassBtn.OnMouseDown:=@PassMouseDown;
        PassBtn.Picture.LoadFromFile(path+'Background/pswbtn.png');
        PassBtn.BringToFront;
          image2.BringToFront;
        pswEdit.Visible:=true;
        pswEdit.Enabled:=true;
  pswEdit.SetFocus;
        pswEdit.SelStart := Length( pswEdit.Text );
  pswEdit.SelLength := 0;
        Image2.Top:=630;
        Image2.Left:=1150;
   end
   else
    case ReadText of
     1,4,6..13,17..20,22,24..29,31..34: begin
           readln(textf,CurrentText);
           Label1.Caption:=CurrentText;
           inc(readtext);
        end;
     2: begin
           readln(textf,CurrentText);
           Label1.Caption:=CurrentText;
           inc(readtext);
           Timer2.Enabled:=false;
           Label1.Font.Color:=13536044;
        end;
     35: begin
        close;
      end;
     3,5,14,16,21,23,30:begin
       Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
       if (readtext=14) and (room=8) then
       begin
        BordBin.Visible:=true;
        BordBin.Caption:=inttostr(LowBin)+' - '+inttostr(HighBin);
       end;
     Label1.Font.Color:=16777215;
       if ReadText=5 then
       begin
        main.BringToFront;
        gg.Enabled:=false;
        main.Enabled:=false;
        door.Enabled:=false;
        image1.Enabled:=false;
        image2.Visible:=true;
        image2.Enabled:=true;

           PassBtn:=Timage.Create(Form1);
       PassBtn.Parent:=Form1;
       PassBtn.Top:=0;
       PassBtn.Left:=0;
       PassBtn.AutoSize:=true;
       PassBtn.OnClick:=@PassClick;
       PassBtn.OnDblClick:=@PassClick;
       PassBtn.OnMouseMove:=@PassMouseMove;
       PassBtn.OnMouseDown:=@PassMouseDown;
        PassBtn.Picture.LoadFromFile(path+'Background/pswbtn.png');
        PassBtn.BringToFront;

           image2.BringToFront;
      //  main.Picture.LoadFromFile(path+'Background/pswbtn.png');
        pswEdit.Visible:=true;
        pswEdit.Enabled:=true;
        Image2.Top:=630;
        Image2.Left:=1150;
         pswEdit.Top:=148;
         pswEdit.Left:=243;
         pswEdit.Height:=88;
         pswEdit.Width:=715;
         pswEdit.SetFocus;
         pswEdit.Caption:='';
         try8:=false;
       end
       else if readtext=3 then r3:=true;
     end;
      15: begin
            Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
       GraphMode:=true;
       Graphroom:=1;
       room_update;
      end;
    end;
   end;
end;

procedure TForm1.Image4Click(Sender: TObject);
begin
    if (Timer2.Enabled=false) and ((readtext<>3) or (r3=true)) then begin

  end
  else if but=32 then
  begin
   if  Label1.Caption='Конечно же, заперто.' then    begin
          Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
        main.BringToFront;
                gg.Enabled:=false;
                main.Enabled:=false;
                door.Enabled:=false;
                image1.Enabled:=false;
        image2.Visible:=true;
           image2.Enabled:=true;
           PassBtn:=Timage.Create(Form1);
       PassBtn.Parent:=Form1;
       PassBtn.Top:=0;
       PassBtn.Left:=0;
       PassBtn.AutoSize:=true;
       PassBtn.OnClick:=@PassClick;
       PassBtn.OnDblClick:=@PassClick;
       PassBtn.OnMouseMove:=@PassMouseMove;
       PassBtn.OnMouseDown:=@PassMouseDown;
        PassBtn.Picture.LoadFromFile(path+'Background/pswbtn.png');
        PassBtn.BringToFront;
          image2.BringToFront;
        pswEdit.Visible:=true;
        pswEdit.Enabled:=true;
  pswEdit.SetFocus;
        pswEdit.SelStart := Length( pswEdit.Text );
  pswEdit.SelLength := 0;
        Image2.Top:=630;
        Image2.Left:=1150;
   end
   else
    case ReadText of
     1,4,6..13,17..20,22,24..29,31..34: begin
           readln(textf,CurrentText);
           Label1.Caption:=CurrentText;
           inc(readtext);
        end;
     2: begin
           readln(textf,CurrentText);
           Label1.Caption:=CurrentText;
           inc(readtext);
           Timer2.Enabled:=false;
           Label1.Font.Color:=13536044;
        end;
     35: begin
        close;
      end;
     3,5,14,16,21,23,30:begin
       Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
       if (readtext=14) and (room=8) then
       begin
        BordBin.Visible:=true;
        BordBin.Caption:=inttostr(LowBin)+' - '+inttostr(HighBin);
       end;
     Label1.Font.Color:=16777215;
       if ReadText=5 then
       begin
        main.BringToFront;
        gg.Enabled:=false;
        main.Enabled:=false;
        door.Enabled:=false;
        image1.Enabled:=false;
        image2.Visible:=true;
        image2.Enabled:=true;

           PassBtn:=Timage.Create(Form1);
       PassBtn.Parent:=Form1;
       PassBtn.Top:=0;
       PassBtn.Left:=0;
       PassBtn.AutoSize:=true;
       PassBtn.OnClick:=@PassClick;
       PassBtn.OnDblClick:=@PassClick;
       PassBtn.OnMouseMove:=@PassMouseMove;
       PassBtn.OnMouseDown:=@PassMouseDown;
        PassBtn.Picture.LoadFromFile(path+'Background/pswbtn.png');
        PassBtn.BringToFront;

           image2.BringToFront;
      //  main.Picture.LoadFromFile(path+'Background/pswbtn.png');
        pswEdit.Visible:=true;
        pswEdit.Enabled:=true;
        Image2.Top:=630;
        Image2.Left:=1150;
         pswEdit.Top:=148;
         pswEdit.Left:=243;
         pswEdit.Height:=88;
         pswEdit.Width:=715;
         pswEdit.SetFocus;
         pswEdit.Caption:='';
         try8:=false;
       end
       else if readtext=3 then r3:=true;
     end;
      15: begin
            Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
       GraphMode:=true;
       Graphroom:=1;
       room_update;
      end;
    end;
   end;
end;

procedure TForm1.Label1Click(Sender: TObject);
begin
    if (Timer2.Enabled=false) and ((readtext<>3) or (r3=true)) then begin

  end
  else
  begin
   if  Label1.Caption='Конечно же, заперто.' then    begin
          Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
        main.BringToFront;
                gg.Enabled:=false;
                main.Enabled:=false;
                door.Enabled:=false;
                image1.Enabled:=false;
        image2.Visible:=true;
           image2.Enabled:=true;
           PassBtn:=Timage.Create(Form1);
       PassBtn.Parent:=Form1;
       PassBtn.Top:=0;
       PassBtn.Left:=0;
       PassBtn.AutoSize:=true;
       PassBtn.OnClick:=@PassClick;
       PassBtn.OnDblClick:=@PassClick;
       PassBtn.OnMouseMove:=@PassMouseMove;
       PassBtn.OnMouseDown:=@PassMouseDown;
        PassBtn.Picture.LoadFromFile(path+'Background/pswbtn.png');
        PassBtn.BringToFront;
          image2.BringToFront;
        pswEdit.Visible:=true;
        pswEdit.Enabled:=true;
  pswEdit.SetFocus;
        pswEdit.SelStart := Length( pswEdit.Text );
  pswEdit.SelLength := 0;
        Image2.Top:=630;
        Image2.Left:=1150;
   end
   else
    case ReadText of
     1,4,6..13,17..20,22,24..29,31..34: begin
           readln(textf,CurrentText);
           Label1.Caption:=CurrentText;
           inc(readtext);
        end;
     2: begin
           readln(textf,CurrentText);
           Label1.Caption:=CurrentText;
           inc(readtext);
           Timer2.Enabled:=false;
           Label1.Font.Color:=13536044;
        end;
     35: begin
        close;
      end;
     3,5,14,16,21,23,30:begin
       Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
       if (readtext=14) and (room=8) then
       begin
        BordBin.Visible:=true;
        BordBin.Caption:=inttostr(LowBin)+' - '+inttostr(HighBin);
       end;
     Label1.Font.Color:=16777215;
       if ReadText=5 then
       begin
        main.BringToFront;
        gg.Enabled:=false;
        main.Enabled:=false;
        door.Enabled:=false;
        image1.Enabled:=false;
        image2.Visible:=true;
        image2.Enabled:=true;

           PassBtn:=Timage.Create(Form1);
       PassBtn.Parent:=Form1;
       PassBtn.Top:=0;
       PassBtn.Left:=0;
       PassBtn.AutoSize:=true;
       PassBtn.OnClick:=@PassClick;
       PassBtn.OnDblClick:=@PassClick;
       PassBtn.OnMouseMove:=@PassMouseMove;
       PassBtn.OnMouseDown:=@PassMouseDown;
        PassBtn.Picture.LoadFromFile(path+'Background/pswbtn.png');
        PassBtn.BringToFront;

           image2.BringToFront;
      //  main.Picture.LoadFromFile(path+'Background/pswbtn.png');
        pswEdit.Visible:=true;
        pswEdit.Enabled:=true;
        Image2.Top:=630;
        Image2.Left:=1150;
         pswEdit.Top:=148;
         pswEdit.Left:=243;
         pswEdit.Height:=88;
         pswEdit.Width:=715;
         pswEdit.SetFocus;
         pswEdit.Caption:='';
         try8:=false;
       end
       else if readtext=3 then r3:=true;
     end;
      15: begin
            Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
       GraphMode:=true;
       Graphroom:=1;
       room_update;
      end;
    end;
   end;
end;

procedure TForm1.Label2Click(Sender: TObject);
begin
    if (Timer2.Enabled=false) and ((readtext<>3) or (r3=true)) then begin

  end
  else
  begin
   if  Label1.Caption='Конечно же, заперто.' then    begin
          Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
        main.BringToFront;
                gg.Enabled:=false;
                main.Enabled:=false;
                door.Enabled:=false;
                image1.Enabled:=false;
        image2.Visible:=true;
           image2.Enabled:=true;
           PassBtn:=Timage.Create(Form1);
       PassBtn.Parent:=Form1;
       PassBtn.Top:=0;
       PassBtn.Left:=0;
       PassBtn.AutoSize:=true;
       PassBtn.OnClick:=@PassClick;
       PassBtn.OnDblClick:=@PassClick;
       PassBtn.OnMouseMove:=@PassMouseMove;
       PassBtn.OnMouseDown:=@PassMouseDown;
        PassBtn.Picture.LoadFromFile(path+'Background/pswbtn.png');
        PassBtn.BringToFront;
          image2.BringToFront;
        pswEdit.Visible:=true;
        pswEdit.Enabled:=true;
  pswEdit.SetFocus;
        pswEdit.SelStart := Length( pswEdit.Text );
  pswEdit.SelLength := 0;
        Image2.Top:=630;
        Image2.Left:=1150;
   end
   else
    case ReadText of
     1,4,6..13,17..20,22,24..29,31..34: begin
           readln(textf,CurrentText);
           Label1.Caption:=CurrentText;
           inc(readtext);
        end;
     2: begin
           readln(textf,CurrentText);
           Label1.Caption:=CurrentText;
           inc(readtext);
           Timer2.Enabled:=false;
           Label1.Font.Color:=13536044;
        end;
     35: begin
        close;
      end;
     3,5,14,16,21,23,30:begin
       Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
       if (readtext=14) and (room=8) then
       begin
        BordBin.Visible:=true;
        BordBin.Caption:=inttostr(LowBin)+' - '+inttostr(HighBin);
       end;
     Label1.Font.Color:=16777215;
       if ReadText=5 then
       begin
        main.BringToFront;
        gg.Enabled:=false;
        main.Enabled:=false;
        door.Enabled:=false;
        image1.Enabled:=false;
        image2.Visible:=true;
        image2.Enabled:=true;

           PassBtn:=Timage.Create(Form1);
       PassBtn.Parent:=Form1;
       PassBtn.Top:=0;
       PassBtn.Left:=0;
       PassBtn.AutoSize:=true;
       PassBtn.OnClick:=@PassClick;
       PassBtn.OnDblClick:=@PassClick;
       PassBtn.OnMouseMove:=@PassMouseMove;
       PassBtn.OnMouseDown:=@PassMouseDown;
        PassBtn.Picture.LoadFromFile(path+'Background/pswbtn.png');
        PassBtn.BringToFront;

           image2.BringToFront;
      //  main.Picture.LoadFromFile(path+'Background/pswbtn.png');
        pswEdit.Visible:=true;
        pswEdit.Enabled:=true;
        Image2.Top:=630;
        Image2.Left:=1150;
         pswEdit.Top:=148;
         pswEdit.Left:=243;
         pswEdit.Height:=88;
         pswEdit.Width:=715;
         pswEdit.SetFocus;
         pswEdit.Caption:='';
         try8:=false;
       end
       else if readtext=3 then r3:=true;
     end;
      15: begin
            Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
       GraphMode:=true;
       Graphroom:=1;
       room_update;
      end;
    end;
   end;
end;

procedure TForm1.m1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     gr.x:=x;
     gr.y:=y;
end;

procedure TForm1.m1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
  );
begin
  if (gr.x>0) or (gr.y>0) then
  begin
  (Sender as TImage).SetBounds((Sender as TImage).Left + X - gr.x,
(Sender as TImage).Top + Y - gr.y, (Sender as TImage).Width,
(Sender as TImage).height);
  end;
end;

procedure TForm1.m1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  gr.x:=0;
  gr.y:=0;

end;

procedure TForm1.mainClick(Sender: TObject);
begin

  if (Timer2.Enabled=false) and ((readtext<>3) or (r3=true)) then begin

  end
  else
  begin
   if  Label1.Caption='Конечно же, заперто.' then    begin
          Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
        main.BringToFront;
                gg.Enabled:=false;
                main.Enabled:=false;
                door.Enabled:=false;
                image1.Enabled:=false;
        image2.Visible:=true;
           image2.Enabled:=true;
           PassBtn:=Timage.Create(Form1);
       PassBtn.Parent:=Form1;
       PassBtn.Top:=0;
       PassBtn.Left:=0;
       PassBtn.AutoSize:=true;
       PassBtn.OnClick:=@PassClick;
       PassBtn.OnDblClick:=@PassClick;
       PassBtn.OnMouseMove:=@PassMouseMove;
       PassBtn.OnMouseDown:=@PassMouseDown;
        PassBtn.Picture.LoadFromFile(path+'Background/pswbtn.png');
        PassBtn.BringToFront;
          image2.BringToFront;
        pswEdit.Visible:=true;
        pswEdit.Enabled:=true;
  pswEdit.SetFocus;
        pswEdit.SelStart := Length( pswEdit.Text );
  pswEdit.SelLength := 0;
        Image2.Top:=630;
        Image2.Left:=1150;
   end
   else
    case ReadText of
     1,4,6..13,17..20,22,24..29,31..34: begin
           readln(textf,CurrentText);
           Label1.Caption:=CurrentText;
           inc(readtext);
        end;
     2: begin
           readln(textf,CurrentText);
           Label1.Caption:=CurrentText;
           inc(readtext);
           Timer2.Enabled:=false;
           Label1.Font.Color:=13536044;
        end;
     35: begin
        close;
      end;
     3,5,14,16,21,23,30:begin
       Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
       if (readtext=14) and (room=8) then
       begin
        BordBin.Visible:=true;
        BordBin.Caption:=inttostr(LowBin)+' - '+inttostr(HighBin);
       end;
     Label1.Font.Color:=16777215;
       if ReadText=5 then
       begin
        main.BringToFront;
        gg.Enabled:=false;
        main.Enabled:=false;
        door.Enabled:=false;
        image1.Enabled:=false;
        image2.Visible:=true;
        image2.Enabled:=true;

           PassBtn:=Timage.Create(Form1);
       PassBtn.Parent:=Form1;
       PassBtn.Top:=0;
       PassBtn.Left:=0;
       PassBtn.AutoSize:=true;
       PassBtn.OnClick:=@PassClick;
       PassBtn.OnDblClick:=@PassClick;
       PassBtn.OnMouseMove:=@PassMouseMove;
       PassBtn.OnMouseDown:=@PassMouseDown;
        PassBtn.Picture.LoadFromFile(path+'Background/pswbtn.png');
        PassBtn.BringToFront;

           image2.BringToFront;
      //  main.Picture.LoadFromFile(path+'Background/pswbtn.png');
        pswEdit.Visible:=true;
        pswEdit.Enabled:=true;
        Image2.Top:=630;
        Image2.Left:=1150;
         pswEdit.Top:=148;
         pswEdit.Left:=243;
         pswEdit.Height:=88;
         pswEdit.Width:=715;
         pswEdit.SetFocus;
         pswEdit.Caption:='';
         try8:=false;
       end
       else if readtext=3 then r3:=true;
     end;
      15: begin
            Timer2.Enabled:=false;
       Image4.Visible:=false;
       Label1.Visible:=false;
       Label2.Visible:=false;
       GraphMode:=true;
       Graphroom:=1;
       room_update;
      end;
    end;
   end;
end;

procedure TForm1.mainMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  mos.x:=x;
  mos.y:=y;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.pswEditChange(Sender: TObject);
var s:string;i:integer;  l,b:integer;
begin
  case room of
    8: b:=4;
    9: b:=3;
    10: b:=20;
  end;
if chk=false then begin s:=pswEdit.Caption;
 if length(s)>b then delete(s,b+1,(length(s)-b));
 l:=length(s);
 i:=1;
 while i<=l do
 begin
   if (s[i]<>'0') and (s[i]<>'1') and (s[i]<>'2') and (s[i]<>'3') and (s[i]<>'4') and
   (s[i]<>'5') and (s[i]<>'6') and (s[i]<>'7') and (s[i]<>'8') and (s[i]<>'9') then
   begin delete(s,i,1); l:=length(s); end
   else inc(i);
 end;

 pswEdit.Caption:=s;
 pswEdit.SetFocus;
pswEdit.SelStart:=Length(pswEdit.Text);
end
else chk:=false;
{//  form1.Caption:=pswEdit.Text;
case room of
2: if  (pswEdit.Text=pass2) or (pswEdit.Text='IHTG') then
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
end;   }
end;

procedure TForm1.pswEditEnter(Sender: TObject);
var s:string;  a1,a2:longint;   i:integer;
begin
 {    //       Form1.Caption:=passbin;
            s:=pswEdit.Caption;
                Try8:=true;
                if pswEdit.Caption=passbin then
                 begin
                    if Try8=false then begin
              for i:=readtext to 9 do
              begin
              readln(textf,CurrentText);
              end;
              readtext:=10;
            end;
                   pswEdit.Visible:=false;
                   PassBtn.Free;
                   pswEdit.Enabled:=false;
                   door.Picture.Loadfromfile(path+'Background/dooropencut.png');
                    gg.Visible:=true;
                    psw.Free;
        door.Visible:=true;
        image1.Visible:=true;
        main.SendToBack;
                   rmp[8]:=true;
                   xl:=1200;
                   image2.Visible:=false;
                   image2.Enabled:=false;
                 end
                else begin
                     chk:=true;
                     val(passbin,a1);
                     val(s,a2);
          //           showmessage(inttostr(a1)+' '+inttostr(a2));
                     if a1<a2 then  pswEdit.Caption:='меньше'
                     else  pswEdit.Caption:='больше';
                end;   }
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

