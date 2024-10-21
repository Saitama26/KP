unit levelSelection;

interface

uses
  ShellAPI, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.GIFImg, Vcl.Imaging.pngimage, Vcl.Buttons,
  Vcl.MPlayer;

type
  TForm6 = class(TForm)
    Timer1: TTimer;
    Image5: TImage;
    Image6: TImage;
    Timer2: TTimer;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Timer3: TTimer;
    Timer4: TTimer;
    Image3: TImage;
    Image4: TImage;
    Image10: TImage;
    Image11: TImage;
    Image1: TImage;
    Image2: TImage;
    Image12: TImage;
    Image13: TImage;
    MediaPlayer1: TMediaPlayer;
    MediaPlayer2: TMediaPlayer;
    Image14: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Image6MouseEnter(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Image6MouseLeave(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image8MouseEnter(Sender: TObject);
    procedure Image8MouseLeave(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Image1MouseEnter(Sender: TObject);
    procedure Image1MouseLeave(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure MediaPlayer1Notify(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image14Click(Sender: TObject);

  private procedure WMHotkey( var msg: TWMHotkey ); message WM_HOTKEY;
  public
  top1, top2:integer;
  end;

var
  Form6: TForm6;
  curTime:integer;
  isMusicWas:boolean;
  isMusikAllowed:bool;
  isSounds:bool;

implementation

{$R *.dfm}
uses loadWnd, Lvl1, Lvl2, lvl3, menu;

procedure TForm6.WMHotkey( var msg: TWMHotkey );
begin
  if (msg.hotkey = 1) then
  begin
    image1.Visible := False;
    image2.Visible := False;
    image3.Visible := False;
    image4.Visible := False;
    image10.Visible := False;
    image11.Visible := False;
    Image12.Visible := False;
    image13.Visible := True;
    image6.Visible := True;
    image7.Visible := True;
    image8.Visible := True;
    image9.Visible := True;
  end;
end;



procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  UnRegisterHotkey( self.Handle, 1 )
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  if not RegisterHotkey(self.Handle, 1, 0, VK_ESCAPE) then
      ShowMessage('Unable to assign ESCAPE as hotkey.');

   isMusicWas  := false;
   isMusikAllowed := True;
   IsSounds := True;
   top1 := image6.top;
   top2 := image8.top;

  image5.Picture.LoadFromFile(extractfilepath(application.ExeName) + 'assets\levelSelection\lvlsel.png');
  image6.Picture.LoadFromFile(extractfilepath(application.ExeName) + 'assets\levelSelection\btnlvlsel.png');
  image8.Picture.LoadFromFile(extractfilepath(application.ExeName) + 'assets\levelSelection\exitBtn.png');
  image7.Picture.LoadFromFile(extractfilepath(application.ExeName) + 'assets\levelSelection\shadow.png');
  image9.Picture.LoadFromFile(extractfilepath(application.ExeName) + 'assets\levelSelection\shadow.png');
  image1.Picture.LoadFromFile(extractfilepath(application.ExeName) + 'assets\levelSelection\lvl1.png');
  image2.Picture.LoadFromFile(extractfilepath(application.ExeName) + 'assets\levelSelection\lvl2.png');
  image3.Picture.LoadFromFile(extractfilepath(application.ExeName) + 'assets\levelSelection\lvl3.png');
  image4.Picture.LoadFromFile(extractfilepath(application.ExeName) + 'assets\levelSelection\lvl1descr.png');
  image10.Picture.LoadFromFile(extractfilepath(application.ExeName) + 'assets\levelSelection\lvl2descr.png');
  image11.Picture.LoadFromFile(extractfilepath(application.ExeName) + 'assets\levelSelection\lvl3descr.png');
  image12.Picture.LoadFromFile(extractfilepath(application.ExeName) + 'assets\levelSelection\btnBack.png');
  image13.Picture.LoadFromFile(extractFilePath(application.ExeName) + 'assets\levelSelection\settings.png');
  image14.Picture.LoadFromFile(extractFilePath(application.ExeName) + 'assets\levelSelection\question.png');

  Timer1.Enabled := false;
  timer2.enabled := false;
  timer3.Enabled := false;
  timer4.Enabled := false;
end;


procedure TForm6.FormShow(Sender: TObject);
begin
  if (isMusikAllowed) and not(isMusicwas) then
  begin
    ismusicwas:=true;
    mediaPlayer1.FileName := extractFilePath(application.ExeName) +  'sounds\puzzle-1-b.mp3';
    mediaPlayer1.Open;
    mediaPlayer1.Play;
end;
end;

procedure TForm6.Image6Click(Sender: TObject);
begin
  image1.Visible := True;
  image2.Visible := True;
  image3.Visible := True;
  image4.Visible := True;
  image10.Visible := True;
  image11.Visible := True;
  image12.visible := True;
  image6.Visible := False;
  image7.Visible := False;
  image8.Visible := False;
  image9.Visible := False;
  image13.Visible := False;
  image14.Visible := False;
  Form8.playThisSound('toggle_001.mp3')
end;

procedure TForm6.Image6MouseEnter(Sender: TObject);
begin
  image6.Cursor := crhandPoint;
  timer1.Enabled := True;
  timer2.Enabled := False;
end;

procedure TForm6.Image6MouseLeave(Sender: TObject);
begin
  image6.cursor := crDefault;
  timer2.Enabled := True;
  timer1.Enabled := False;
end;

procedure TForm6.Image8Click(Sender: TObject);
begin
  Form8.playThisSound('close_001.mp3');
  application.Terminate;
end;

procedure TForm6.Image8MouseEnter(Sender: TObject);
begin
  image8.Cursor := crhandPoint;
  timer3.Enabled := True;
  timer4.Enabled := False;
end;

procedure TForm6.Image8MouseLeave(Sender: TObject);
begin
  image8.cursor := crDefault;
  timer4.Enabled := True;
  timer3.Enabled := False;
end;

procedure TForm6.MediaPlayer1Notify(Sender: TObject);
begin
  if MediaPlayer1.NotifyValue = nvSuccessful  then
  begin
      MediaPlayer1.Play;
  end;
end;

procedure TForm6.Image12Click(Sender: TObject);
begin
  form8.playThisSound('bong_001.mp3');
  image1.Visible := False;
  image2.Visible := False;
  image3.Visible := False;
  image4.Visible := False;
  image10.Visible := False;
  image11.Visible := False;
  Image12.Visible := False;
  image6.Visible := True;
  image7.Visible := True;
  image8.Visible := True;
  image9.Visible := True;
  Image13.Visible := True;
  image14.Visible := True;
end;

procedure TForm6.Image13Click(Sender: TObject);
begin
  Form8.playThisSound('toggle_001.mp3');
  form8.showmodal;
end;

procedure TForm6.Image14Click(Sender: TObject);
begin
  ShellExecute(0, PChar ('Open'), PChar (extractfilePath(application.ExeName) + 'manual\manualOfProject3.chm'), nil, nil, SW_SHOW);
end;

procedure TForm6.Image1Click(Sender: TObject);
begin
  form8.playThisSound('scratch_003.mp3');
  form5.Show;
  self.Hide;
end;

procedure TForm6.Image1MouseEnter(Sender: TObject);
begin
  (Sender as TImage).Cursor := crHandPoint;
end;

procedure TForm6.Image1MouseLeave(Sender: TObject);
begin
  (Sender as TImage).Cursor := crDefault;
end;

procedure TForm6.Image2Click(Sender: TObject);
begin
  form8.playThisSound('scratch_003.mp3');
  Form1.show;
  self.hide;
end;

procedure TForm6.Image3Click(Sender: TObject);
begin
  form8.playThisSound('scratch_003.mp3');
  Form7.show;
  self.hide;
end;

procedure TForm6.Timer1Timer(Sender: TObject);
begin
  if image6.top >= top1 + 3 then
    timer1.Enabled := False;
  image6.top := image6.top + 1;

end;
procedure TForm6.Timer2Timer(Sender: TObject);
begin
  if image6.top <= top1 then
    timer2.Enabled := False;
  image6.top := image6.top - 1;
end;

procedure TForm6.Timer3Timer(Sender: TObject);
begin
  if image8.top >= top2+4 then
    timer3.Enabled := False;
  image8.top := image8.top + 1;
end;

procedure TForm6.Timer4Timer(Sender: TObject);
begin
  if image8.top <= top2+2 then
    timer4.Enabled := False;
  image8.top := image8.top - 1;
end;

end.
