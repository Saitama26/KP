{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN NON_PORTABLE_TYPECAST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
{$WARN IMMUTABLE_STRINGS OFF}
unit Lvl1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls,  CustEdit, Vcl.Buttons;

type
  TForm5 = class(TForm)
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
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButtonClick(Sender: TObject);

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
  Form5: TForm5;

implementation

uses levelSelection, menu;

{$R *.dfm}


procedure Tform5.Validate(Sender: TObject);
begin
  var i := (Sender as TMyCustomEdit).iParam;
  var j := (Sender as TMyCustomEdit).jParam;

  if arr[i,j].text = '0' then
    arr[i,j].text := '';

  if (Sender as TMyCustomEdit).text <> '' then
    if arr[i,j].text <> intToStr(values[i,j]) then
    begin
      (Sender as TMyCustomEdit).color := clred;
          form8.playThisSound('error_00' + intToStr(GetRandomInRange(2,3)) + '.mp3');
      lives := lives - 1;
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
    setNumbers(arr, values, 40);
  end;

  if (checkEmpty(arr)) and (arr[i,j].text = intToStr(values[i,j]))  then
  begin
    showMessage('Прошел');
    form6.show();
    self.hide;
    lives := 3;
    for var m := 0 to 2 do
      hearts[m].picture.LoadFromFile(extractfilepath(application.ExeName) + '\assets\hearts\redHeart.png');
    setNumbers(arr, values, 40);

  end;
end;

procedure TForm5.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  form8.playThisSound('close_001.mp3');
  form6.Show;
  self.Hide;
  lives := 3;
    for var m := 0 to 2 do
      hearts[m].picture.LoadFromFile(extractfilepath(application.ExeName) + '\assets\hearts\redHeart.png');
    setNumbers(arr, values, 40);
end;

procedure TForm5.SpeedButtonClick(Sender: TObject);
begin
  setNum(arr, (Sender as TSpeedButton).tag);
end;


procedure TForm5.FormCreate(Sender: TObject);
begin
  self.Color := rgb(189, 224, 255);
  lives := 3;
  hearts := [image10, image11, image12];
  for var i := 0 to 2 do
    hearts[i].picture.LoadFromFile(extractfilepath(application.ExeName) + '\assets\hearts\redHeart.png');

  speedbutton1.Glyph.LoadFromFile(extractfilepath(application.ExeName) + '\assets\LelvelButtons\1.bmp');
  speedbutton2.Glyph.LoadFromFile(extractfilepath(application.ExeName) + '\assets\LelvelButtons\2.bmp');
  speedbutton3.Glyph.LoadFromFile(extractfilepath(application.ExeName) + '\assets\LelvelButtons\3.bmp');
  speedbutton4.Glyph.LoadFromFile(extractfilepath(application.ExeName) + '\assets\LelvelButtons\4.bmp');
  speedbutton5.Glyph.LoadFromFile(extractfilepath(application.ExeName) + '\assets\LelvelButtons\5.bmp');
  speedbutton6.Glyph.LoadFromFile(extractfilepath(application.ExeName) + '\assets\LelvelButtons\6.bmp');
  speedbutton7.Glyph.LoadFromFile(extractfilepath(application.ExeName) + '\assets\LelvelButtons\7.bmp');
  speedbutton8.Glyph.LoadFromFile(extractfilepath(application.ExeName) + '\assets\LelvelButtons\8.bmp');
  speedbutton9.Glyph.LoadFromFile(extractfilepath(application.ExeName) + '\assets\LelvelButtons\9.bmp');


  crd := [
[ [0,0],  [0,0],  [0,0],  [0,0],  [0,0],  [0,0],  [0,0],  [0,0],  [312,32],  [0,0],  [0,0],  [0,0],  [0,0]],
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
  [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0],
  [0, 0, 4, 8, 6, 7, 1, 5, 3, 9, 0, 0, 0],
  [0, 0, 1, 3, 9, 5, 2, 7, 4, 8, 6, 0, 0],
  [0, 7, 9, 8, 2, 0, 0, 0, 6, 3, 4, 5, 1],
  [2, 5, 4, 3, 6, 0, 0, 0, 1, 8, 9, 7, 0],
  [0, 0, 6, 8, 4, 5, 1, 7, 9, 3, 2, 0, 0],
  [0, 0, 0, 9, 3, 7, 2, 5, 6, 4, 8, 0, 0],
  [0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0]
];

  filledit(board, crd, self, arr, validate, rgb(44, 93, 200), rgb(71, 183, 201));
  setNumbers(arr, values, 40);
end;


procedure TForm5.FormPaint(Sender: TObject);
begin
  drawTriangles(Canvas, 75, 70, 70, self, True, rgb(44, 93, 200));
  drawTriangles(Canvas, 75+210, 192, 70, self, True, rgb(44, 93, 200));
  drawTriangles(Canvas, 75, 313, 70, self, True, rgb(44, 93, 200));
  drawTriangles(Canvas, 75+140, 192, 70, self, False, rgb(71, 183, 201));
  drawTriangles(Canvas, 75-70, 313, 70, self, False, rgb(71, 183, 201));
  drawTriangles(Canvas, 75+140, 70+365, 70, self, False, rgb(71, 183, 201));
end;

end.
