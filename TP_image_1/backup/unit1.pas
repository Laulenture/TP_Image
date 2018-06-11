unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BCarreNoir: TButton;
    BCarreRouge: TButton;
    B4carre: TButton;
    Bbandes: TButton;
    Bechiquier: TButton;
    Ipicture: TImage;
    procedure B4carreClick(Sender: TObject);
    procedure BbandesClick(Sender: TObject);
    procedure BCarreNoirClick(Sender: TObject);
    procedure BCarreRougeClick(Sender: TObject);
    procedure BechiquierClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BCarreNoirClick(Sender: TObject);
begin
  Ipicture.Picture:=nil;

  Ipicture.canvas.brush.color:= clblack;
  Ipicture.canvas.pen.color:= clblack;
  Ipicture.canvas.rectangle(0,0,300,300);
end;

procedure TForm1.B4carreClick(Sender: TObject);
begin
  Ipicture.Picture:=nil;

  Ipicture.canvas.brush.color:= clred;
  Ipicture.canvas.pen.color:= clred;
  Ipicture.canvas.rectangle(0,0,150,150);

  Ipicture.canvas.brush.color:= clyellow;
  Ipicture.canvas.pen.color:= clyellow;
  Ipicture.canvas.rectangle(150,150,300,300);

  Ipicture.canvas.brush.color:= clblue;
  Ipicture.canvas.pen.color:= clblue;
  Ipicture.canvas.rectangle(0,150,150,300);

  Ipicture.canvas.brush.color:= clgray;
  Ipicture.canvas.pen.color:= clgray;
  Ipicture.canvas.rectangle(150,0,300,150);
end;

procedure TForm1.BbandesClick(Sender: TObject);
begin

end;

procedure TForm1.BCarreRougeClick(Sender: TObject);
begin
  Ipicture.Picture:=nil;

  Ipicture.canvas.brush.color:= clred;
  Ipicture.canvas.pen.color:= clred;
  Ipicture.canvas.rectangle(0,0,300,300);
end;

procedure TForm1.BechiquierClick(Sender: TObject);
VAR
  i : INTEGER;
  j : INTEGER;
begin
  for i := 0 to 8 do
     begin
     for j := 0 to 8 do
         begin
         if (i = j) OR (i = j + 2) OR (i = j - 2) OR (i = j + 4) OR (i = j - 4) OR (i = j + 6) OR (i = j - 6) then
            begin
               Ipicture.Canvas.Brush.color := clblack;
               Ipicture.Canvas.Rectangle (i*40,j*40,(i+1)*40,(j+1)*40)
            end
            else
             begin
             Ipicture.Canvas.Brush.color := clwhite;
             Ipicture.Canvas.Rectangle (i*40,j*40,(i+1)*40,(j+1)*40);
             end;
         end;
     end;
end;

end.

