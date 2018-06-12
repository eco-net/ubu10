<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252" %>
<!--#include virtual="/general/aspscripts.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>
<link href="/general/styles/styles.css" media="screen" rel="stylesheet" type="text/css">
</head>

<body style="background-color:#F5E0AF;margin:0px">
<%
theSQL="Select * from eco_usersharings where parentid="&request("parentid")&" order by id"
' where parentid="&request("parentid")
set rs = openRS(theSQL)

do while not rs.eof
	response.write "<table class=""inspcomment""><tr>"&_
		"<td valign=""top""><span style=""font-size:9px;"">Oprettet af: "&rs("sendername")&"</span>"
		if len(session("username"))>0 then response.Write ", <a href=""mailto:"&rs("sendermail")&""">"&rs("sendermail")&"</a>"
		response.write "<h3 style=""margin-top:0px;margin-bottom:0px;"">"&rs("header")&"</h3>"&replace(rs("body"),chr(13),"<br>")
	if len(rs("url"))>0 then
		if left(rs("url"),2)="ht" then prefix="" else prefix="http://"
		response.write "<br><a href="""&prefix&rs("url")&""" target=""_blank"">Læs mere&gt;&gt;</a>"
	end if
	if len(rs("filepath"))>5 then
		response.write "<br><a href="""&rs("filepath")&""" target=""_blank"">Hent fil</a>"
	end if
	if len(session("username"))>0 then response.Write "<br><a href=""javascript:;"" onclick=""if(confirm('Er du sikker ?\nDenne handling kan ikke fortrydes.'))window.location='act_insp_del.asp?parentid="&request("parentid")&"&id="&rs("id")&"';"">Slet indlæg</a>"
	response.write "</td></tr></table>"
	rs.movenext
loop
%>

</body>
</html>
