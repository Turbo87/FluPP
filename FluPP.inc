FileVersion = '7';
DefaultLanguage = 'en';
FluppDomain = 'http://www.flupp-flightlog.org';
FluppEmail = 'info@flupp-flightlog.org';

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
	'Developers'+CS
		+'Momme Mommsen'+CS+'Lars Schaedel'+CS+'Bjoern Mueller'+#13#13+
		
	'Translators'+CS
		+'Dr. Oliver Brock'+CS+'Espen Lien'+CS+'Stefano Lasagna'+CS+'Joris Monten'+#13#13+
		
	'Airport Database'+CS
		+'Welt2000 by Michael Meier'+#13#13+
		
	'Created with'+CS
	  +'Borland Delphi'+#13#13+
	
	'3rd Party Components'+CS
		+'Virtual Treeview by Mike Lischke'+CS+'TscFileDrop by Stefan Cruysberghs'+CS
		+'GNU gettext by Lars B. Dybdahl'+CS+'Project JEDI'+#13#13+
		
	'Icons'+CS
		+'Tango Desktop Project'+#13#13+
		
	'Special thanks to'+CS+'Dennis Bork'+CS+'Andreas Medlhammer'+CS
		+'Sven Proescher'+CS+'Klaus Staudenmaier'+CS
		+'... and many others';