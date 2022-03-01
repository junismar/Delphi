unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    btnSomar: TButton;
    btnSubtrair: TButton;
    btnMultiplicar: TButton;
    btnDividir: TButton;
    lblValorX: TLabel;
    edtValorX: TEdit;
    lblValorY: TLabel;
    edtValorY: TEdit;
    edtResultado: TEdit;
    lblResultado: TLabel;
    procedure btnSomarClick(Sender: TObject);
    procedure btnSubtrairClick(Sender: TObject);
    procedure btnMultiplicarClick(Sender: TObject);
    procedure btnDividirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Somar(
      const vpX: Double;
      const vpY: Double
    ): Double;

    function Subtrair(
      const vpX: Double;
      const vpY: Double
    ): Double;

    function Multiplicar(
      const vpX: Double;
      const vpY: Double
    ): Double;

    function Dividir(
      const vpX: Double;
      const vpY: Double
    ): Double;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

{ TForm1 }


{ TForm1 }

procedure TfrmPrincipal.btnDividirClick(Sender: TObject);
begin
  edtResultado.Text := FloatToStr(
    Dividir(
      StrToFloat(edtValorX.Text),
      StrToFloat(edtValorY.Text)
    )
  );
end;

procedure TfrmPrincipal.btnMultiplicarClick(Sender: TObject);
begin
  edtResultado.Text := FloatToStr(
    Multiplicar(
      StrToFloat(edtValorX.Text),
      StrToFloat(edtValorY.Text)
    )
  );
end;

procedure TfrmPrincipal.btnSomarClick(Sender: TObject);
begin
  edtResultado.Text := FloatToStr(
    Somar(
      StrToFloat(edtValorX.Text),
      StrToFloat(edtValorY.Text)
    )
  );
end;

procedure TfrmPrincipal.btnSubtrairClick(Sender: TObject);
begin
  edtResultado.Text := FloatToStr(
    Subtrair(
      StrToFloat(edtValorX.Text),
      StrToFloat(edtValorY.Text)
    )
  );
end;

function TfrmPrincipal.Dividir(const vpX, vpY: Double): Double;
begin
  Result := vpX / vpY;
end;

function TfrmPrincipal.Multiplicar(const vpX, vpY: Double): Double;
begin
  Result := vpX * vpY;
end;

function TfrmPrincipal.Somar(const vpX, vpY: Double): Double;
begin
  Result := vpX + vpY;
end;

function TfrmPrincipal.Subtrair(const vpX, vpY: Double): Double;
begin
  Result := vpX - vpY;
end;

end.
