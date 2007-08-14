FileVersion = '7';
DefaultLanguage = 'en';
FliPSDomain = 'http://flips.unpoint.de';

{
Url's that may be called :-)

/
/airports/[Version]
/licenses/[Version]
/languages/[Version]
/request/[Version]
/bug/[Version]
/support/[Version]

/bug/[Version]/Unit-Name/Procedure-Name/Line-Number
/gmaps/[Start Airport]/[Start ICAO]/[Start Lat]/[Start Lon]/[Dest. Airport]/[Dest. ICAO]/[Dest. Lat]/[Dest. Lon]
}

NumberOfGridRows = 30;
DefaultTableCols = 'Num;Dat;ATy;AId;Pi1;Pi2;StB;StT;LaT;LaB;FlT;BlT;NoL;Pas;StL;LaL;Rem;Dst;CTi;Cat;Via;Met;Fil;Con;ToS;CfF;LaF;CfC;EfF;Del';
DefaultColWidth  = ' 40; 60; 60; 50; 85; 85; 45; 45; 45; 45; 45; 45; 19; 19; 45; 45; 90; 40; 70;185; 90;185; -1; -1; -1; -1; -1; -1; -1; -1';

SchImageIdxUsr = 14;
SchImageIdxMed = 30;
SchImageIdxLic = 27;
SchImageIdxEvt = 31;

clFYellow = $0000D4ED;
clFRed    = $002929EF;
clFGreen  = $0016D273;
clFBlue   = $00A46534;
clFOrange = $006EB9E9;

CS = #13+'      ';

CREDITS =
	'Developer of FliPS'+CS
    +'Bjoern Mueller'+#13#13+

	'FluPP''s origin Developers'+CS
		+'Momme Mommsen'+CS+'Lars Schaedel'+#13#13+

	'FluPP''s origin Translators'+CS
		{+'Joris Monten'+CS}+'Dr. Oliver Brock'+#13#13+

	'FluPP''s origin Airport Database'+CS
		+'Welt2000 by Michael Meier'+#13#13+

	'Created with'+CS
	  +'Borland Delphi 7'+#13#13+

	'3rd Party Components'+CS
		+'Virtual Treeview by Mike Lischke'+CS+'TscFileDrop by Stefan Cruysberghs'+CS
		+'GNU gettext by Lars B. Dybdahl'+CS+'Project JEDI'+#13#13+

	'FluPP''s origin Icons'+CS
		+'Tango Desktop Project';
