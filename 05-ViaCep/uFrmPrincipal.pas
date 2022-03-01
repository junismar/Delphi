unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinscxPCPainter, dxBarBuiltInMenu, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, cxPC, IPPeerClient, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, System.JSON, uRotinas;

type
  TfrmPrincipal = class(TForm)
    cxPageControl1: TcxPageControl;
    tbsEndereco: TcxTabSheet;
    lblLogradouro: TLabel;
    lblBairro: TLabel;
    lblEstado: TLabel;
    lblCidade: TLabel;
    edtLogradouro: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    cbEstado: TComboBox;
    Panel1: TPanel;
    edtMaskCep: TMaskEdit;
    lblCEP: TLabel;
    btnPesquisar: TBitBtn;
    cxPageControl2: TcxPageControl;
    cxTabSheet2: TcxTabSheet;
    mmComplemento: TMemo;
    btnLimpar: TBitBtn;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;
    MemTable: TFDMemTable;
    procedure FormShow(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    function ValidarCEP(vpCEP: string): Boolean;
    procedure CarregarCEP(vpCEP: string);
    procedure LimparCampos(vpTodos: Boolean);

  public

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnLimparClick(Sender: TObject);
begin
  LimparCampos(True);
end;

procedure TfrmPrincipal.btnPesquisarClick(Sender: TObject);
begin
  if ValidarCep(edtMaskCep.Text) then
    CarregarCEP(edtMaskCep.Text);
end;

procedure TfrmPrincipal.CarregarCEP(vpCEP: string);
var
  viJson: TJSONObject;
begin
  LimparCampos(False);
  vpCEP := TRotinas.RetornaNumero(vpCEP);

  RESTRequest.Resource := vpCEP + '/json';
  RESTRequest.Execute;

  if RESTRequest.Response.StatusCode <> 200 then
  begin
    ShowMessage('Erro ao consultar CEP!');
    Exit;
  end;

  if RESTRequest.Response.Content.IndexOf('erro') > 0 then
    ShowMessage('CEP não encontrado!')
  else
  begin

    {
    // Com TFDMenTable achei mais prático!

      edtLogradouro.Text := MemTable.FieldByName('logradouro').AsString;
      edtBairro.Text     := MemTable.FieldByName('bairro').AsString;
      edtCidade.Text     := MemTable.FieldByName('localidade').AsString;
      mmComplemento.Lines.Add(MemTable.FieldByName('complemento').AsString);
      cbEstado.Text      := MemTable.FieldByName('uf').AsString;
    }

    viJson := RESTRequest.Response.JSONValue as TJSONObject;

    if not Assigned(viJson) then
      Exit;

    try
      edtLogradouro.Text := viJson.values['logradouro'].value;
      edtBairro.Text     := viJson.values['bairro'].value;
      edtCidade.Text     := viJson.values['localidade'].value;
      mmComplemento.Lines.Add(viJson.values['complemento'].value);
      cbEstado.ItemIndex := cbEstado.Items.IndexOf(viJson.values['uf'].value);
    finally
       viJson := nil;
    end;
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  edtMaskCep.SetFocus;
end;

procedure TfrmPrincipal.LimparCampos(vpTodos: Boolean);
  procedure LimparCamposEndereco;
  begin
    edtLogradouro.Clear;
    edtBairro.Clear;
    edtCidade.Clear;
    cbEstado.ItemIndex := -1;
    mmComplemento.Lines.Clear;
  end;
begin
  if vpTodos then
  begin
    edtMaskCep.Clear;
    LimparCamposEndereco;
    edtMaskCep.SetFocus;
  end
  else
    LimparCamposEndereco;
end;

function TfrmPrincipal.ValidarCEP(vpCEP: string): Boolean;
begin
  Result := False;

  vpCEP := TRotinas.RetornaNumero(vpCEP);

  if (vpCEP = EmptyStr) or (Length(vpCEP) <> 8) then
    Exit;

  Result := True;
end;

end.
