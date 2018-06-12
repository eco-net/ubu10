<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252" %>
<%option explicit
DIM menuid,siteid,submenuid,pageid,dataid
pageid = "725"
menuid = "674"
%>
<!--#include virtual="/includes/siteid.asp" -->
<%submenuid = "674"
DIM catid, rs, catname, theSQL,catoptions,theFrom,theWhere,theOrder
catid = getSetting(2,"dk")

theFrom="eical_maindata m INNER JOIN eisys_postnr p ON m.postnr=p.postnr "
theWhere="(validated=1 or validated=0) "
theOrder="ORDER BY m.startdate"
theWhere=theWhere & " AND cs.sbjid=" & catid
theWhere=theWhere & " AND (m.startdate>=" & FormatDateDB(date) &_
	" OR m.enddate>=" & FormatDateDB(date) & ")"
theFROM= "(" & theFrom & " LEFT JOIN eical_r_sbj cs ON m.id=cs.calid)"

theSQL="SELECT m.subtitle,m.fulladdress,m.id,m.title,m.shortdescription,m.www,m.startdate,m.enddate,m.organizers,p.city  FROM (eical_maindata m LEFT JOIN eisys_postnr p ON m.postnr=p.postnr)  WHERE 0=0  ORDER BY m.startdate"
theSQL=replace(theSQL,"0=0",theWhere)
theSQL=replace(theSQL,"(eical_maindata m LEFT JOIN eisys_postnr p ON m.postnr=p.postnr)",theFrom)
theSQL=replace(theSQL,"ORDER BY m.startdate",theOrder)

'catoptions=getOptionsFromDb("eco_data", "context=13 and siteid=670", "name", "id", "id",catid, "sortnumber","")
'response.write theSQL
set rs = openRS(theSQL)

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<!--#include virtual="/includes/titleprefix.asp" --><title><%=titleprefix&"Nationale arrangementer"%></title><!--#include virtual="/includes/head.asp" -->
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
<!--#include virtual="/includes/leftmenu.asp" -->
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
Nationale aktiviteter
<!--/designit-->
</h2>
<div id="maincontenttext">
<!--designit name="Indledning" descr="" size="10" type="html"-->
Vi har på denne side lavet en oversigt over de nationale aktiviteter, der afvikles i den kommende tid, og som har med Uddannelse for Bæredygtig Udvikling at gøre. Idéen med kalenderen er, at den skal rumme såvel politiske og forskningsbaserede konferencer som lokale arrangementer og foredrag. 
<!--/designit-->
<br /><br />
<%
do while not rs.eof
	response.write "<table class=""searchresultsTABLE"" width=""350""><tr>"&_
		"<td valign=""top"">"&datepart("d",rs("startdate"))&"."&datepart("m",rs("startdate"))&"."&datepart("yyyy",rs("startdate"))&" - "&datepart("d",rs("enddate"))&"."&datepart("m",rs("enddate"))&"."&datepart("yyyy",rs("enddate"))&"<br><strong>"&rs("title")&"</strong><br>"
		if len(rs("subtitle"))>0 then response.write rs("subtitle")&"<br>"
		if len(rs("shortdescription"))>0 then response.write replace(rs("shortdescription"),chr(13),"<br>")&"<br>"
		response.write "<a href=""http://www.eco-info.dk/ok/detail.asp?id="&rs("id")&""" target=""_blank"">L&aelig;s mere ...</a></td></tr>"&_
		"<tr><td><br><hr></td></tr></table>"
	rs.movenext
loop
%>
</div><!-- maincontenttext -->
</div><!-- maincontent -->
<!-- END MAIN CONTENT -->

<div id="colRight">
<h3>
<!--designit name="Overskrift" descr="" size="2" type="html"-->
Internationale aktiviteter
<!--/designit-->
</h3>

<!--designit name="tekst" descr="" size="10" type="html"-->
UNESCO har lavet en kalender med blandt andet en stor del af de internationale konferencer, der har med tiåret at gøre.<br />
<A href="http://portal.unesco.org/education/en/ev.php-URL_ID=27603&URL_DO=DO_TOPIC&URL_SECTION=201.html" target="_blank"><U>UNESCO's kalender</U>.</a>
<!--/designit-->

<h3>
<!--designit name="Overskrift 2" descr="" size="2" type="html"-->
Dit arrangement
<!--/designit-->
</h3>

<!--designit name="tekst 2" descr="" size="10" type="html"-->
Vi hører meget gerne fra dig, hvis du har et arrangement, du gerne vil have lagt ind i vores kalender. Vi kan kontaktes på <A href="mailto:eco-net@eco-net.dk"><U>eco-net@eco-net.dk</U></A>
<!--/designit-->

</div><!-- colRight -->

</div><!-- contentHolder -->
<div id="footer"></div>
<div id="footer_text"><!--#include virtual="/includes/footer.asp" --></div>
</div><!-- mother -->
<!-- dropdowns -->
<!--#include virtual="/includes/log.asp" -->
</body>
</html>
