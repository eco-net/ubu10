<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252" %>
<%option explicit
DIM menuid,siteid,submenuid,pageid,dataid
pageid = "720"
menuid = "676"
%>
<!--#include virtual="/includes/siteid.asp" -->
<%submenuid = "676"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<!--#include virtual="/includes/titleprefix.asp" --><title><%=titleprefix&"Kontakt"%></title><!--#include virtual="/includes/head.asp" -->
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
<h2>Kontakt</h2>
<div id="maincontenttext"><P>Hvis du har spørgsmål eller eventuelt sidder inde med bidrag til vores pressearkiv, kan du kontakte os her: </P>
<P></P>
<P>Øko-net <BR>Svendborgvej 9, Ollerup <BR>5762 Vester Skerninge <BR>Tlf.: 62 24 43 24 <BR>Fax: 62 24 43 23 <BR>E-mail: <A href="mailto:eco-net@eco-net.dk">eco-net@eco-net.dk</A> <BR><BR>Kontaktperson i forbindelse med pressespørgsmål: <BR>Sekretariatsleder Lars Myrthu-Nielsen <BR>E-mail: <A href="mailto:lmn@eco-net.dk">lmn@eco-net.dk</A> <BR>Tlf.: 40 73 43 24 <BR></P></div><!-- maincontenttext -->
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
