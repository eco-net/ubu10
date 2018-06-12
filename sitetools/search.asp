<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252" %>
<%
DIM menuid,siteid,submenuid,pageid
pageid = 721
menuid = 0 %>
<!--#include virtual="/includes/siteid.asp" -->
<%submenuid = 0 
DIM tPages, tArticles, tAccessories, tRetailers, tMarket, tNews, tDownload, tFAQ, tOtherPages, tBicycle
%>
<!--designit name="Labels on the datatypes on the site" descr="" size="2" type="groupstart"-->
<!--/designit-->
<!--designit name="The phrase 'The page'" descr="" size="1" type="asp" varname="tPages" vartype="text"-->
<%
tPages="The page"
%>
<!--/designit-->
<!--designit name="The phrase 'The article'" descr="" size="1" type="asp" varname="tArticles" vartype="text"-->
<%
tArticles="The article"
%>
<!--/designit-->
<!--designit name="The phrase 'The accessory'" descr="" size="1" type="asp" varname="tAccessories" vartype="text"-->
<%
tAccessories="The accessory"
%>
<!--/designit-->
<!--designit name="The phrase 'The retailer'" descr="" size="1" type="asp" varname="tRetailers" vartype="text"-->
<%
tRetailers="The retailer"
%>
<!--/designit-->
<!--designit name="The phrase 'The used bicycle'" descr="" size="1" type="asp" varname="tMarket" vartype="text"-->
<%
tMarket="The used bicycle"
%>
<!--/designit-->
<!--designit name="The phrase 'The news article'" descr="" size="1" type="asp" varname="tNews" vartype="text"-->
<%
tNews="The news article"
%>
<!--/designit-->
<!--designit name="The phrase 'The download document'" descr="" size="1" type="asp" varname="tDownload" vartype="text"-->
<%
tDownload="The download document"
%>
<!--/designit-->
<!--designit name="The phrase 'The FAQ article'" descr="" size="1" type="asp" varname="tFAQ" vartype="text"-->
<%
tFAQ="The FAQ article"
%>
<!--/designit-->
<!--designit name="The phrase 'Other pages on the site'" descr="" size="1" type="asp" varname="tOtherPages" vartype="text"-->
<%
tOtherPages="Other pages on the site"
%>
<!--/designit-->
<!--designit name="The phrase 'The bicycle'" descr="" size="1" type="asp" varname="tBicycle" vartype="text"-->
<%
tBicycle="The bicycle"
%>
<!--/designit-->
<!--designit name="Label" descr="" size="2" type="groupend"-->
<!--/designit-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--designit name="General page information" descr="" size="2" type="groupstart"-->
<!--/designit-->
<!--designit name="Page title" descr="" size="1" type="asp" varname="pagetitle" vartype="text"-->
<%
pagetitle="Search this site"
%>
<!--/designit-->
<!--designit name="Metatag Keywords" descr="" size="3" type="asp" varname="pagekeywords" vartype="text"-->
<%
pagekeywords=""
%>
<!--/designit-->
<!--designit name="Metatag Description" descr="" size="3" type="asp" varname="pagedescription" vartype="text"-->
<%
pagedescription=""
%>
<!--/designit-->
<!--designit name="Label" descr="" size="2" type="groupend"-->
<!--/designit-->
<!--#include virtual="/includes/titleprefix.asp" -->
<title><%=titleprefix&pagetitle%></title>
<!--#include virtual="/includes/head.asp" -->
<%
if pagekeywords="" then pagekeywords=gpagekeywords
if pagedescription="" then pagedescription=gpagedescription
%>
<meta name="keywords" content="<%=pagekeywords%>" />
<meta name="description" content="<%=pagedescription%>" />
</head>
<!--#include virtual="/general/acts/search.asp"-->
<body>
<div id="mother">

<div id="contentHolder">
<div id="topbarsub"><!--#include virtual="/includes/homepagetitle.asp" --><!--#include virtual="/includes/tools.asp" --></div>
<div id="menubar"><!--#include virtual="/includes/topmenu.asp" --></div>

<div id="colSearch">
<div id="text">
<div id="listeBarWide"><%= pagetitle %></div>
<div id="searchlist">
<% if len(searchstr)=0 then %>
<br />
<br />
<!--designit name="Phrases on the page" descr="" size="2" type="groupstart"-->
<!--/designit-->
<!--designit name="Intro text" descr="Shown before the user performs a search" size="2" type="html"-->
Please enter the text you are searching for ...
<!--/designit-->
<% elseif noresults=false then %>
<br />
<!--designit name="Search result headline" descr="" size="2" type="html"-->
The text is found in these places:
<!--/designit-->
<br />
<%= resultHTML %>
<% elseif noresults=true then %>
<br />
<br />
<!--designit name="Text when nothing found" descr="" size="2" type="html"-->
The text can not be found on this site.
<!--/designit-->
<% end if %>
<!--designit name="Label" descr="" size="2" type="groupend"-->
<!--/designit-->
</div>
</div><!--  txt -->
</div><!--  colLeft -->
<div id="colRight">
<!--designit name="The Searchbox ..." descr="" size="2" type="groupstart"-->
<!--/designit-->
<div id="searchbox">
<h3>
<!--designit name="Title" descr="e.g. Search for ..." size="2" type="html"-->
Search for ...
<!--/designit-->
</h3>
<form name="searchbox" method="get" action="">
<br />
<!--designit name="Label for the text field" descr="" size="2" type="html"-->
the text:
<!--/designit-->
<input name="searchstr" type="text" id="searchstr" style="width:130px;" value="<%=searchstr%>" />
<br /><br />
<% Dim tButton %>
<!--designit name="Label on button" descr="" size="1" type="asp" varname="tButton" vartype="text"-->
<%
tButton="Search"
%>
<!--/designit-->
<input type="submit" name="Submit" value="<%=tButton%>" class="submit" style="width:100px; ">
<input name="search" type="hidden" id="search" value="true" />
</form>
</div><!--  searchbox -->
<!--designit name="Label" descr="" size="2" type="groupend"-->
<!--/designit-->
</div><!--  colRight -->
</div><!--  contentHolder -->
<div id="footer"><!--#include virtual="/includes/footer.asp" --></div>
</div><!-- mother -->
<!--#include virtual="/includes/drops.asp" -->
<!--#include virtual="/includes/log.asp"-->
</body>
</html>
