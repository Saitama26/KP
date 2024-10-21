unit CustEdit;

interface

uses Vcl.Graphics,Vcl.Dialogs, Vcl.StdCtrls, Vcl.Forms, System.Classes, System.SysUtils;

type
  TMyCustomEdit = class(TEdit)
  public
    triangle,iParam,jParam: Integer;
    editColor:TColor;
  end;

  type mas = array of array of integer;
     arrCustomEdit = array of array of TMyCustomEdit;
     coordinates = array of array of array of integer;
     TKeyPressEvent = procedure(Sender: TObject; var Key: Char) of object;


  procedure FillEdit(board:mas; crd:coordinates; form:TForm ;var arr: arrCustomEdit; func:TNotifyEvent; br1, br2:TColor);
  procedure drawTriangles(Canvas: TCanvas; x,y,SideLength:integer; Form:TForm; mode:boolean = False; Brush:TColor = clwhite);
  function checkEmpty(arr:arrCustomEdit):boolean;
  procedure setNum(arr:arrCustomEdit;num:integer);
  procedure setNumbers(arr:arrCustomEdit; arrNum:mas; num:integer);
  function GetRandomInRange(const MinValue, MaxValue: Integer): Integer;


implementation

function checkEmpty(arr:arrCustomEdit):boolean;
begin
  checkEmpty := True;

  var n:= 0;
  for var i := Low(arr) to High(arr) do
    for var j := Low(arr[i]) to High(arr[i]) do
      if (arr[i,j] <> nil) and (arr[i,j].text = '') then
        checkEmpty := False;
end;


procedure setNumbers(arr:arrCustomEdit; arrNum:mas; num:integer);
begin
  for var i := Low(arr) to High(arr) do
    for var j := Low(arr[i]) to High(arr[i]) do
      if (arr[i,j] <> nil) and (arr[i,j].text <> '') then
        arr[i,j].text := '';

  var n := 0;
  var filled: array[0..7, 0..12] of boolean;
  FillChar(filled, SizeOf(filled), False);

  while n < num do
  begin
    var a:= GetRandomInRange(0,7);
    var b:= GetRandomInRange(0,12);
    if (arr[a,b] <> nil) and (not filled[a,b]) then
    begin
      arr[a,b].text := intToStr(arrNum[a,b]);
      n := n + 1;
      filled[a,b] := True;
    end;
  end;

end;

function GetRandomInRange(const MinValue, MaxValue: Integer): Integer;
begin
  Result := Random(MaxValue - MinValue + 1) + MinValue;
end;

procedure setNum(arr:arrCustomEdit; num:integer);
begin
  for var i := Low(arr) to High(arr) do
    for var j := Low(arr[i]) to High(arr[i]) do
      if (arr[i,j] <> nil) and (arr[i,j].Focused) then
      begin
        arr[i,j].text := intToStr(num);
        break
      end;
end;

procedure FillEdit(board:mas; crd:coordinates; form:Tform; var arr: arrCustomEdit; func:TNotifyEvent; br1, br2:TColor);
begin
  setlength(arr, 8, 13);
  for var i := Low(board) to High(board) do
    for var j := Low(board[i]) to High(board[i]) do
        if board[i,j] <> 0 then
        begin
          arr[i,j] := TMyCustomEdit.Create(form);
          arr[i,j].MaxLength := 1;
          arr[i,j].parent := form;
          arr[i,j].iParam := i;
          arr[i,j].jParam := j;
          arr[i,j].triangle := board[i,j];
          if board[i,j] mod 2 = 0 then
          begin
            arr[i,j].Color := br1;
            arr[i,j].editColor := br1;
          end
          else
          begin
            arr[i,j].Color := br2;
            arr[i,j].editColor := br2;
          end;
          arr[i,j].width := 17;
          arr[i,j].Left := crd[i,j,0];
          arr[i,j].top := crd[i,j,1];
          arr[i,j].font.size := 16;
          arr[i,j].height := 30;
          arr[i,j].BorderStyle := bsnone;
          arr[i,j].Alignment := taCenter;
          arr[i,j].NumbersOnly := True;
          arr[i,j].OnChange := func;
        end
        else
        arr[i,j] := nil;

end;

procedure drawTriangles(Canvas: TCanvas; x,y,SideLength:integer; Form:TForm; mode:boolean; Brush:TColor );
  var x1,y1:integer;
begin
  x1 := x; y1 := y;

  canvas.Brush.Color := brush;

  if mode then
  begin
  for var i := 1 to 3 do
  begin
  Canvas.Polygon([
    Point(x1,y1),
    Point(x1+sideLength, y1),
    Point(x1+Round(sideLength/2), y1 + Round(SideLength * sqrt(3) / 2))
  ]);
  x1 := x1 + sideLength;
  end;

  x1 := x; y1 := y;
  for var i := 1 to 2 do
  begin
    Canvas.Polygon([
      Point(x1+Round(sideLength/2), y1 + Round(SideLength * sqrt(3) / 2)),
      Point(x1+Round(sideLength/2) + sideLength, y1 + Round(SideLength * sqrt(3) / 2)),
      Point(x1+sideLength, y1)
    ]);
    Canvas.Polygon([
      Point(x1+Round(sideLength/2), y1 + Round(SideLength * sqrt(3) / 2)),
      Point(x1+Round(sideLength/2) + sideLength, y1 + Round(SideLength * sqrt(3) / 2)),
      Point(x1+sideLength, y1 + Round(SideLength * sqrt(3) / 2)*2)
    ]);
    x1 := x1 + sideLength;
  end;

  x1 := x; y1 := y;
  Canvas.Polygon([
    Point(x1+sideLength, y1 + Round(SideLength * sqrt(3) / 2)*2),
    Point(x1+sideLength*2, y1 + Round(SideLength * sqrt(3) / 2)*2),
    Point(x1+Round(sideLength/2) + sideLength, y1 + Round(SideLength * sqrt(3) / 2))
  ]);
  Canvas.Polygon([
     Point(x1+sideLength, y1 + Round(SideLength * sqrt(3) / 2)*2),
     Point(x1+sideLength*2, y1 + Round(SideLength * sqrt(3) / 2)*2),
     Point(x1+Round(sideLength/2) + sideLength, y1 + Round(SideLength * sqrt(3) / 2)*3)
  ]);
  end
  else
  begin
    for var i := 1 to 3 do
      begin
        Canvas.Polygon([
          Point(x1 ,y1),
          Point(x1 + sideLength, y1),
          Point(x1 + round(SideLength/2), y1 - Round(SideLength * sqrt(3) / 2))
        ]);
        x1 := x1 + sideLength;
      end;

    x1 := x; y1 := y;
    for var i := 1 to 2 do
      begin
        Canvas.Polygon([
          Point(x1 + round(SideLength/2), y1 - Round(SideLength * sqrt(3) / 2)),
          Point(x1 + round(SideLength/2) + sideLength, y1 - Round(SideLength * sqrt(3) / 2)),
          Point(x1 + sideLength, y1)
        ]);
        Canvas.Polygon([
          Point(x1 + round(SideLength/2), y1 - Round(SideLength * sqrt(3) / 2)),
          Point(x1 + round(SideLength/2) + sideLength, y1 - Round(SideLength * sqrt(3) / 2)),
          Point(x1 + sideLength, y1 - Round(SideLength * sqrt(3) / 2)*2)
        ]);
      x1 := x1 + sideLength;
      end;

    x1 := x; y1 := y;
    Canvas.Polygon([
      Point(x1 + round(SideLength/2) + sideLength, y1 - Round(SideLength * sqrt(3) / 2)*3),
      Point(x1 + sideLength, y1 - Round(SideLength * sqrt(3) / 2)*2),
      Point(x1 + sideLength*2, y1 - Round(SideLength * sqrt(3) / 2)*2)
    ]);
    Canvas.Polygon([
      Point(x1 + round(SideLength/2) + sideLength, y1 - Round(SideLength * sqrt(3) / 2)),
      Point(x1 + sideLength, y1 - Round(SideLength * sqrt(3) / 2)*2),
      Point(x1 + sideLength*2, y1 - Round(SideLength * sqrt(3) / 2)*2)
    ])
  end;
end;
end.
