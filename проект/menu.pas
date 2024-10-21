unit menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.Buttons;

type
  TForm8 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image2MouseLeave(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure playThisSound(soundname:string);
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}
uses levelSelection;

procedure TForm8.FormCreate(Sender: TObject);
begin
  image1.Picture.LoadFromFile(extractfilepath(application.ExeName) + 'assets\settings\settings2.png');
  image3.Picture.LoadFromFile(extractfilePath(application.ExeName) + 'assets\settings\speaker.png');
  image4.Picture.LoadFromFile(extractfilePath(application.ExeName) + 'assets\settings\musik.png');

end;

procedure TForm8.Image2Click(Sender: TObject);
begin
  self.playThisSound('close_001.mp3');
  self.close;
end;

procedure TForm8.Image2MouseEnter(Sender: TObject);
begin
  (Sender as TImage).Cursor := crHandPoint;
end;

procedure TForm8.Image2MouseLeave(Sender: TObject);
begin
  (Sender as TImage).Cursor := crDefault;
end;

procedure TForm8.Image3Click(Sender: TObject);
begin
  if isSounds then
    begin
      image3.Picture.LoadFromFile(extractfilePath(application.ExeName) + 'assets\settings\mute.png');
      IsSounds := false;
    end
  else
    begin
      image3.Picture.LoadFromFile(extractfilePath(application.ExeName) + 'assets\settings\speaker.png');
      IsSounds := true;
    end;

end;

procedure TForm8.Image4Click(Sender: TObject);
begin
  if isMusikAllowed then
    begin
      image4.Picture.LoadFromFile(extractfilePath(application.ExeName) + 'assets\settings\musikMute.png');
      isMusikAllowed := False;
      form6.MediaPlayer1.Stop;
    end
  else
    begin
      image4.Picture.LoadFromFile(extractfilePath(application.ExeName) + 'assets\settings\musik.png');
      isMusikAllowed := True;
      form6.MediaPlayer1.Play;
    end;
end;

procedure TForm8.playThisSound(soundname:string);
 begin
    if isSounds then
    begin
      Form6.MediaPlayer2.FileName := extractfilepath(application.ExeName) + '\sounds\' + soundname;
      Form6.MediaPlayer2.Open();
      Form6.MediaPlayer2.Play();
    end;
 end;

end.
