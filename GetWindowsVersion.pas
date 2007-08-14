unit GetWindowsVersion;

interface

uses
  Windows, SysUtils, Windows_Fragment;

function GetWinVersion  : String;

implementation

//
// taken from PSDK Feb 2003 - "Getting the System version"
// (ms-help://MS.PSDK.1033/sysinfo/base/getting_the_system_version.htm)
//
//  aktualliesiert durch das Microsoft SDK 1.0 Dezember CTP
//  ms-help://MS.MSSDK.1033/MS.WinSDK.1033/sysinfo/base/getting_the_system_version.htm
//
function GetWinVersion: string;
var
  osvi             : TOSVersionInfo;
  bOsVersionInfoEx : boolean;
  key              : HKEY;
  szProductType    : array[0..79]of char;
  dwBuflen         : dword;
  si               : SYSTEM_INFO; 
begin
  // Try calling GetVersionEx using the OSVERSIONINFOEX structure.
  // If that fails, try using the OSVERSIONINFO structure.
  ZeroMemory(@osvi,sizeof(TOSVersionInfo));
  osvi.dwOSVersionInfoSize := sizeof(TOSVersionInfo);

  bOsVersionInfoEx := GetVersionEx(osvi);
  if(not bOsVersionInfoEx) then begin
    osvi.dwOSVersionInfoSize := VERSIONINFOSIZE;

    if(not GetVersionEx(osvi)) then begin
      Result := 'Fehler bei der Ermittlung der Windows-Version';
      exit;
    end;
  end;

//  GetSystemInfo(si);
  si := GetNativeSystemInfoEx; // Use this method to avoid load issues on Windows 2000

  case osvi.dwPlatformId of
    // Test for the Windows NT product family.
    VER_PLATFORM_WIN32_NT:
      begin
        if(osvi.dwMajorVersion = 6) and (osvi.dwMinorVersion = 0) then
        Begin
          if osvi.wProductType = VER_NT_WORKSTATION Then
          Begin
            case LOWORD(osvi.dwBuildNumber) of
            3683, 3718:
              Result := 'Microsoft Windows M3 (Codename: Longhorn) ';
            4008:
              Result := 'Microsoft Windows M4 (Codename: Longhorn) ';
            4015, 4029:
              Result := 'Microsoft Windows M5 (Codename: Longhorn) ';
            4051, 4053:
              Result := 'Microsoft Windows M6 (Codename: Longhorn) ';
            4074:
              Result := 'Microsoft Windows WinHEC (Codename: Longhorn) ';
            5048:
              Result := 'Microsoft Windows (Codename: Longhorn) ';
            else
              Begin
                Result := 'Microsoft Windows Vista ';
                case LOWORD(osvi.dwBuildNumber) of
                5112:
                  Result := Result + ' Beta 1 (Codename: Longhorn) ';
                end;
              end;
            end;
          End
          else
            Result := 'Microsoft Windows Server (Longhorn) ';
        End;
        // Test for the specific product family.
        if(osvi.dwMajorVersion = 5) and (osvi.dwMinorVersion = 2) then
        Begin
          if GetSystemMetrics(SM_SERVERR2) <> 0 Then
            Result := 'Microsoft Windows Server 2003 R2 '
          else
          if (osvi.wProductType = VER_NT_WORKSTATION) and (si.wProcessorArchitecture = PROCESSOR_ARCHITECTURE_AMD64) Then
            Result := 'Microsoft Windows XP Professional x64 Edition ';
        End
        else
          Result := 'Microsoft Windows Server 2003, ';

        if(osvi.dwMajorVersion = 5) and (osvi.dwMinorVersion = 1) then
          Result := 'Microsoft Windows XP ';

        if(osvi.dwMajorVersion = 5) and (osvi.dwMinorVersion = 0) then
          Result := 'Microsoft Windows 2000 ';

        if(osvi.dwMajorVersion <= 4) then
          Result := 'Microsoft Windows NT ';

        // Test for specific product on Windows NT 4.0 SP6 and later.
        if(bOsVersionInfoEx) then begin
          // Test for the workstation type.
          if (osvi.wProductType = VER_NT_WORKSTATION) and (si.wProcessorArchitecture <> PROCESSOR_ARCHITECTURE_AMD64) then
          begin
            if(osvi.dwMajorVersion = 4) then
              Result := Result + 'Workstation 4.0 '
            else if(osvi.wSuiteMask and VER_SUITE_PERSONAL <> 0) then
              Result := Result + 'Home Edition '
            else
            Begin  // Unterscheidung zw. MCE  und Prof.
              if GetSystemMetrics(SM_MEDIACENTER) <> 0 then
                Result := Result + 'Media Center Edition '
              else if GetSystemMetrics(SM_TABLETPC) <> 0 then
                Result := Result + 'Tablet PC Edition '
              else if GetSystemMetrics(SM_STARTER) <> 0 then
                Result := Result + 'Starter Edition '
              else
                Result := Result + 'Professional ';
            End;
          end
          // Test for the server type.
          else if(osvi.wProductType = VER_NT_SERVER) OR (osvi.wProductType = VER_NT_DOMAIN_CONTROLLER ) then
          begin
            if(osvi.dwMajorVersion = 5) and (osvi.dwMinorVersion = 2) then
            begin
              if ( si.wProcessorArchitecture= PROCESSOR_ARCHITECTURE_IA64 ) Then  // Win2003 Itanium
              Begin
                if(osvi.wSuiteMask and VER_SUITE_DATACENTER <> 0) then
                  Result := Result + 'Datacenter Edition for Itanium-based Systems '
                else if(osvi.wSuiteMask and VER_SUITE_ENTERPRISE <> 0) then
                  Result := Result + 'Enterprise Edition for Itanium-based Systems '
                  else
                    Result := Result + 'Standard Edition for Itanium-based Systems '
              End
              else if ( si.wProcessorArchitecture = PROCESSOR_ARCHITECTURE_AMD64) Then // Win2003 x86-64 
              Begin
                if(osvi.wSuiteMask and VER_SUITE_DATACENTER <> 0) then
                  Result := Result + 'Datacenter x64 Edition '
                else if(osvi.wSuiteMask and VER_SUITE_ENTERPRISE <> 0) then
                  Result := Result + 'Enterprise x64 Edition '
                else
                  Result := Result + 'Standard x64 Edition'
              End
              else
              Begin      // Win 2003 x86
                if(osvi.wSuiteMask and VER_SUITE_DATACENTER <> 0) then
                  Result := Result + 'Datacenter Edition '
                else if(osvi.wSuiteMask and VER_SUITE_ENTERPRISE <> 0) then
                  Result := Result + 'Enterprise Edition '
                else if(osvi.wSuiteMask = VER_SUITE_BLADE) then
                  Result := Result + 'Web Edition '
                else
                  Result := Result + 'Standard Edition ';
               End;   
            end // Win 2000
            else if(osvi.dwMajorVersion = 5) and (osvi.dwMinorVersion = 0) then
            begin
              if(osvi.wSuiteMask and VER_SUITE_DATACENTER <> 0) then
                Result := Result + 'Datacenter Server '
              else if(osvi.wSuiteMask and VER_SUITE_ENTERPRISE <> 0) then
                Result := Result + 'Advanced Server '
              else
                Result := Result + 'Server ';

              case LOWORD(osvi.dwBuildNumber) of
              1671:
                Result := Result + ' Beta 1 (Codename: NT 5.0) ';
              1877:
                Result := Result + ' Beta 2 (Codename: NT 5.0) ';
              2031:
                Result := Result + ' Beta 3 (Codename: NT 5.0) ';
              2072:
                Result := Result + ' Beta für DEC-Alpha-Prozessoren (Codename: NT 5.0) ';
              5111:
                Result := Result + ' (Codename: Neptune) ';
              end;
            end
            else begin // Windows NT 4.0
              if(osvi.wSuiteMask and VER_SUITE_ENTERPRISE <> 0) then
                Result := Result + 'Server 4.0, Enterprise Edition '
              else
                Result := Result + 'Server 4.0 ';
            end;
          end
        end
        // Test for specific product on Windows NT 4.0 SP5 and earlier
        else begin
          dwBufLen := sizeof(szProductType);

          if(RegOpenKeyEx(HKEY_LOCAL_MACHINE,
            'SYSTEM\CurrentControlSet\Control\ProductOptions',0,
            KEY_QUERY_VALUE,key) = ERROR_SUCCESS) then
          try
            ZeroMemory(@szProductType,sizeof(szProductType));

            if(RegQueryValueEx(key,'ProductType',nil,nil,
              @szProductType,@dwBufLen) <> ERROR_SUCCESS) or
              (dwBufLen > sizeof(szProductType)) then
            ZeroMemory(@szProductType,sizeof(szProductType));
          finally
            RegCloseKey(key);
          end;

          if(lstrcmpi('WINNT',szProductType) = 0) then
            Result := Result + 'Workstation ';
          if(lstrcmpi('LANMANNT',szProductType) = 0) then
            Result := Result + 'Server ';
          if(lstrcmpi('SERVERNT',szProductType) = 0) then
            Result := Result + 'Advanced Server ';

          Result := Format('%s%d.%d',[Result,osvi.dwMajorVersion,
            osvi.dwMinorVersion]);
        end;

        // Display service pack (if any) and build number.
        if(osvi.dwMajorVersion = 4) and
          (lstrcmpi(osvi.szCSDVersion,'Service Pack 6') = 0) then
        begin
          // Test for SP6 versus SP6a.
          if(RegOpenKeyEx(HKEY_LOCAL_MACHINE,
            'SOFTWARE\Microsoft\Windows NT\CurrentVersion\Hotfix\Q246009',
            0,KEY_QUERY_VALUE,key) = ERROR_SUCCESS) then

            Result := Format('%sService Pack 6a (Build %d)',[Result,
              osvi.dwBuildNumber and $ffff])
          else
            // Windows NT 4.0 prior to SP6a
            Result := Format('%s%s (Build %d)',[Result,
              osvi.szCSDVersion,osvi.dwBuildNumber and $ffff]);
          RegCloseKey(key);
        end
        // Windows NT 3.51 and earlier or Windows 2000 and later
        else begin
          Result := Format('%s%s (Build %d)',[Result,
            osvi.szCSDVersion,osvi.dwBuildNumber and $ffff]);
        end;
      end;
    // Test for the Windows 95 product family.
    VER_PLATFORM_WIN32_WINDOWS:
      begin
        if(osvi.dwMajorVersion = 4) and (osvi.dwMinorVersion = 0) then
        begin
          Result := 'Microsoft Windows 95';
          case LOWORD(osvi.dwBuildNumber) of
          122:
              Result := Result + ' Beta (Codename: Chicago) ';
          189:
              Result := Result + ' Beta 2 (Codename: Chicago) Sept. 1994 ';
          347:
              Result := Result + ' Beta 3 (Codename: Chicago) März 1995 ';
          480:
              Result := Result + ' Beta 4 (Codename: Chicago) Mai 1995 ';
          950:
              if(osvi.szCSDVersion[0] = 'A') then
                Result := Result + ' OSR1 ';
          999:
              Result := Result + 'B Beta (Codename: Nashville) ';
          1111:
              Result := Result + 'B OSR2 ';
          1212,1213:
              Result := Result + 'B OSR2.1 ';
          1214:
              Result := Result + 'C OSR2.5 ';
          end;
        end;

        if(osvi.dwMajorVersion = 4) and (osvi.dwMinorVersion = 10) then
        begin
          Result := 'Microsoft Windows 98 ';
          if(osvi.szCSDVersion[0] = 'A') then
            Result:= Result + 'SE ';
          case LOWORD(osvi.dwBuildNumber) of
          1387:
            Result := Result + ' Developer Release (Codename: Memphis) ';
          1488:
            Result := Result + ' Beta 1 (Codename: Memphis) ';
          1629:
            Result := Result + ' Beta 3 (Codename: Memphis) ';
          end;
        end;

        if(osvi.dwMajorVersion = 4) and (osvi.dwMinorVersion = 90) then
        begin
          Result := 'Microsoft Windows Millennium Edition';
          case LOWORD(osvi.dwBuildNumber) of
          2380:
              Result := Result + ' Beta 1 (Codename: Georgia) ';
          end;
        end;
      end;
    VER_PLATFORM_WIN32s:
      Result := 'Microsoft Win32s';
  end;
end;

end.
