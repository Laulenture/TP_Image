unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Bpixel: TButton;
    Bsuperpos: TButton;
    Bmasque: TButton;
    Bmorphing: TButton;
    Breset: TButton;
    Itemp1: TImage;
    Ipicture: TImage;
    Itemp2: TImage;
    procedure BmasqueClick(Sender: TObject);
    procedure BmorphingClick(Sender: TObject);
    procedure BpixelClick(Sender: TObject);
    procedure BsuperposClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
    Ipicture.Picture.LoadFromFile('1.bmp');
end;

procedure TForm1.BpixelClick(Sender: TObject);
VAR
    cptx,cpty: integer;
begin
    FormCreate(Sender);
    FOR cpty := 0 TO Ipicture.Height DO
    begin
        FOR cptx := 0 TO Ipicture.Width DO
        begin
            IF ((cptx MOD 2 <> 0) AND (cpty MOD 2 = 0)) THEN
               Ipicture.Canvas.Pixels[cptx,cpty] := Ipicture.Canvas.Pixels[cptx-1,cpty]
            ELSE
            begin
                IF ((cptx MOD 2 = 0) AND (cpty MOD 2 <> 0)) THEN
                    Ipicture.Canvas.Pixels[cptx,cpty] := Ipicture.Canvas.Pixels[cptx,cpty-1]
                ELSE
                begin
                    IF ((cptx MOD 2 <> 0) AND (cpty MOD 2 <> 0)) THEN
                        Ipicture.Canvas.Pixels[cptx,cpty] := Ipicture.Canvas.Pixels[cptx-1,cpty-1];
                end;
            end;
        end;
    end;

    FOR cpty := 0 TO Ipicture.Height DO
    begin
        FOR cptx := 0 TO Ipicture.Width DO
        begin
            Ipicture.Canvas.Pixels[(cptx DIV 2),(cpty DIV 2)] := Ipicture.Canvas.Pixels[cptx,cpty];
            IF NOT((cptx <= (Ipicture.Width DIV 2)) AND (cpty <= (Ipicture.Height DIV 2))) THEN Ipicture.Canvas.Pixels[cptx,cpty] := clWhite;
        end;
    end;
    {FOR cpty := 0 TO Ipicture.Height DO
    begin
        FOR cptx := 0 TO Ipicture.Witdh DO
        begin
            Ipicture.Canvas.Pixels[cptx,cpty] := clWhite;
        end;
    end;}
end;

procedure TForm1.BmasqueClick(Sender: TObject);
VAR
    cptx,cpty: integer;
begin
    FormCreate(Sender);
    Itemp1.Picture.LoadFromFile('3.bmp');
    Itemp2.Picture.LoadFromFile('2.bmp');
    FOR cpty := 0 TO Ipicture.Height DO
    begin
        FOR cptx := 0 TO Ipicture.Height DO
        begin
            IF (Itemp1.Canvas.Pixels[cptx,cpty] <> Itemp1.Canvas.Pixels[0,0]) THEN
                Ipicture.Canvas.Pixels[cptx,cpty] := Itemp2.Canvas.Pixels[cptx,cpty];
        end;
    end;
end;

procedure TForm1.BmorphingClick(Sender: TObject);
VAR
    cptx,cpty: integer;
begin

end;

procedure TForm1.BsuperposClick(Sender: TObject);
VAR
    cptx,cpty: integer;
begin
    FormCreate(Sender);
    Itemp1.Picture.LoadFromFile('3.bmp');
    FOR cpty := 0 TO Ipicture.Height DO
    begin
        FOR cptx := 0 TO Ipicture.Height DO
        begin
            IF (Itemp1.Canvas.Pixels[cptx,cpty] <> Itemp1.Canvas.Pixels[0,0]) THEN
                Ipicture.Canvas.Pixels[cptx,cpty] := Itemp1.Canvas.Pixels[cptx,cpty];
        end;
    end;
end;

end.

