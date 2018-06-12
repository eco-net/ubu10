<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252" %>
<%
DIM menuid,siteid,submenuid,pageid
menuid = "0" %>
<!--#include virtual="/includes/siteid.asp" -->
<%pageid = "5" 
submenuid = "0" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<link href="/general/styles/home.css" media="screen" rel="stylesheet" type="text/css">
<!--#include virtual="/includes/head.asp" -->
<!--#include virtual="/includes/homepagetitle.asp" -->
<!--#include virtual="/includes/titleprefix.asp" -->
<title><%=titleprefix&homepagename%></title>
<%
pagekeywords=gpagekeywords
pagedescription=gpagedescription
%>
<meta name="keywords" content="<%=pagekeywords%>" />
<meta name="description" content="<%=pagedescription%>" />
</head>
<body>

<div id="mother">
<div id="contentHolder">

<div id="topbar"><!--#include virtual="/includes/tools.asp" --><div id="topbar_text"><!--#include virtual="/includes/tagline.asp" --></div></div>
<div id="menubar"><!--#include virtual="/includes/topmenu.asp" --></div>

<!-- LEFT COL -->
<div id="hcol1">
<img src="/images/homepage/lefttop.gif" /><br>
<div id="hcol1_text">
<!--#include file="col1.asp"-->
<br>
</div><img src="/images/homepage/leftbottom.gif" /></div>
<!-- LEFT COL END -->

<!-- CENTER COL -->
<div id="hcol2">
<div id="hcol2_text">
<!--#include file="col2.asp"-->
<br>
</div></div>
<!-- CENTER COL END -->

<!-- RIGHT COL -->
<div id="hcol3">
<img src="/images/homepage/righttop.gif" /><br />
<div id="hcol3_text">
<!--#include file="col3.asp"-->
<br />
</div><img src="/images/homepage/rightbottom.gif" width="165" height="10" /></div>
<!-- RIGHT COL END -->
</div><!--  contentHolder -->
<div id="footer"></div>
<div id="footer_text"><!--#include virtual="/includes/footer.asp" --></div>
</div><!-- mother -->
<!--#include virtual="/includes/drops.asp" -->
<!--#include virtual="/includes/log.asp" -->
</body>
</html>
