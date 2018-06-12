<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252" %>
<%option explicit
DIM menuid,siteid,submenuid,pageid,dataid
pageid = "675"
menuid = "675"
%>
<!--#include virtual="/includes/siteid.asp" -->
<%submenuid = ""


DIM catid, rs, catname, theSQL,catoptions
catid = CINT("0"&request("catid"))
'if catid=0 then catid=760
set rs = openRS("Select name from eco_data where id="&catid)
if not rs.eof then catname = rs("name")

'catoptions=getOptionsFromDb("eco_data", "context=13 and siteid=670", "name", "id", "id",catid, "sortnumber","")
theSQL="Select d.id,t1.content as name, t2.content as text,t3.content as url from "&_
	"(("&_
	"eco_data d inner join eco_data_texts t1 on d.id=t1.dataid and t1.ckey='linktitle') "&_
	"inner join eco_data_texts t2 on d.id=t2.dataid and t2.ckey='linkdescr') "&_
	"inner join eco_data_texts t3 on d.id=t3.dataid and t3.ckey='linkurl' "&_
	"where d.context=12 and d.hidden=0 and d.siteid=670 and d.category="&catid&" order by t1.content"
set rs = openRS(theSQL)

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<!--#include virtual="/includes/titleprefix.asp" --><title><%=titleprefix&"Links"%></title><!--#include virtual="/includes/head.asp" -->
<meta name="keywords" content="" />
<meta name="description" content="" />
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
Links
<!--/designit-->
</h2>
<div id="maincontenttext">
<%if catid=0 then %>
<!--designit name="Indledning" descr="" size="10" type="html"-->
Vi har her lavet en database med organisationer, foreninger og øvrige organer med relevans for FN's tiår for Uddannelse for Bæredygtig Udvikling. 

På "Inspiration" kan du desuden finde korte omtaler af hjemmesider med materialer. <BR>Du er naturligvis meget velkommen til at kontakte os, hvis vi skulle have glemt nogen. <BR>
<!--/designit-->
<%end if %>
<!--
<form name="catsel" action="" method="get" style="margin-top:20px;margin-bottom:20px;">
Vælg kategori: <select name="catid" size="1"  onchange="this.form.submit();">
<%=getOptionsFromDb("eco_data", "context=13 and siteid=670", "name", "id", "id",catid, "sortnumber","")%>
</select>
</form>
-->
<% if catid>0 then %>
<h3>Kategori: <%= catname %></h3>
<%
do while not rs.eof
	response.write "<table class=""searchresultsTABLE""><tr>"&_
		"<td valign=""top""><strong>"&rs("name")&"</strong><br>"&rs("text")&"<br><a href=""http://"&rs("url")&""" target=""_blank"">"&rs("url")&"</a></td></tr>"&_
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
