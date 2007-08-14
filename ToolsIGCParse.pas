unit ToolsIGCParse;

interface

uses ShellAPI, SysUtils, Tools;

type
  TIGCStreamData = record
    time: String;
    latdeg, latminute, latmindec, northsouth: String;
    londeg, lonminute, lonmindec,  eastwest : String;
    valid: String;
    alt: String;
    gpsalt: String;
    epe: String;
    enl: String;
  end;

  TIGCParseData = record
    Date, Pilot, Crew,
    GliderType, GliderID, CompID, CompClass,
    StO, LaO, StZ, LaZ: String;
  end;

  function parseIGCFile(FileName: String; var IGCParseData: TIGCParseData): Boolean;

implementation

uses Main, Grid;

// ----------------------------------------------------------------
// parse IGCFile
// ----------------------------------------------------------------
function parseIGCFile(FileName: String; var IGCParseData: TIGCParseData): Boolean;
var
  IGCFile: TextFile;
  stream: String;
  i,wp: Word;
  started, landed: Boolean;
  Lon1, Lat1, Lon2, Lat2: Real;
  Time1, Time2: String;
  timeDiff: TDateTime;
  distDiff: Real;

  IGCStreamData: TIGCStreamData;
  IGCData: array of String;

{----------}
  function ExtractValue: String;
  var i: Word;
  begin
    Result := copy(stream,pos(':',stream)+1,length(stream)-pos(':',stream));
    for i := 1 to length(Result) do
      if Result[i] = '_' then Result[i]:= ' ';
  end;
{----------}
  procedure parseIGCStream(stream: String; var IGCStreamData: TIGCStreamData);
  begin
    with IGCStreamData do
    begin
      time := copy(stream,2,2)+':'+copy(stream,4,2)+':'+copy(stream,6,2);
      latdeg := copy(stream,8,2);
      latminute := copy(stream,10,2);
      latmindec := copy(stream,12,3);
      northsouth := copy(stream,15,1);
      londeg := copy(stream,16,3);
      lonminute := copy(stream,19,2);
      lonmindec := copy(stream,21,3);
      eastwest := copy(stream,24,1);
      valid := copy(stream,25,1);
      alt := copy(stream,26,5);
      gpsalt := copy(stream,31,5);
      epe := copy(stream,36,4);
      enl := copy(stream,40,3);
    end;
  end;
{----------}
begin
  setLength(igcData, 0);
	wp:=0; started:=False; landed:=False;
	AssignFile(IGCFile,FileName);
	Reset(IGCFile);
	try
	  while not Eof(IGCFile) do
	  begin
      Readln(IGCFile,stream);

      { Anmeldedaten }
      if Stream[1] = 'H' then
      begin
        if Pos('HFDTE',stream) > 0 then IGCParseData.Date := copy(stream,6,2)+'.'+copy(stream,8,2)+'.20'+copy(stream,10,2);
        if Pos('HFPLTPILOT:',stream) > 0 then IGCParseData.Pilot := ExtractValue;
        if Pos('HFSCMSECONDCREW:',stream) > 0 then IGCParseData.Crew := ExtractValue;
        if Pos('HFGTYGLIDERTYPE:',stream) > 0 then IGCParseData.GliderType := ExtractValue;
        if Pos('HFGIDGLIDERID:',stream) > 0 then IGCParseData.GliderID := ExtractValue;
        if Pos('HFCIDCOMPETITIONID:',stream) > 0 then IGCParseData.CompID := ExtractValue;
        if Pos('HFCCLCOMPETITIONCLASS:',stream) > 0 then IGCParseData.CompClass := ExtractValue;
      end;
	
      { Waypoints }
      if Stream[1] = 'C' then if Stream[9] = 'N' then
      begin
        case wp of
          0: IGCParseData.StO := copy(stream,19,6);
          //1: ('AbflugOrt: '+ copy(stream,19,6);
          2: IGCParseData.LaO := copy(stream,19,6);
        end;
        inc(wp);
      end;

      { Records }
      if (Stream[1] = 'B') and (copy(stream,25,1) = 'A') then
      begin
        setLength(igcData,length(igcData)+1);
        igcData[high(IGCData)] := stream;

        {parseIGCStream(Stream,IGCStreamData);
        with IGCStreamData do Memo1.Lines.Add(time+' '
        +NorthSouth+latdeg+'°'+latminute+','+latmindec+''' '
        +EastWest+londeg+'°'+lonminute+','+lonmindec+''''
        +' Höhe:'+alt+ ' GPS Höhe:'+gpsalt
        +' EPE:'+epe+' ENL:'+enl) }
      end;
    end; // eof

    { Start }
    i := 0;
    while (not started) and (i < high(IGCData)-2) do
    with IGCStreamData do
    begin
      parseIGCStream(IGCData[i+1], IGCStreamData);
      Time1 := time;
      Lat1 := PosToDeg(latdeg+'°'+latminute+''''+InttoStr(StrtoInt(latmindec)*60 div 100)+'"');
      Lon1 := PosToDeg(londeg+'°'+lonminute+''''+InttoStr(StrtoInt(lonmindec)*60 div 100)+'"');

      parseIGCStream(IGCData[i], IGCStreamData);
      Time2 := time;
      Lat2 := PosToDeg(latdeg+'°'+latminute+''''+InttoStr(StrtoInt(latmindec)*60 div 100)+'"');
      Lon2 := PosToDeg(londeg+'°'+lonminute+''''+InttoStr(StrtoInt(lonmindec)*60 div 100)+'"');

      timeDiff := (StrToTime(Time1)-StrToTime(Time2))*24;
      distDiff := CalcDist(Lat1,Lon1,Lat2,Lon2, 'km');
      if (distDiff / timeDiff)  > 20 then
      started := true;

      inc(i);
    end;
    if started then IGCParseData.StZ := RoundTime(IGCStreamData.Time);

    { Landing }
    i := high(IGCData);
    while (not landed) and (i > 2) do
    with IGCStreamData do
    begin
      parseIGCStream(IGCData[i-1], IGCStreamData);
      Lat1 := PosToDeg(latdeg+'°'+latminute+''''+InttoStr(StrtoInt(latmindec)*60 div 100)+'"');
      Lon1 := PosToDeg(londeg+'°'+lonminute+''''+InttoStr(StrtoInt(lonmindec)*60 div 100)+'"');

      parseIGCStream(IGCData[i], IGCStreamData);
      Lat2 := PosToDeg(latdeg+'°'+latminute+''''+InttoStr(StrtoInt(latmindec)*60 div 100)+'"');
      Lon2 := PosToDeg(londeg+'°'+lonminute+''''+InttoStr(StrtoInt(lonmindec)*60 div 100)+'"');

      timeDiff := (StrToTime(Time1)-StrToTime(Time2))*24;
      distDiff := CalcDist(Lat1,Lon1,Lat2,Lon2, 'km');
      if (distDiff / timeDiff)  > 20 then
      landed := true;

      dec(i);
    end;
    if landed then IGCParseData.LaZ := RoundTime(IGCStreamData.Time); 

  finally
    Closefile(IGCFile);
    setlength(igcData,0);
  end; //try
end;

end.
