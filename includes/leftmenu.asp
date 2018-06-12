<%
DIM suffix
if menuid=671 then 
	response.write "<table cellpadding=""0"" cellspacing=""0"" border=""0"">"
	if pageid=741 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTD"&suffix&"""><a href=""/pages/741.asp"">Historien bag tiåret</a></td></tr>"

if submenuid="741" or pageid=741 then

end if
	if pageid=742 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTD"&suffix&"""><a href=""/pages/742.asp"">Roller i tiåret</a></td></tr>"

if submenuid="742" or pageid=742 then

end if
	if pageid=700 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTD"&suffix&"""><a href=""/pages/700.asp"">Visionen for tiåret</a></td></tr>"

if submenuid="700" or pageid=700 then

end if
	response.write "</table>"
end if
if menuid=673 then 
	response.write "<table cellpadding=""0"" cellspacing=""0"" border=""0"">"
	if pageid=714 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTD"&suffix&"""><a href=""/pages/714.asp"">Danske konferencer</a></td></tr>"

if submenuid="714" or pageid=714 then
	if pageid=1236 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/1236.asp"">SEED-konferencen: Education for Sustainable Development - Building Capacity and Empowerment – maj 2005, Esbjerg</a></td></tr>"
	if pageid=976 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/976.asp"">Vi må lære, hvis jorden skal bære - marts 2005, København</a></td></tr>"
	if pageid=979 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/979.asp"">Hvad vil vi med FNs tiår for undervisning i bæredygtig udvikling? - februar 2005, DPU</a></td></tr>"

end if
	if pageid=715 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTD"&suffix&"""><a href=""/pages/715.asp"">Internationale konferencer</a></td></tr>"

if submenuid="715" or pageid=715 then
	if pageid=1234 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/1234.asp"">Andet internationale forum for Uddannelse for Bæredygtig Udvikling - oktober-november 2005 - Kina</a></td></tr>"
	if pageid=1011 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/1011.asp"">Hvordan fremme læring for en bærekraftig utvikling? - marts 2005, Norge</a></td></tr>"
	if pageid=1058 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/1058.asp"">ESD International launch event, marts 2005, USA</a></td></tr>"
	if pageid=990 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/990.asp"">Education for a Sustainable Future - januar 2005, Indien</a></td></tr>"

end if
	if pageid=722 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTD"&suffix&"""><a href=""/pages/722.asp"">Optaktskonferencer til tiåret</a></td></tr>"

if submenuid="722" or pageid=722 then
	if pageid=879 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/879.asp"">Learning to change our world - maj 2004, Göteborg</a></td></tr>"
	if pageid=1033 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/1033.asp"">Adult Education for Sustainable Development - november 2003, Letland</a></td></tr>"
	if pageid=1034 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/1034.asp"">International Forum on Education for Sustainable Development - november 2003, Kina</a></td></tr>"
	if pageid=1027 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/1027.asp"">Nordiska Ministerrådets seminarium om utbildning för hållbar utcevkling – juni 2003, Sverige</a></td></tr>"
	if pageid=1037 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/1037.asp"">Europe-wide Global Education Congress - november 2002, Holland</a></td></tr>"
	if pageid=1039 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/1039.asp"">World Summit on Sustainable Development (WSSD) - august/september 2002, Sydafrika </a></td></tr>"

end if
	if pageid=904 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTD"&suffix&"""><a href=""/pages/904.asp"">Nationale aktører</a></td></tr>"

if submenuid="904" or pageid=904 then

end if
	if pageid=1053 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTD"&suffix&"""><a href=""/pages/1053.asp"">Internationale aktører</a></td></tr>"

if submenuid="1053" or pageid=1053 then

end if
	if pageid=1314 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTD"&suffix&"""><a href=""/pages/1314.asp"">Nationale strategier</a></td></tr>"

if submenuid="1314" or pageid=1314 then
	if pageid=1315 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/1315.asp"">Tysk indsats for FN-tiår</a></td></tr>"
	if pageid=1319 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/1319.asp"">Engelsk handlingsplan for Uddannelse for Bæredygtig Udvikling</a></td></tr>"
	if pageid=1318 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/1318.asp"">Norsk strategi for Uddannelse for Bæredygtig Udvikling</a></td></tr>"
	if pageid=1321 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/1321.asp"">Svensk indsats for UBU10</a></td></tr>"

end if
	response.write "</table>"
end if
if menuid=672 then 
	response.write "<table cellpadding=""0"" cellspacing=""0"" border=""0"">"
	if pageid=704 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTD"&suffix&"""><a href=""/pages/704.asp"">Erfaringsdeling</a></td></tr>"

if submenuid="704" or pageid=704 then
	if pageid=782 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/782.asp"">Inspirationsbank</a></td></tr>"
	if pageid=762 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/762.asp"">Artikler</a></td></tr>"

end if
	if pageid=706 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTD"&suffix&"""><a href=""/pages/706.asp"">Eksempler på UBU i praksis</a></td></tr>"

if submenuid="706" or pageid=706 then
	if pageid=712 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/712.asp"">Eksempel fra New Zealand</a></td></tr>"
	if pageid=743 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/743.asp"">Eksempel fra England</a></td></tr>"
	if pageid=1326 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/1326.asp"">Eksempel fra Australien</a></td></tr>"

end if
	if pageid=784 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTD"&suffix&"""><a href=""/pages/784.asp"">Materialesamling</a></td></tr>"

if submenuid="784" or pageid=784 then
	if submenuid="785" then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/784.asp?catid=785"">Uddannelse for Bæredygtig Udvikling</a></td></tr>"
	if submenuid="786" then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/784.asp?catid=786"">Undervisning om bæredygtig udvikling</a></td></tr>"
	if submenuid="985" then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/784.asp?catid=985"">Udgivelser</a></td></tr>"

end if
	response.write "</table>"
end if
if menuid=674 then 
	response.write "<table cellpadding=""0"" cellspacing=""0"" border=""0"">"
	if pageid=1146 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTD"&suffix&"""><a href=""/pages/1146.asp"">Udvalgte internationale aktiviteter</a></td></tr>"

if submenuid="1146" or pageid=1146 then
	if pageid=1342 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/1342.asp"">didacta 2006 i Hannover, Tyskland</a></td></tr>"
	if pageid=1347 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/1347.asp"">Konferencen i Wien</a></td></tr>"

end if
	response.write "</table>"
end if
if menuid=675 then 
	response.write "<table cellpadding=""0"" cellspacing=""0"" border=""0"">"
	if submenuid="760" then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTD"&suffix&"""><a href=""/pages/675.asp?catid=760"">Uddannelse for Bæredygtig Udvikling</a></td></tr>"
	if submenuid="763" then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTD"&suffix&"""><a href=""/pages/675.asp?catid=763"">Undervisning om bæredygtig udvikling</a></td></tr>"
	if submenuid="764" then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTD"&suffix&"""><a href=""/pages/675.asp?catid=764"">Bæredygtig udvikling generelt</a></td></tr>"
	response.write "</table>"
end if
if menuid=676 then 
	response.write "<table cellpadding=""0"" cellspacing=""0"" border=""0"">"
	if pageid=677 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTD"&suffix&"""><a href=""/pages/677.asp"">Pressemeddelelser</a></td></tr>"

if submenuid="677" or pageid=677 then
	if pageid=757 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/757.asp"">Vi må lære, hvis jorden skal bære</a></td></tr>"
	if pageid=1045 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/1045.asp"">Balanceakten til Indien </a></td></tr>"
	if pageid=1148 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/1148.asp"">Balanceakten på Artville 2005</a></td></tr>"

end if
	if pageid=678 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTD"&suffix&"""><a href=""/pages/678.asp"">Presseklip</a></td></tr>"

if submenuid="678" or pageid=678 then
	if pageid=748 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/748.asp"">92-gruppens nyhedsbrev</a></td></tr>"
	if pageid=1026 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/1026.asp"">Orientering på P1</a></td></tr>"
	if pageid=1165 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/1165.asp"">KRONIK i Information weekend 6.-7. august 2005</a></td></tr>"
	if pageid=1218 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTDSub"&suffix&"""><a href=""/pages/1218.asp"">Artikel i Højskolebladet nr. 15, oktober 2005</a></td></tr>"

end if
	if pageid=720 then suffix="Sel" else suffix=""
	response.write "<tr><td class=""leftmenuTD"&suffix&"""><a href=""/pages/720.asp"">Kontakt</a></td></tr>"

if submenuid="720" or pageid=720 then

end if
	response.write "</table>"
end if

%>