unit loadWnd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TForm4 = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Timer2: TTimer;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
      FCurrentLabel:integer;
      FFormAlpha:byte;
  public
  end;

var
  Form4: TForm4;
  x,y:real;

implementation

uses LevelSelection;

{$R *.dfm}


procedure TForm4.FormCreate(Sender: TObject);
begin
  FCurrentLabel := 0 ;
  Label1.font.color := $d0b209;
  Label2.font.color := $d0b209;
  label3.font.color := $d0b209;
  label4.font.color := $d0b209;
  label5.font.color := $d0b209;
  label6.font.color := $d0b209;
  FFormAlpha := 0;
  Self.AlphaBlend := True;
  Self.AlphaBlendValue := FFormAlpha;
end;

procedure TForm4.Timer1Timer(Sender: TObject);
begin
  case FCurrentLabel of
    5:
      begin
        Label1.Visible := True;
      end;
    6:
      begin
        Label2.Visible := True;
      end;
    7:
      begin
        Label3.Visible := True;

      end;
    8:
      begin
        Label4.Visible := True;
      end;
    9:
      begin
        Label5.Visible := True;
      end;
    10:
      begin
        Label6.Visible := True;
      end;
  end;

  Inc(FCurrentLabel);
  if FCurrentLabel > 12 then
  begin
    Timer1.Enabled := False;
    Form6.show;
    Form4.hide;
  end;
end;

procedure TForm4.Timer2Timer(Sender: TObject);
begin
  Inc(FFormAlpha, 5);
  Self.AlphaBlendValue := FFormAlpha;

  if FFormAlpha = 255 then
    Timer2.Enabled := False;
end;

end.
