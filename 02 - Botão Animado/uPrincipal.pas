unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    btnMover: TButton;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure btnMoverClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    vgPosicao: Boolean;

    procedure IniciarFormulario;
    procedure PosicionarBotao;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

const
  vgIniciar = 'Iniciar';
  vgParar   = 'Parar';

procedure TfrmPrincipal.btnMoverClick(Sender: TObject);
begin
  if btnMover.Caption = vgIniciar then
  begin
    btnMover.Caption := vgParar;
    Timer1.Enabled   := True;
    vgPosicao        := True;
  end
  else
  begin
    btnMover.Caption := vgIniciar;
    Timer1.Enabled   := False;
    vgPosicao        := False;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  IniciarFormulario;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  Timer1.Enabled := False;
end;

procedure TfrmPrincipal.IniciarFormulario;
begin
  btnMover.Caption := vgIniciar;
  Timer1.Enabled   := False;
  PosicionarBotao;
end;

procedure TfrmPrincipal.PosicionarBotao;
begin
  btnMover.Top  := Random(frmPrincipal.ClientHeight - 75);
  btnMover.Left := Random(frmPrincipal.ClientWidth - 75);
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  if vgPosicao then
  begin
    if (btnMover.Left + btnMover.Width) < frmPrincipal.ClientWidth then
      btnMover.Left := btnMover.Left + 1
    else
    begin
      vgPosicao := False;
      PosicionarBotao;
    end;
  end
  else
  begin
    if (btnMover.Top + btnMover.Height) < frmPrincipal.ClientHeight then
      btnMover.Top := btnMover.Top + 1
    else
    begin
      vgPosicao := True;
      PosicionarBotao;
    end;
  end;
end;

end.
