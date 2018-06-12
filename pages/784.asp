<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252" %>
<%option explicit
DIM menuid,siteid,submenuid,pageid,dataid
pageid = "784"
menuid = "672"
%>
<!--#include virtual="/includes/siteid.asp" -->
<%submenuid = "672"


DIM catid, rs, catname, theSQL,catoptions
catid = CINT("0"&request("catid"))
'if catid=0 then catid=760
set rs = openRS("Select name from eco_data where id="&catid)
if not rs.eof then catname = rs("name")

'catoptions=getOptionsFromDb("eco_data", "context=13 and siteid=670", "name", "id", "id",catid, "sortnumber","")
theSQL="Select d.id,t1.content as name, t2.content as shorttext, t3.content as url, t4.content as longtext, t5.content as address from "&_
	"(((("&_
	"eco_data d inner join eco_data_texts t1 on d.id=t1.dataid and t1.ckey='linktitle') "&_
	"inner join eco_data_texts t2 on d.id=t2.dataid and t2.ckey='linkdescr') "&_
	"inner join eco_data_texts t3 on d.id=t3.dataid and t3.ckey='linkurl' "&_
	"inner join eco_data_texts t4 on d.id=t4.dataid and t4.ckey='linkdescr2') "&_
	"inner join eco_data_texts t5 on d.id=t5.dataid and t5.ckey='address') "&_
	"where d.context=14 and d.hidden=0 and d.siteid=670 and d.category="&catid&" order by t1.content"
set rs = openRS(theSQL)

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<!--#include virtual="/includes/titleprefix.asp" --><title><%=titleprefix&"Links"%></title><!--#include virtual="/includes/head.asp" -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<script type="text/javascript" src="/general/x_core.js"></script>
<script type="text/javascript">
function toggleComment(cID)
{
	if(xDisplay('cmt'+cID)=='block')
	{
		xDisplay('cmt'+cID,'none');
	}
	else 
	{
		xDisplay('cmt'+cID,'block');
	}
}
</script>

</head>
<body>

<div id="mother">
<div id="contentHolder">
<div id="topbarsub"><!--#include virtual="/includes/homepagetitle.asp" --><!--#include virtual="/includes/tools.asp" --><div id="topbar_text"><!--#include virtual="/includes/tagline.asp" --></div></div>
<div id="menubar"><!--#include virtual="/includes/topmenu.asp" --></div>

<!-- LEFT MENU -->
<div id="leftmenu">
<img src="/images/leftmenu/top.gif" /><br>
<div id="leftmenu_text">
<table cellpadding="0" cellspacing="0" border="0">
<tr>
<td valign="top">
<%
if catid>0 then
	DIM pid
	pid=submenuid
	submenuid=CSTR(catid)
end if
%>
<!--#include virtual="/includes/leftmenu.asp" -->
<%
if catid>0 then
	submenuid=pid
end if
%>
</td>
<td><img src="/general/layout/spacer.gif" height="400" width="1"></td></tr>
</table>
<br>
</div><!-- / leftmenu_text -->
<img src="/images/leftmenu/bottom.gif" /><br>
</div><!--  leftmenu -->
<!-- END LEFT MENU -->

<!-- MAIN CONTENT -->
<div id="maincontent">
<h2>
<!--designit name="Indledning" descr="" size="2" type="html"-->
Materialesamling
<!--/designit-->
</h2>
<div id="maincontenttext">
<%if catid=0 then %>
<!--designit name="Indledning" descr="" size="10" type="html"-->
<P>Her kan du finde omtaler af hjemmesider med materialer til brug i undervisning.</P>
<P></P>
<P></P>
<P>Materialet er opdelt i tre kategorier: </P>
<P><STRONG>Uddannelse for Bæredygtig Udvikling</STRONG> er materialer, der decideret knytter sig til FN's tiår.</P>
<P><STRONG>Undervisning om bæredygtig udvikling</STRONG> er materialer, der omhandler bæredygtig udvikling generelt.</P>
<P><STRONG>Udgivelser</STRONG>&nbsp;er bøger og informationsmateriale om undervisning, uddannelse og bæredygtighed.</P>
<P></P>
<P></P>
<P>Der er mulighed for at se yderligere information samt kontaktadresse for hver enkelt side. </P>
<P>Du er naturligvis meget velkommen til at kontakte os, hvis vi skulle have glemt nogen. <BR></P>
<!--/designit-->
<%end if %>
<!--
<form name="catsel" action="" method="get" style="margin-top:20px;margin-bottom:20px;">
Vælg kategori: <select name="catid" size="1"  onchange="this.form.submit();">
<%'getOptionsFromDb("eco_data", "context=13 and siteid=670", "name", "id", "id",catid, "sortnumber","")%>
</select>
</form>
-->
<% if catid>0 then %>
<h3>Kategori: <%= catname %></h3>
<%
DIM shorttext,longtext, address
do while not rs.eof
	if instr(rs("shorttext"),"<p>")=0 then shorttext=replace(rs("shorttext"),chr(13),"<br>") else shorttext=rs("shorttext")
	if instr(rs("longtext"),"<p>")=0 then longtext=replace(rs("longtext"),chr(13),"<br>") else longtext=rs("longtext")
	if instr(rs("address"),"<p>")=0 then address=replace(rs("address"),chr(13),"<br>") else address=rs("address")
	response.write "<table class=""inspresult""><tr>"&_
		"<td valign=""top""><h3 style=""margin-top:0px;margin-bottom:0px;""><a href=""http://"&rs("url")&""" target=""_blank"">"&rs("name")&"</a></h3>"&shorttext&_
		"<p align=""right"" style=""margin:0px""><a href=""javascript:;"" onclick=""toggleComment('"&rs("id")&"')"" style=""font-size:9px;"">Vis/Skjul uddybende info</a></p></td></tr>"&_
		"<tr><td><div id=""cmt"&rs("id")&""" style=""display:none;width:340px;border-top:1px solid #FFFFFF;padding-top:5px;"">"&longtext&"<br><br>"&address&"</div></td></tr>"&_
		"</table>"
	rs.movenext
loop
end if
%>
</div><!-- maincontenttext -->
</div><!-- maincontent -->
<!-- END MAIN CONTENT -->

<div id="colRight">

</div><!-- colRight -->

</div><!-- contentHolder -->
<div id="footer"></div>
<div id="footer_text"><!--#include virtual="/includes/footer.asp" --></div>
</div><!-- mother -->
<!-- dropdowns -->
<!--#include virtual="/includes/log.asp" -->
</body>
</html>
