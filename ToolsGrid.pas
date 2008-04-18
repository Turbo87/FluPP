unit ToolsGrid;

{$MODE Delphi}

interface

uses SysUtils, Classes, Types, Grid, Grids, Graphics;

const
  DeSelectRect: TGridRect = (Left:-1; Top:-1; Right:-1; Bottom:-1 );

function GridChild(Flb: Word): TFGrid; { TODO: deprecated }
function GridActiveChild: TFGrid;  { TODO: deprecated }
function CalcTime(GridIdx: Word; StartTime: String; NrFrom, NrTo: Word; DefaultTime: Byte = 2): String;
function CalcFlights(GridIdx: Word; Flights: Word; NrFrom: Word; NrTo: Word): Word;
//procedure SortGridByCols(ColOrder: array of Integer; Grid: TStringGrid);
procedure DrawColorbands(Grid: TStringGrid; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState; Alignment: TAlignment);
function SearchInGrid(Grid: TStringGrid; Str: String): Boolean; overload;
function SearchInGrid(Grid: TStringGrid; Str: String; out aRow: Integer): Boolean; overload;
procedure ConvertColNames(GridCols: TSTrings);

implementation

uses Main, Tools;

// ----------------------------------------------------------------
// Gridchild
// ----------------------------------------------------------------
function GridChild(Flb: Word): TFGrid;
begin
  Result := TFGrid(FlWindow.Items[Flb]);
end;

// ----------------------------------------------------------------
// Active GridChild
// ----------------------------------------------------------------
function GridActiveChild: TFGrid;
begin
  Result := FlWindow.GetActive;
end;

// ----------------------------------------------------------------
// Add time NrFrom bis NrTo
// ----------------------------------------------------------------
function CalcTime(GridIdx: Word; StartTime: String; NrFrom, NrTo: Word; DefaultTime: Byte = 2): String;
var
  i,j: Integer;
  Hours, Minutes, Time, GesStrMinuten, GesStrStunden: String;
  GesStunden, GesMinuten: Integer;
  TmpDefaultTime: Word;
begin
  Time := ''; Hours := ''; Minutes := ''; j := 1;
  if StartTime = '' then
    StartTime := '00:00';
  while (StartTime[j] <> ':') and (j <= length(StartTime)) do
    begin
      Hours := Hours + Starttime[j];
      inc(j);
    end;
  GesStunden := StrToInt(Hours);
  GesMinuten := StrToInt(copy(Starttime, j+1, 2));

  if DefaultTime in [0..1] then
    TmpDefaultTime := DefaultTime
  else
    TmpDefaultTime := StrToInt(GridChild(GridIdx).Settings.Values['DefaultTime']);

  try
    for i := NrFrom to NrTo do
    begin
      if TmpDefaultTime = 0 then
      begin
        if TFGrid(FlWindow.Items[GridIdx]).Data['BlT',i] <> '' then
          Time := TFGrid(FlWindow.Items[GridIdx]).Data['BlT', i]
        else
          Time := TFGrid(FlWindow.Items[GridIdx]).Data['FlT', i];
      end
      else
      begin
        if TFGrid(FlWindow.Items[GridIdx]).Data['FlT',i] <> '' then
          Time := TFGrid(FlWindow.Items[GridIdx]).Data['FlT', i]
        else
          Time := TFGrid(FlWindow.Items[GridIdx]).Data['BlT', i];
      end;

      Hours := '0'; Minutes := ''; j := 1;
      while (Time <> '') and (Time[j] <> ':') and (j <= length(Time)) do
      begin
        Hours := Hours + Time[j];
        inc(j);
      end;
      Minutes := copy(Time,j+1,2);
      if Minutes = '' then Minutes := '00';
      GesStunden := GesStunden + StrToInt(Hours);
      GesMinuten := GesMinuten + StrToInt(Minutes);
    end;
  except end;
  GesStunden := GesStunden + (GesMinuten div 60);
  GesMinuten := (GesMinuten mod 60);
  GesStrMinuten := Inttostr(GesMinuten);
  GesStrStunden := Inttostr(GesStunden);
  if length(GesStrMinuten) = 1 then insert('0',GesStrMinuten,1);
  result := GesStrStunden+':'+ GesStrMinuten;
  if result = '' then result := '0:00';
end;

// ----------------------------------------------------------------
// Add flights NrFrom bis NrTo
// ----------------------------------------------------------------
function CalcFlights(GridIdx: Word; Flights: Word; NrFrom: Word; NrTo: Word): Word;
var
  i: Word;
begin
  Result := Flights;
  for i := NrFrom to NrTo do
  begin
    inc(Result,StrtoInt(TFGrid(FlWindow.Items[GridIdx]).Data['NoL',i]));
  end;
end;

// ----------------------------------------------------------------
// Sort Grid
// ----------------------------------------------------------------
{procedure SortGridByCols(ColOrder: array of Integer; Grid: TStringGrid);
var
  I, J, FirstRow: Integer;
  Sorted: Boolean;
   function IsSmaller(First, Second : string): Integer;

    function DetectType(const S1, S2: string): TJvSortType;
    var
      ExtValue: Extended;
      CurrValue: Currency;
      DateValue: TDateTime;
    begin
      if TextToFloat(PChar(S1), ExtValue, fvExtended) and TextToFloat(PChar(S2), ExtValue, fvExtended) then
        Result := stNumeric
      else
      if TextToFloat(PChar(S1), CurrValue, fvCurrency) and TextToFloat(PChar(S2), CurrValue, fvCurrency) then
        Result := stCurrency
      else
      if TryStrToDateTime(S1, DateValue) and TryStrToDateTime(S2, DateValue) then
        Result := stDate
      else
        Result := stClassic;
    end;
  begin
    case DetectType(First, Second) of
      stNumeric:
        begin
          if StrToFloat(First) = StrToFloat(Second) then Result := 0
          else Result := Round(StrToFloat(First) / StrToFloat(Second));
        end;
      stDate:
        Result := CompareDateTime(StrToDateTime(First),StrToDateTime(Second));
      stClassic:
        Result := AnsiCompareText(First, Second);
    else
      Result := AnsiCompareStr(First,Second);
    end;
  end;
  function Sort(Row1, Row2: Integer): Integer;
  var
    C: Integer;
  begin
    C := 0;
    Result := IsSmaller(Grid.Cols[ColOrder[C]][Row1], Grid.Cols[ColOrder[C]][Row2]);
    if Result = 0 then
    begin
      Inc(C);
      while (C <= High(ColOrder)) and (Result = 0) do
      begin
        Result := IsSmaller(Grid.Cols[ColOrder[C]][Row1], Grid.Cols[ColOrder[C]][Row2]);
        Inc(C);
      end;
    end;
  end;
begin
  for I := 0 to High(ColOrder) do
    if (ColOrder[I] < 0) or (ColOrder[I] >= Grid.ColCount) then Exit;
  FirstRow := Grid.FixedRows;
  J := FirstRow;
  repeat
    Sorted := True;
    Inc(J);
    for I := FirstRow to Grid.RowCount - 2 do
    if Sort(I, I + 1) > 0 then
    begin
      Grid.MoveRow(I + 1, I);
      Sorted := False;
    end;
  until Sorted or (J = 10000);
  Grid.Repaint;
end;      }

// ----------------------------------------------------------------
// Search in grid
// ----------------------------------------------------------------
function SearchInGrid(Grid: TStringGrid; Str: String): Boolean;
var aRow: Integer;
begin
  Result := SearchInGrid(Grid, Str, aRow);
end;

// ----------------------------------------------------------------
// Search in grid
// ----------------------------------------------------------------
function SearchInGrid(Grid: TStringGrid; Str: String; out aRow: Integer): Boolean;
var Row, Col: Word;
begin
  Result := False;
  aRow := -1;
  for Row := Grid.FixedRows to Grid.RowCount do
    for Col := Grid.FixedCols to Grid.ColCount do
      if pos(AnsiUpperCase(Str),AnsiUpperCase(Grid.Cells[Col,Row])) > 0 then
      begin
        Result := True;
        aRow := Row;
        Exit;
      end;
end;

// ----------------------------------------------------------------
// Draw colorbands
// ----------------------------------------------------------------
procedure DrawColorbands(Grid: TStringGrid; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState; Alignment: TAlignment);
var
  TextOut: String;
  TextStyle: TTextStyle;
begin
{  if not (gdFixed in State) and not (gdSelected	in State) then
  begin
    if Odd(ARow) then
      Grid.Canvas.Brush.Color := clColorband1
    else
      Grid.Canvas.Brush.Color := clColorband2;
  end;
  if (gdFixed in State) and not (gdSelected	in State) then
    Grid.Canvas.Brush.Color := clBtnFace;
  if (gdSelected	in State) then
    Grid.Canvas.Brush.Color := clBtnFace;

  Grid.Canvas.FillRect(Rect);

  InflateRect(Rect, -3, -2);
  TextOut := Grid.Cells[ACol,ARow];
  TextStyle.Alignment:=Alignment;
  Grid.Canvas.TextRect(Rect, Rect.Left , Rect.Top, TextOut, Textstyle);
}end;


// ----------------------------------------------------------------
// Convert col names (new col names from V1.09 Alpha2)
// ----------------------------------------------------------------
procedure ConvertColNames(GridCols: TSTrings);
var i: Word;
begin
  if GridCols.Count = 0 then
    Exit;
  for i := 0 to GridCols.Count-1 do
  begin
    if GridCols[i] = 'Mus' then GridCols[i] := 'ATy';
    if GridCols[i] = 'Ken' then GridCols[i] := 'AId';
    if GridCols[i] = 'Pil' then GridCols[i] := 'Pi1';
    if GridCols[i] = 'Beg' then GridCols[i] := 'Pi2';
    if GridCols[i] = 'Art' then GridCols[i] := 'ToS';
    if GridCols[i] = 'StZ' then GridCols[i] := 'StT';
    if GridCols[i] = 'LaZ' then GridCols[i] := 'LaT';
    if GridCols[i] = 'FlZ' then GridCols[i] := 'FlT';
    if GridCols[i] = 'BlZ' then GridCols[i] := 'BlT';
    if GridCols[i] = 'AFl' then GridCols[i] := 'NoL';
    if GridCols[i] = 'StO' then GridCols[i] := 'StL';
    if GridCols[i] = 'LaO' then GridCols[i] := 'LaL';
    if GridCols[i] = 'Bem' then GridCols[i] := 'Rem';
    if GridCols[i] = 'Str' then GridCols[i] := 'Dst';
    if GridCols[i] = 'Kat' then GridCols[i] := 'Cat';
  end;
end;


end.
 
