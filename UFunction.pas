unit UFunction;

interface

uses StrUtils, SysUtils, Classes;

function NahCataloga(direct: string):string;
function HexToFloat(Hex: string): Single;
function EncodeDataTem_104(var mass: TStrings; adr, incAdr:integer;
  vid: string): string;
function NumStrToBCD(const inStr: PChar): TBytes;

implementation

function NahCataloga(direct: string):string;
begin
  direct := ReverseString(direct);
  Delete(direct, 1, Pos('\', direct)-1);
  Result := ReverseString(direct);
end;

function HexToFloat(Hex: string): Single;
  function IntToBinFloat(Value: Integer; var Float: Single): string;
    function LayerFunc(Bin: string): Single;
    var
      SomeVar: Byte;
    begin
      SomeVar := StrToInt(Bin[1]);
    end;
  var
    i: Integer;
  begin
    Result := '';
    for i := 31 downto 0 do
      if Value and (1 shl i) <> 0 then
        Result := Result + '1'
      else
        Result := Result + '0';
        Float := LayerFunc(Result);
  end;
begin
 try
   IntToBinFloat(StrToInt('$' + Hex), Result);
 except
   Result := 0.0
 end;
end;

function EncodeDataTem_104(var mass: TStrings; adr, incAdr:integer;
  vid: string): string;
var
  countByte: integer;
  i: integer;
  str: string;
begin
  adr := adr + incAdr;

  if (Pos('F', vid) <> 0) or (Pos('L', vid) <> 0) then
    countByte := 4
  else
    if Pos('I', vid) <> 0 then
      countByte := 2
    else
      countByte := 1;

  if Pos('[', vid) <> 0 then
    adr := adr + countByte*(StrToInt(Copy(vid,Pos('[',vid)+1,1))-1);

  str := '';

  if (Pos('L', vid) <> 0) or (Pos('I', vid) <> 0) then
    begin
      if Pos('not', vid) = 0 then
        for i := adr + countByte - 1  downto adr do
          str := str + IntToHex(StrToInt(mass.Strings[i]), 2)
      else
        for i := adr to adr + countByte - 1 do
          str := str + IntToHex(StrToInt(mass.Strings[i]), 2);
      Result := IntToStr(StrToInt('$' + str))
    end
  else
    if Pos('BCD', vid) <> 0 then
      begin
        str := IntToHex(StrToInt(mass.Strings[adr]), 2);
        Result := str
      end
    else
      if Pos('F', vid) <> 0 then
        begin
          if Pos('not', vid) <> 0 then
            for i := adr + countByte - 1  downto adr do
              str := str + IntToHex(StrToInt(mass.Strings[i]), 2)
          else
            for i := adr  to adr + countByte - 1 do
              str := str + IntToHex(StrToInt(mass.Strings[i]), 2);

            Result := FloatToStr(HexToFloat(str));
        end
      else     //C - Char
        begin
          str := IntToHex(StrToInt(mass.Strings[adr]), 2);
          Result := IntToStr(StrToInt('$' + str));
        end;
end;

function NumStrToBCD(const inStr: PChar): TBytes;
  function Pack(ch1, ch2: Char): byte;
  begin
    Result := (Ord(ch1) and $F) or ((Ord(ch2) and $F) shl 4)
  end;
var
  i: Integer;
begin
    if Odd(Length(inStr)) then
      Result := NumStrToBCD(PChar('0' + String(instr)))
    else
    begin
      SetLength(Result, Length(inStr) div 2);
      for i := 1 to Length(Result) do
        Result[i-1] := Pack(inStr[2*i-1], inStr[2*i-2]);
    end;
end;

end.
