program Hoshi;





uses
  Vcl.Forms,
  Lvl1 in 'Lvl1.pas' {Form5},
  loadWnd in 'loadWnd.pas' {Form4},
  levelSelection in 'levelSelection.pas' {Form6},
  CustEdit in 'CustEdit.pas',
  Lvl2 in 'Lvl2.pas' {Form1},
  Lvl3 in 'Lvl3.pas' {Form7},
  menu in 'menu.pas' {Form8};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := False;
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.Run;
end.
