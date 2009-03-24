unit debug;

{$MODE Delphi}

interface

uses
  Contnrs, Classes, SysUtils, Dialogs, DateUtils;

  procedure DWrite(Text: String);

implementation

const
  DEBUGFILENAME = 'debug.log';

procedure DWrite(Text: String);
var
  f: Textfile;
begin
  try
    AssignFile(f, ExtractFilePath(ParamStr(0)) + DEBUGFILENAME);
    if not fileexists(ExtractFilePath(ParamStr(0)) + DEBUGFILENAME) then
      Rewrite(f)
    else
      Append(f);
    Writeln(f, Text);
  finally
    closeFile(f);
  end;
end;

end.
