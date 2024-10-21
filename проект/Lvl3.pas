unit Lvl3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CustEdit, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TForm7 = class(TForm)
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    lives:integer;
    hearts:array of TImage;

  public
    values,board:mas;
    crd:coordinates;
    arr: arrCustomEdit;
    procedure Validate(Sender: TObject);
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

Uses levelSelection, menu;

procedure Tform7.Validate(Sender: TObject);
begin
  var i := (Sender as TMyCustomEdit).iParam;
  var j := (Sender as TMyCustomEdit).jParam;

  if arr[i,j].text = '0' then
    arr[i,j].text := '';

  if (Sender as TMyCustomEdit).text <> '' then
    if arr[i,j].text <> intToStr(values[i,j]) then
    begin
      (Sender as TMyCustomEdit).color := clred;
      lives := lives - 1;
      form8.playThisSound('error_00' + intToStr(GetRandomInRange(2,3)) + '.mp3');
      hearts[lives].picture.LoadFromFile(extractfilepath(application.ExeName) + '\assets\hearts\blackHeart.png');
    end
    else
      (Sender as TMyCustomEdit).color := (Sender as TMyCustomEdit).editColor;
  if lives = 0 then
  begin
    showmessage('Вы проиграли');
    form6.show();
    self.hide;
    lives := 3;
    for var m := 0 to 2 do
      hearts[m].picture.LoadFromFile(extractfilepath(application.ExeName) + '\assets\hearts\redHeart.png');
    setNumbers(arr, values, 30);
  end;

  if (checkEmpty(arr)) and (arr[i,j].text = intToStr(values[i,j]))  then
    begin
    showMessage('Прошел');
    form6.show();
    self.hide;
    lives := 3;
    for var m := 0 to 2 do
      hearts[m].picture.LoadFromFile(extractfilepath(application.ExeName) + '\assets\hearts\redHeart.png');
    setNumbers(arr, values, 30);

  end;
end;

procedure TForm7.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  self.Hide;
  form6.show;
  form8.playThisSound('close_001.mp3');
  lives := 3;
  for var m := 0 to 2 do
    hearts[m].picture.LoadFromFile(extractfilepath(application.ExeName) + '\assets\hearts\redHeart.png');
  setNumbers(arr, values, 30);
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
  self.Color := rgb(255, 183, 183);
  lives := 3;
  hearts := [image10, image11, image12];
  for var i := 0 to 2 do
    hearts[i].picture.LoadFromFile(extractfilepath(application.ExeName) + '\assets\hearts\redHeart.png');

  speedbutton1.Glyph.LoadFromFile(extractfilepath(application.ExeName) + '\assets\LelvelButtons\r1.bmp');
  speedbutton2.Glyph.LoadFromFile(extractfilepath(application.ExeName) + '\assets\LelvelButtons\r2.bmp');
  speedbutton3.Glyph.LoadFromFile(extractfilepath(application.ExeName) + '\assets\LelvelButtons\r3.bmp');
  speedbutton4.Glyph.LoadFromFile(extractfilepath(application.ExeName) + '\assets\LelvelButtons\r4.bmp');
  speedbutton5.Glyph.LoadFromFile(extractfilepath(application.ExeName) + '\assets\LelvelButtons\r5.bmp');
  speedbutton6.Glyph.LoadFromFile(extractfilepath(application.ExeName) + '\assets\LelvelButtons\r6.bmp');
  speedbutton7.Glyph.LoadFromFile(extractfilepath(application.ExeName) + '\assets\LelvelButtons\r7.bmp');
  speedbutton8.Glyph.LoadFromFile(extractfilepath(application.ExeName) + '\assets\LelvelButtons\r8.bmp');
  speedbutton9.Glyph.LoadFromFile(extractfilepath(application.ExeName) + '\assets\LelvelButtons\r9.bmp');


crd := [[ [0,0],  [0,0],  [0,0],  [0,0],  [0,0],  [0,0],  [0,0],  [0,0],  [312,32],  [0,0],  [0,0],  [0,0],  [0,0]],
[ [0,0],  [0,0],  [102,74],  [136,96],  [168,74],  [208,96],  [240,74],  [280,96],  [312,74],  [350,96],  [0,0],  [0,0],  [0,0]],
[ [0,0],  [0,0],  [102,155],  [136,135],  [170,155],  [208,135],  [240,155],  [280,135],  [312,155],  [350,135],  [384,155],  [0,0],  [0,0]],
[ [0,0],  [64,219],  [102,200],  [136,219],  [170,200],  [0,0],  [0,0],  [0,0],  [312,194],  [350,219],  [384,200],  [416,219],  [456,200]],
[ [27,275],  [64,258],  [102,275],  [136,258],  [170,275],  [0,0],  [0,0],  [0,0],  [312,275],  [350,258],  [384,275],  [416,258],  [0,0]],
[ [0,0],  [0,0],  [102,322],  [136,338],  [170,322],  [208,338],  [240,322],  [280,338],  [312,322],  [350,338],  [384,322],  [0,0],  [0,0]],
[ [0,0],  [0,0],  [0,0],  [136,386],  [170,402],  [208,386],  [240,402],  [280,386],  [312,402],  [350,386],  [384,402],  [0,0],  [0,0]],
[ [0,0],  [0,0],  [0,0],  [0,0],  [170,441],  [0,0],  [0,0],  [0,0],  [0,0],  [0,0],  [0,0],  [0,0],  [0,0]]];

board :=  [
  [0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0],
  [0, 0, 2, 2, 2, 2, 2, 3, 3, 3, 0, 0, 0],
  [0, 0, 1, 2, 2, 2, 3, 3, 3, 3, 3, 0, 0],
  [0, 1, 1, 1, 2, 0, 0, 0, 4, 4, 4, 4, 4],
  [1, 1, 1, 1, 1, 0, 0, 0, 5, 4, 4, 4, 0],
  [0, 0, 6, 6, 6, 6, 6, 5, 5, 5, 4, 0, 0],
  [0, 0, 0, 6, 6, 6, 5, 5, 5, 5, 5, 0, 0],
  [0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0]];

values := [
  [0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0],
  [0, 0, 8, 9, 5, 6, 2, 4, 1, 3, 0, 0, 0],
  [0, 0, 2, 4, 1, 3, 7, 5, 6, 9, 8, 0, 0],
  [0, 1, 3, 5, 7, 0, 0, 0, 8, 9, 4, 6, 2],
  [7, 6, 4, 8, 9, 0, 0, 0, 2, 3, 1, 5, 0],
  [0, 0, 9, 3, 6, 4, 2, 5, 1, 8, 7, 0, 0],
  [0, 0, 0, 8, 5, 1, 7, 6, 3, 4, 9, 0, 0],
  [0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0]
];

  filledit(board, crd, self, arr, validate, rgb(255, 67, 67), rgb(241, 138, 138));
  setNumbers(arr, values, 30);
end;

procedure TForm7.FormPaint(Sender: TObject);
begin
  drawTriangles(Canvas, 75, 70, 70, self, True, rgb(255, 67, 67));
  drawTriangles(Canvas, 75+210, 192, 70, self, True, rgb(255, 67, 67));
  drawTriangles(Canvas, 75, 313, 70, self, True, rgb(255, 67, 67));
  drawTriangles(Canvas, 75+140, 192, 70, self, False, rgb(241, 138, 138));
  drawTriangles(Canvas, 75-70, 313, 70, self, False, rgb(241, 138, 138));
  drawTriangles(Canvas, 75+140, 70+365, 70, self, False, rgb(241, 138, 138));

end;

procedure TForm7.SpeedButton1Click(Sender: TObject);
begin
  setNum(arr, (Sender as TSpeedButton).tag);
end;
end.
