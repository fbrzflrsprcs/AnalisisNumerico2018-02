unit polynomialClass;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, math, ParseMath, Dialogs;
type
  TPoint = class
      x,y: Real;
    end;
  TInterpolation = class
      arrPoints : array of TPoint;
      tp: Integer; //Total points
    public
      constructor create(n: Integer);
      function getPolinomy(): String;
    end;

implementation

constructor TInterpolation.create(n: Integer);
var
  i: Integer;
begin
    self.tp := n;
    SetLength(arrPoints, n);
    for i:=0 to n-1 do
       arrPoints[i] := TPoint.create();

end;
function TInterpolation.getPolinomy(): String;
var
  i,j,k : Integer; //coeficiente
  cf, num : Real;
  SubPol: TStringList;
  p, temporalString: String;
begin
  for i:=0 to tp-1 do begin
    SubPol := TStringList.create();
    cf := 1;
    for j:=0 to tp-1 do begin
      if j = i then continue;
      num := arrPoints[j].x;
      if num > 0 then
        p := '(x-'+FloatToStr(num)+')'
      else if num = 0 then
        p := '(x)'
      else
        p := '(x+'+FloatToStr(abs(num))+')'; //((i = tp-1) and (j <>tp-2))
      if (j <> tp-1) then
        if not ((i = tp-1) and (j  = tp-2)) then
           p := p + '*';
      SubPol.add(p);
      cf := cf * (arrPoints[i].x - arrPoints[j].x);
    end;
    Result := Result + '(' +FloatToStr(arrPoints[i].y) + '/' + FloatToStr(cf) + ')*' + SubPol.Text;
    if i <> tp-1 then
      Result := Result + '+';
  end;
  Result:=''''+Result+'''';
  if(Pos('/0',Result))<>0 then
    begin
      Result:='NaN';
      ShowMessage('Puntos Invalidos');
    end;
end;

end.

