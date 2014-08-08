unit UTypes;

interface

uses SysUtils;

type
  TmassivOpr = array of array of array of array of string;
  TWord = array of Word;

RKonfigZap = record
  konfig  : TBytes;
  zone    : TBytes;
  fixdate : TBytes;
  sezon1  : TBytes;
  sezon2  : TBytes;
  sezon3  : TBytes;
  sezon4  : TBytes;
  sezon5  : TBytes;
  sezon6  : TBytes;
  sezon7  : TBytes;
  sezon8  : TBytes;
  sezon9  : TBytes;
  sezon0  : TBytes;
  sezon10 : TBytes;
  sezon11 : TBytes;
  sezon12 : TBytes;
end;

REnableVarTar = record
  var_tar: array [1..10] of Boolean;
end;

implementation

end.
