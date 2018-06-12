<%
DIM menuid,siteid,submenuid,pageid,dataid
pageid = "723"
menuid = "680"
%>
<!--#include virtual="/Connections/ecoinfo.asp" -->
<!--#include virtual="/includes/siteid.asp" -->
<%
Dim rsPageData
set rsPageData = Server.CreateObject("ADODB.Recordset")
rsPageData.ActiveConnection = MM_ecoinfo_STRING
rsPageData.Source = "SELECT *  FROM sekretariat  ORDER BY orden"
rsPageData.CursorType = 0
rsPageData.CursorLocation = 2
rsPageData.LockType = 3
rsPageData.Open()

%>

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
  <h2>Sekretariat</h2>
  <div id="maincontenttext">
    <% 
While NOT rsPageData.EOF
%>
    <p><span class="listheader"><%=(rsPageData.Fields.Item("navn").Value)%><br />
      </span><%=(rsPageData.Fields.Item("stilling").Value)%><br />
      <a href="mailto:<%=(rsPageData.Fields.Item("email").Value)%>"><%=(rsPageData.Fields.Item("email").Value)%> </a></p>
    <% 
    rsPageData.MoveNext()
Wend
%>
    <h3>
      </P>
    </h3>
  </div>
  <!-- maincontenttext -->
</div>
<!-- maincontent -->
<!-- END MAIN CONTENT -->
<div id="colRight">
  <h4><span class="contentHeader2">Kontakt &Oslash;ko-net</span></h4>
  <table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="contentHeader2">&nbsp;</td>
    </tr>
    <tr>
      <td> Du kan ringe til &Oslash;ko-info p&aring; <br />
        tlf. 62 24 43 24<br />
        Hvis du ikke tr&aelig;ffer os kan du indtale en besked p&aring; telefonsvareren 
        og vi kontakter dig hurtigst muligt.
        <p><span class="faktaboksheader">Eller sende en fax / e-mail p&aring;:</span><br />
          Fax: 62 24 43 23<br />
          e-mail: <a href="mailto:eco-net@eco-net.dk">eco-net@eco-net.dk</a></p>
        <p><span class="faktaboksheader">Adresse:</span><br />
          &Oslash;ko-info<br />
          Netv&aelig;rket for &oslash;kologisk folkeoplysning og praksis<br />
          &AElig;rtevej 120, Egense <br />
5700 Svendborg</p>
        <p align="center"><br />
        </p></td>
    </tr>
  </table>
  <p>&nbsp;</p>
</div>
<!-- colRight -->

</div><!-- contentHolder -->
<div id="footer"></div>
<div id="footer_text"><!--#include virtual="/includes/footer.asp" --></div>
</div><!-- mother -->
<!-- dropdowns -->
<!--#include virtual="/includes/log.asp" -->
<%
rsPageData.Close()
%>
</body>
</html>
