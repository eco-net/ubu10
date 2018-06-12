<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="//sitemanager/general/common.asp"-->
<%
Dim UploadRequest	' Dictionary, der indeholder al indhold fra form-felter
Dim gBinName		' Filnavne på gemte filer. Kommasepareret liste ved flere filer.
Dim RequestBin		' Den komplette, binære request
DIM i,theid,theSQL
DIM parentid,theFrom,theFromName, theSubject, theBody,theBody2,title
Set UploadRequest = CreateObject("Scripting.Dictionary")
RequestBin = Request.BinaryRead(Request.TotalBytes)

PureUploadSetup
gBinName = SaveFile("insp/",1)
parentid=requestNum("parentid")

if parentid>0 then ' måske skal ejer/andre abonenter adviseres
	theFrom="eco-net@eco-net.dk"
	theFromName="UBU10 / Øko-Net"
	theSubject="Nyt indlæg i inspirationsbanken"
	theSQL="Select Distinct(sendermail),sendername,header,id from eco_usersharings where id="&parentid&" or parentid="&parentid&" order by id"
'	response.write theSQL
	set rs=openRS(theSQL)
	if not rs.eof then
		title=rs("header")
		theBody="Der er oprettet en ny kommentar til indlægget '"&title&"' i Inspirationsbanken på www.ubu10.dk, og du har valgt at abonnere på kommentarer til dette indlæg."&vbcrlf&vbcrlf&_
				"Klik ind på http://www.ubu10.dk/pages/782.asp for at se kommentaren."&vbcrlf&vbcrlf&_
				"Venlig hilsen Redaktionen"
		do while not rs.eof
			if len(rs("Sendermail"))>0 then 
				theBody2="Hej "&rs("sendername")&vbcrlf&vbcrlf&theBody
				SendMail rs("sendermail"),theFrom,theFromName,theSubject,theBody2
			end if
			rs.movenext
		loop
	end if
end if

theid=save_publication(parentid)

FUNCTION save_publication(parentid)
	dim theSQL,theID,pageid
	pageid=RequestNum("pageid")
	if pageid=0 then pageid=1
	theSQL = "Insert into eco_usersharings (siteid,appid,parentid,filepath,header,body,url,sendername,sendermail) values ("&_
	"670,1,"&parentid&","&sqlString("insp/" & requestStr("file")) & "," & sqlString(requestStr("header")) & "," &_
	sqlString(requestStr("body")) & "," & sqlString(requestStr("url")) & "," & sqlString(requestStr("sendername")) & "," &_
	sqlString(requestStr("mail")) &_
	")"
	save_publication=InsertRec(theSQL,"eco_usersharings","id","")
end FUNCTION

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" type="text/JavaScript">
opener.document.location='782.asp?done=1';
window.close();
</script>
</head>

<body>

</body>
</html>

