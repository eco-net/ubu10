<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252" %>
<%option explicit
DIM menuid,siteid,submenuid,pageid,dataid,topdef,topcount
topcount=5
topdef=""
pageid = "681"
%>
<!--#include virtual="/includes/siteid.asp" -->
<%submenuid = "0"
menuid="0"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<!--#include virtual="/includes/titleprefix.asp" --><title><%=titleprefix&"Nyhedsarkiv"%></title><!--#include virtual="/includes/head.asp" -->
<link href="/general/styles/newsarchive.css" media="screen" rel="stylesheet" type="text/css">
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<body>

<div id="mother">
<div id="contentHolder">
<div id="topbarsub"><!--#include virtual="/includes/homepagetitle.asp" --><!--#include virtual="/includes/tools.asp" --><div id="topbar_text"><!--#include virtual="/includes/tagline.asp" --></div></div>
<div id="menubar"><!--#include virtual="/includes/topmenu.asp" --></div>



<!-- LEFT COL -->
<div id="hcol1">
&nbsp;
</div>
<!-- LEFT COL END -->

<!-- CENTER COL -->
<div id="hcol2">
<div id="hcol2_text">
<!--#include file="news.asp"-->
</div></div>
<!-- CENTER COL END -->

<!-- RIGHT COL -->
<div id="hcol3">
</div>
<!-- RIGHT COL END -->
</div><!--  contentHolder -->
<div id="footer"></div>
<div id="footer_text"><!--#include virtual="/includes/footer.asp" --></div>
</div><!-- mother -->
<!--#include virtual="/includes/log.asp" -->
</body>
</html>
