unit uRotinas;

interface

uses
  System.SysUtils;

type
 TRotinas = class
   public
     class function RetornaNumero(vpValor: string): string;
     class function FormatarCEP(vpCEP: string): string;
 end;

implementation

{ TRotinas }

class function TRotinas.FormatarCEP(vpCEP: string): string;
begin
  vpCEP := RetornaNumero(vpCEP);

  if vpCEP = EmptyStr then
    Result := vpCEP
  else
    if vpCEP.Length = 8 then
      Result := Copy(vpCEP, 1, 5) + '-' +
                Copy(vpCEP, 6, 3);
end;

class function TRotinas.RetornaNumero(vpValor: string): string;
var
  i: Integer;
begin
  Result := '';

  for i := 1 to Length(vpValor) do
    if CharInSet(vpValor[i], ['0'..'9']) then
       Result := Result + vpValor[i];
end;

end.
