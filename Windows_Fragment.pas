unit Windows_Fragment;

interface

uses
  Windows;

type
  POSVersionInfoA = ^TOSVersionInfoA;
  POSVersionInfoW = ^TOSVersionInfoW;
  POSVersionInfo = POSVersionInfoA;
  _OSVERSIONINFOA = record
    dwOSVersionInfoSize: DWORD;
    dwMajorVersion: DWORD;
    dwMinorVersion: DWORD;
    dwBuildNumber: DWORD;
    dwPlatformId: DWORD;
    szCSDVersion: array[0..127] of AnsiChar; { Maintenance string for PSS usage }
    wServicePackMajor,
    wServicePackMinor,
    wSuiteMask         : word;
    wProductType,
    wReserved          : byte;
  end;
  {$EXTERNALSYM _OSVERSIONINFOA}
  _OSVERSIONINFOW = record
    dwOSVersionInfoSize: DWORD;
    dwMajorVersion: DWORD;
    dwMinorVersion: DWORD;
    dwBuildNumber: DWORD;
    dwPlatformId: DWORD;
    szCSDVersion: array[0..127] of WideChar; { Maintenance string for PSS usage }
    wServicePackMajor,
    wServicePackMinor,
    wSuiteMask         : word;
    wProductType,
    wReserved          : byte;
  end;
  {$EXTERNALSYM _OSVERSIONINFOW}
  _OSVERSIONINFO = _OSVERSIONINFOA;
  TOSVersionInfoA = _OSVERSIONINFOA;
  TOSVersionInfoW = _OSVERSIONINFOW;
  TOSVersionInfo = TOSVersionInfoA;
  OSVERSIONINFOA = _OSVERSIONINFOA;
  {$EXTERNALSYM OSVERSIONINFOA}
  {$EXTERNALSYM OSVERSIONINFO}
  OSVERSIONINFOW = _OSVERSIONINFOW;
  {$EXTERNALSYM OSVERSIONINFOW}
  {$EXTERNALSYM OSVERSIONINFO}
  OSVERSIONINFO = OSVERSIONINFOA;

const
  {$EXTERNALSYM VERSIONINFOSIZEA}
  VERSIONINFOSIZEA  = sizeof(TOSVersionInfoA) -
    (sizeof(word) * 3) - (sizeof(byte) * 2);
  {$EXTERNALSYM VERSIONINFOSIZEW}
  VERSIONINFOSIZEW  = sizeof(TOSVersionInfoW) -
    (sizeof(word) * 3) - (sizeof(byte) * 2);
  {$EXTERNALSYM VERSIONINFOSIZE}
  VERSIONINFOSIZE   = VERSIONINFOSIZEA;

  //
  // RtlVerifyVersionInfo() os product type values
  //
  VER_NT_WORKSTATION                    = $0000001;
  VER_NT_DOMAIN_CONTROLLER              = $0000002;
  VER_NT_SERVER                         = $0000003;

  VER_SERVER_NT                         = $80000000;
  VER_WORKSTATION_NT                    = $40000000;
  VER_SUITE_SMALLBUSINESS               = $00000001;
  VER_SUITE_ENTERPRISE                  = $00000002;
  VER_SUITE_BACKOFFICE                  = $00000004;
  VER_SUITE_COMMUNICATIONS              = $00000008;
  VER_SUITE_TERMINAL                    = $00000010;
  VER_SUITE_SMALLBUSINESS_RESTRICTED    = $00000020;
  VER_SUITE_EMBEDDEDNT                  = $00000040;
  VER_SUITE_DATACENTER                  = $00000080;
  VER_SUITE_SINGLEUSERTS                = $00000100;
  VER_SUITE_PERSONAL                    = $00000200;
  VER_SUITE_BLADE                       = $00000400;
  VER_SUITE_EMBEDDED_RESTRICTED         = $00000800;
  VER_SUITE_SECURITY_APPLIANCE          = $00001000;

  SM_SERVERR2	                          = 89; // Windows Server 2003 R2
  SM_STARTER                            = 88; // Starter Edition von Windows XP
  SM_MEDIACENTER                        = 87; // Windows XP media Center Edition
  SM_TABLETPC	                          = 86; // Windows XP Tablet PC Edition

  PROCESSOR_ARCHITECTURE_INTEL          =  0;
  PROCESSOR_ARCHITECTURE_MIPS           =  1;
  PROCESSOR_ARCHITECTURE_ALPHA          =  2;
  PROCESSOR_ARCHITECTURE_PPC            =  3;
  PROCESSOR_ARCHITECTURE_SHX            =  4;
  PROCESSOR_ARCHITECTURE_ARM            =  5;
  PROCESSOR_ARCHITECTURE_IA64           =  6;
  PROCESSOR_ARCHITECTURE_ALPHA64        =  7;
  PROCESSOR_ARCHITECTURE_MSIL           =  8;
  PROCESSOR_ARCHITECTURE_AMD64          =  9;
  PROCESSOR_ARCHITECTURE_IA32_ON_WIN64  = 10;

function GetVersionExA(var lpVersionInformation: TOSVersionInfo): BOOL; stdcall;
{$EXTERNALSYM GetVersionExA}
function GetVersionExW(var lpVersionInformation: TOSVersionInfo): BOOL; stdcall;
{$EXTERNALSYM GetVersionExW}
function GetVersionEx(var lpVersionInformation: TOSVersionInfo): BOOL; stdcall;
{$EXTERNALSYM GetVersionEx}

function GetNativeSystemInfoEx : SYSTEM_INFO;

implementation

function GetVersionExA; external kernel32 name 'GetVersionExA';
function GetVersionExW; external kernel32 name 'GetVersionExW';
function GetVersionEx; external kernel32 name 'GetVersionExA';

// Use this method to avoid load issues on Windows 2000
function GetNativeSystemInfoEx : SYSTEM_INFO;
var
  po :TFarProc;
  DLLWnd :THandle;
  SI  :SYSTEM_INFO;
  GetNativeSystemInfo:procedure(var LPSYSTEM_INFO:SYSTEM_INFO);stdcall;
begin
  po := nil;
  DLLWnd := LoadLibrary('kernel32');
  if DLLWnd > 0 then
    begin
      try
        po := GetProcAddress(DLLWnd, 'GetNativeSystemInfo');
        if po <> nil then
          begin
            @GetNativeSystemInfo := po;
            GetNativeSystemInfo(SI);
            result := SI;
          end;
      finally
        FreeLibrary(DLLWnd);
      end;
    end;
end;

end.