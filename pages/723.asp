<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252" %>
<%option explicit
DIM menuid,siteid,submenuid,pageid,dataid
pageid = "723"
menuid = "680"
%>
<!--#include virtual="/includes/siteid.asp" -->
<%submenuid = "680"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<!--#include virtual="/includes/titleprefix.asp" --><title><%=titleprefix&"Om Sitet"%></title><!--#include virtual="/includes/head.asp" -->
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
<!--include virtual="/includes/leftmenu.asp" -->
<table width="100%" border="0" cellpadding="0">
  <tr>
    <td class="leftmenuTD"><a href="/pages/723.asp">Om Sitet</a></td>
  </tr>
  <tr>
    <td class="leftmenuTD"><a href="/pages/sekretariat.asp">Sekretariat / Kontakt</a></td>
  </tr>
</table></td>
<td><img src="/general/layout/spacer.gif" height="400" width="1"></td></tr>
</table>
<br>
</div><!-- / leftmenu_text -->
<img src="/images/leftmenu/bottom.gif" /><br>
</div><!--  leftmenu -->
<!-- END LEFT MENU -->

<!-- MAIN CONTENT -->
<div id="maincontent">
<h2>Om Sitet</h2>
<div id="maincontenttext"><P>www.ubu10.dk er etableret og administreret af folkeoplysningsorganisationen Øko-net. </P>
<P><BR>Hjemmesiden indgår som en væsentlig del af den kampagne, som Øko-net gennemfører i forbindelse med FN’s tiår for Uddannelse for Bæredygtig Udvikling. Den henvender sig først og fremmest til beslutningstagere, undervisere og andre organisationer. Andre dele af befolkningen vil dog også kunne danne sig et billede af, hvad tiåret handler om. </P>
<P><BR>Formålet med hjemmesiden er først og fremmest at skabe rammer for erfaringsudveksling og netværksdannelse. Samt at oplyse om baggrunden for tiåret, om visionerne for det og om de aktiviteter, der knytter sig til det. <BR><BR><A href="/pages/738.asp">Øko-nets historie og organisation </A><BR><A href="/pages/737.asp">Øko-nets mission og vision</A> <BR><A href="/pages/739.asp">Øko-net i praksis </A><BR><A href="/pages/740.asp">Øko-nets hjemmesider </A><BR></P></div><!-- maincontenttext -->
</div><!-- maincontent -->
<!-- END MAIN CONTENT -->

<div id="colRight">
<P><STRONG>Kontakt:</STRONG>&nbsp;</P>
<P>Øko-net <BR>
  &AElig;rtevej 120, Egense <br />
5700 Svendborg<BR>Tlf.: 62 24 43 24 <BR>Fax: 62 24 43 23 <BR>E-mail: <A href="mailto:eco-net@eco-net.dk">eco-net@eco-net.dk</A></P>
</div><!-- colRight -->

</div><!-- contentHolder -->
<div id="footer"></div>
<div id="footer_text"><!--#include virtual="/includes/footer.asp" --></div>
</div><!-- mother -->
<!-- dropdowns -->
<!--#include virtual="/includes/log.asp" -->
</body>
</html>
