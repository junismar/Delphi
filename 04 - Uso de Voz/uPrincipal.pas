unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB, Datasnap.DBClient,
  Vcl.OleServer, SpeechLib_TLB, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    lbl_voz: TLabel;
    lbl_veloc: TLabel;
    lbl_pos: TLabel;
    tbRate: TTrackBar;
    btnOuvir: TButton;
    cbx_voz: TComboBox;
    PageControl1: TPageControl;
    tbPrincipal: TTabSheet;
    tbSecundaria: TTabSheet;
    rch_obs: TRichEdit;
    dbg_cadastro: TDBGrid;
    nvg_cadastro: TDBNavigator;
    cds_cadastro: TClientDataSet;
    cds_cadastronome: TStringField;
    cds_cadastroendereco: TStringField;
    cds_cadastrotelefone: TStringField;
    cds_cadastrodtCadastro: TDateField;
    dsCadastro: TDataSource;
    SpVoice: TSpVoice;
    Panel1: TPanel;
    btnLimpar: TBitBtn;
    btnOuvirRich: TButton;
    Panel2: TPanel;
    btnLimparDataset: TBitBtn;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbx_vozChange(Sender: TObject);
    procedure tbRateChange(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnLimparDatasetClick(Sender: TObject);
    procedure btnOuvirRichClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnLimparClick(Sender: TObject);
begin
  rch_obs.Lines.Clear;
end;

procedure TfrmPrincipal.btnLimparDatasetClick(Sender: TObject);
begin
  while not cds_cadastro.Eof do
  begin
    cds_cadastro.First;
    cds_cadastro.Delete;
  end;
end;

procedure TfrmPrincipal.btnOuvirRichClick(Sender: TObject);
begin
  SpVoice.Skip('Sentence', MaxInt);

  if Length(Trim(rch_obs.Lines.Text)) = 0 then
  begin
    SpVoice.Speak('Não há dados cadastrado para a leitura!', SVSFlagsAsync);
    Exit;
  end;

  SpVoice.Speak(rch_obs.Text, SVSFlagsAsync);
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  SpVoice.Skip('Sentence', MaxInt);

  if cds_cadastro.IsEmpty then
  begin
    SpVoice.Speak('Não há dados cadastrado para a leitura!', SVSFlagsAsync);
    Exit;
  end;

  SpVoice.Speak('nome', SVSFlagsAsync);
  if cds_cadastronome.AsString <> '' then
    SpVoice.Speak(cds_cadastronome.AsString, SVSFlagsAsync)
  else
    SpVoice.Speak('não informado!', SVSFlagsAsync);

  SpVoice.Speak('endereço', SVSFlagsAsync);
  if cds_cadastroendereco.AsString <> '' then
    SpVoice.Speak(cds_cadastroendereco.AsString, SVSFlagsAsync)
  else
    SpVoice.Speak('não informado!', SVSFlagsAsync);

  SpVoice.Speak('telefone', SVSFlagsAsync);
  if cds_cadastrotelefone.AsString <> '' then
    SpVoice.Speak(cds_cadastrotelefone.AsString, SVSFlagsAsync)
  else
    SpVoice.Speak('não informado!', SVSFlagsAsync);

  SpVoice.Speak('data de cadastro', SVSFlagsAsync);
  if cds_cadastrodtCadastro.AsString <> '' then
    SpVoice.Speak(cds_cadastrodtCadastro.AsString, SVSFlagsAsync)
  else
    SpVoice.Speak('não informada!', SVSFlagsAsync);
end;

procedure TfrmPrincipal.cbx_vozChange(Sender: TObject);
var
  soToken: ISpeechObjectToken;
begin
  soToken := ISpeechObjectToken(
    Pointer(
      cbx_voz.Items.Objects[cbx_voz.ItemIndex]
    )
  );

  SpVoice.Voice := soToken;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  i: Integer;
  soTokens: ISpeechObjectTokens;
  soToken: ISpeechObjectToken;
begin

  SpVoice.EventInterests := SVEAllEvents;
  soTokens := SpVoice.GetVoices('', '');

  for i := 0 to soTokens.Count - 1 do
  begin
    soToken := soTokens.Item(i);
    cbx_voz.Items.AddObject(
      soToken.GetDescription(0),
      TObject(soToken));
    soToken._AddRef;
  end;

  if cbx_voz.Items.Count > 0 then
  begin
    cbx_voz.ItemIndex := 0;
    cbx_voz.OnChange(cbx_voz);
  end;

  tbRate.Position := SpVoice.Rate;
  lbl_pos.Caption := IntToStr(tbRate.Position);

  with cds_cadastro do
  begin
    insert;
    FieldByName('NOME').AsString := 'Junismar Alves Miranda';
    FieldByName('ENDERECO').AsString := 'Avenida 01 lote 01 quadra 01';
    FieldByName('TELEFONE').AsString := '(62)99329-8920';
    FieldByName('DTCADASTRO').AsDateTime := Now;
    post;
  end;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
var
  i: integer;
begin
//  for i := 0 to cbx_voz.Items.Count -1 do
//    ISpeechObjectToken(Pointer(cbx_voz.Items.Objects[i]))._Release;
  cds_cadastro.Close;
end;

procedure TfrmPrincipal.tbRateChange(Sender: TObject);
begin
  SpVoice.Skip('sentence', MaxInt);
  SpVoice.Rate := tbRate.Position;
  lbl_pos.Caption := IntToStr(tbRate.Position);
end;

end.
