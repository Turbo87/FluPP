unit ToolsShell;

{$MODE Delphi}

interface

uses {ShellAPI,} Forms;

function ShellCopyFile(const ASource, ADest: String;
 ARenameCheck: boolean = false): boolean;
function ShellCopyDir(const fromDir, toDir: string): Boolean;
function ShellMoveFile(FormHandle : THandle; StrFrom, StrTo : string;
  BlnSilent : Boolean = False) : Boolean;

implementation

// ----------------------------------------------------------------
// Copy files
// ----------------------------------------------------------------
function ShellCopyFile(const ASource, ADest: String;
 ARenameCheck: boolean = false): boolean;
//var
//  sh: TSHFileOpStruct;
begin
{  sh.Wnd := Application.Handle;
  sh.wFunc := FO_COPY;

  sh.pFrom := PChar(ASource + #0);
  sh.pTo := PChar(ADest + #0);
  sh.fFlags := fof_Silent or fof_MultiDestFiles;
  if ARenameCheck then
    sh.fFlags := sh.fFlags or fof_RenameOnCollision;
  Result:=ShFileOperation(sh)=0; }
end;

// ----------------------------------------------------------------
// Copy Directory
// ----------------------------------------------------------------
function ShellCopyDir(const fromDir, toDir: string): Boolean;
//var
//  fos: TSHFileOpStruct;
begin
{  with fos do
  begin
    wFunc  := FO_COPY;
    fFlags := FOF_FILESONLY;
    pFrom  := PChar(fromDir + #0);
    pTo    := PChar(toDir)
  end;
  Result := (0 = ShFileOperation(fos));}
end;

// ----------------------------------------------------------------
// Move files
// ----------------------------------------------------------------
function ShellMoveFile(FormHandle : THandle; StrFrom, StrTo : string;
  BlnSilent : Boolean = False) : Boolean;
//var
//  F : TShFileOpStruct;
begin
{  F.Wnd:=FormHandle;
  F.wFunc:=FO_MOVE;
  F.pFrom:=PChar(StrFrom+#0);
  F.pTo:=PChar(StrTo+#0);
  F.fFlags := FOF_ALLOWUNDO or FOF_RENAMEONCOLLISION;
  if BlnSilent then
    F.fFlags := F.fFlags or FOF_SILENT;
  if ShFileOperation(F) <> 0 then
    result:=False
  else
    result:=True;}
end;

end.
