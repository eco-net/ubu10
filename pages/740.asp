<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252" %>
<%option explicit
DIM menuid,siteid,submenuid,pageid,dataid
pageid = "740"
menuid = "680"
%>
<!--#include virtual="/includes/siteid.asp" -->
<%submenuid = "680"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<!--#include virtual="/includes/titleprefix.asp" --><title><%=titleprefix&"Øko-nets hjemmesider"%></title><!--#include virtual="/includes/head.asp" -->
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
<h2>Øko-nets hjemmesider</h2>
<div id="maincontenttext"><P>Øko-net driver pt. fire hjemmesider: <BR><BR><a href="http://www.eco-net.dk/" target="_blank">www.eco-net.dk</A><BR>Dette er foreningens hjemmeside, hvor man bl.a. kan læse Nyhedsbladet Øko-net og finde debatmaterialer fra Øko-net. <BR></P>
<P><a href="http://www.eco-info.dk/" target="_blank">www.eco-info.dk</A> <BR>En internetguide til økologiens verden <BR></P>
<P><a href="http://www.bu.dk/" target="_blank">www.bu.dk</A> <BR>En indgang til alt om bæredygtig udvikling </P>
<P></P>
<P><a href="http://www.ubu10.dk/" target="_blank">www.ubu10.dk</A><BR>Denne hjemmeside er et af Øko-nets væsentligste værktøjer i kampagnen for FN’s tiår for Uddannelse for Bæredygtig Udvikling. <BR></P>
</div><!-- maincontenttext -->
</div><!-- maincontent -->
<!-- END MAIN CONTENT -->

<div id="colRight">
<P align=right><A href="/pages/723.asp">Tilbage</A></P>
</div><!-- colRight -->

</div><!-- contentHolder -->
<div id="footer"></div>
<div id="footer_text"><!--#include virtual="/includes/footer.asp" --></div>
</div><!-- mother -->
<!-- dropdowns -->
<!--#include virtual="/includes/log.asp" -->
</body>
</html>
