unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.JSON;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    Button3: TButton;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure CriarJSON;
    procedure LerJSON;
    procedure LimparMemo;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  CriarJSON;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  LerJSON;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  LimparMemo;
end;

procedure TForm1.CriarJSON;
var
  jsonObjPedido, jsonObjItem: TJSONObject;
  jsonArrayItem, jsonArrayPed: TJSONArray;
  x, y: Integer;
begin
  LimparMemo;
  try
    jsonArrayPed := TJSONArray.Create;

    // Pedidos
    for x := 1 to 4 do
    begin
      jsonObjPedido := TJSONObject.Create;
      jsonObjPedido.AddPair('pedido', x.ToString);
      jsonObjPedido.AddPair('cliente', 'Junior');
      jsonObjPedido.AddPair('total', TJSONNumber.Create(500.50));
      jsonObjPedido.AddPair('pendente', 'Sim');

      // Itens
      jsonArrayItem := TJSONArray.Create;
      for y := 1 to 2 do
      begin
        jsonObjItem := TJSONObject.Create;
        jsonObjItem.AddPair('produto', y.ToString);
        jsonObjItem.AddPair('descricao', 'Produto A' + y.ToString);
        jsonObjItem.AddPair('qtd', TJSONNumber.Create(y));

        jsonArrayItem.AddElement(jsonObjItem);
      end;
      jsonObjPedido.AddPair('itens', jsonArrayItem);
      jsonArrayPed.AddElement(jsonObjPedido);
    end;

    Memo1.Lines.Add(jsonArrayPed.ToString);
  finally
    jsonArrayPed.DisposeOf;
  end;
end;

procedure TForm1.LerJSON;
var
  arrayPed, arrayItem: TJSONArray;
  json: string;
  x, j: Integer;
begin
  if Memo1.Lines.Count = 0 then
  begin
    ShowMessage('Primeiro crie o JSON!');
    Exit;
  end;

  json := Memo1.Lines.Text;
  LimparMemo;

  arrayPed := TJsonobject.ParseJSONValue(
    TEncoding.UTF8.GetBytes(json), 0) as TJSONArray;

  for x := 0 to arrayPed.Size -1 do
  begin
    Memo1.Lines.Add('Pedido:' + arrayPed.Get(x).GetValue<Integer>('pedido', 0).ToString);
    Memo1.Lines.Add('Cliente:' + arrayPed.Get(x).GetValue<string>('cliente', ''));
    Memo1.Lines.Add('Total:' + arrayPed.Get(x).GetValue<string>('total', ''));

    ArrayItem := ArrayPed.Get(x).GetValue<TJsonArray>('itens');

    for j := 0 to arrayItem.Size - 1 do
    begin
      Memo1.Lines.Add('Produto' + arrayItem.Get(j).GetValue<string>('produto', ''));
      Memo1.Lines.Add('Qtd' + arrayItem.Get(j).GetValue<Integer>('qtd', 0).ToString);
    end;
  end;
  arrayPed.DisposeOf;
end;

procedure TForm1.LimparMemo;
begin
  Memo1.Lines.Clear;
end;

end.
