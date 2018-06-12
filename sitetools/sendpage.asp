<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252" %>
<%
DIM menuid,siteid,submenuid,pageid,tSubject,tBeforelink,tAfterlink,tYourcomments
pageid = 720
menuid = 0 %>
<!--#include virtual="/includes/siteid.asp" -->
<%submenuid = 0 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--designit name="The mail text" descr="" size="2" type="groupstart"-->
<!--/designit-->
<!--designit name="Text before link to the page and users comments" descr="" size="3" type="asp" varname="tBeforelink" vartype="text"-->
<%
tBeforelink="A friend of yours has found a page on www.kildemoes.dk that he or she think might interest you:"
%>
<!--/designit-->
<!--designit name="The phrase 'Your comments here'" descr="" size="1" type="asp" varname="tYourcomments" vartype="text"-->
<%
tYourcomments="Your comments here"
%>
<!--/designit-->
<!--designit name="Text after link to the page and users comments" descr="" size="3" type="asp" varname="tAfterlink" vartype="text"-->
<%
tAfterlink="----------------------------------------------------<br><br>If you in the future would like to know more about Kildemoes, subscribe to our newsletter at http://www.kildemoes.dk/pages/newsletter.asp"
%>
<!--/designit-->
<!--designit name="Label" descr="" size="2" type="groupend"-->
<!--/designit-->
<head>
<% DIM tMail
tMail=tBeforelink&vbcrlf&vbcrlf&request("url")&vbcrlf&vbcrlf&tYourcomments&vbcrlf&vbcrlf&tAfterlink
%>
<!--designit name="General page information" descr="" size="2" type="groupstart"-->
<!--/designit-->
<!--designit name="Page title" descr="" size="1" type="asp" varname="pagetitle" vartype="text"-->
<%
pagetitle="Send page"
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
<!--#include virtual="/general/acts/sendmail.asp" -->
<!--#include virtual="/includes/titleprefix.asp" -->
<title><%=titleprefix&pagetitle%></title>
<!--#include virtual="/includes/head.asp" -->
<%
if pagekeywords="" then pagekeywords=gpagekeywords
if pagedescription="" then pagedescription=gpagedescription
%>
<meta name="keywords" content="<%=pagekeywords%>" />
<meta name="description" content="<%=pagedescription%>" />
<script language="JavaScript">
function dosend(theform){
	if(!theform.frommail.value.length || !theform.tomail.value.length || !theform.subject.value.length){
		alert(tAll);return false;
	} else if(theform.frommail.value.indexOf('@')==-1 || theform.frommail.value.indexOf('.')==-1) {
		alert(tFrommail);return false;
	} else if(theform.tomail.value.indexOf('@')==-1 || theform.tomail.value.indexOf('.')==-1) {
		alert(tTomail);return false;
	} else{return true};
}
</script>
</head>
<body>
<div id="mother">

<div id="contentHolder">
<div id="topbarsub"><!--#include virtual="/includes/homepagetitle.asp" --><!--#include virtual="/includes/tools.asp" --></div>
<div id="menubar"><!--#include virtual="/includes/topmenu.asp" --></div>


<div id="colLeft">
<div id="text">
<div id="listeBarXL"><%= pagetitle %></div>
<% if stat=0 then %>
<!--designit name="The form" descr="" size="2" type="groupstart"-->
<!--/designit-->

<form action="" method="get" onSubmit="return dosend(this);">
<table class="searchresultsTABLE">
<tr> 
<td>
*
<!--designit name="Label for 'Your email'" descr="" size="1" type="html"-->
Your email
<!--/designit-->
:
</td>
<td width="150"><input name="frommail" type="text" class="input" id="name" size="30"> 
</td>
</tr>
<tr>
<td>
*
<!--designit name="Label for 'Recievers email'" descr="" size="1" type="html"-->
Recievers email
<!--/designit-->
:
</td>
<td><input name="tomail" type="text" class="input" id="adress" size="30"></td>
</tr>
<tr>
<td>
*
<!--designit name="Label for 'Mail subject'" descr="" size="1" type="html"-->
Mail subject
<!--/designit-->
:
</td>
<!--designit name="Default subject" descr="" size="1" type="asp" varname="tSubject" vartype="text"-->
<%
tSubject="A tip from Kildemoes"
%>
<!--/designit-->
<td><input name="subject" type="text" class="input" id="adress" size="30" value="<%=tSubject%>"></td>
</tr>
<tr>
<td valign="top">
<!--designit name="Label for 'Your comments'" descr="" size="1" type="html"-->
Your comments
<!--/designit-->
:
</td>
<td><textarea name="comments" style="height:100px;width:165px;font-size:11px;font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;"></textarea></td>
</tr>
<tr>
<td>&nbsp;</td><td>
<table border="0" cellpadding="0" cellspacing="0" width="165px"><tr valign="top"><td>
<input name="newsletter" type="checkbox" class="input" id="newsletter" value="1" /> 
</td><td>
<!--designit name="Label for recieving newsletter" descr="" size="1" type="html"-->
Yes, I would like to recieve the newsletter 
<!--/designit-->
</td></tr></table>
</td>
</tr>
<tr> 
<td>&nbsp;</td>
<td width="150" align="right" valign="baseline">&nbsp;</td>
</tr>
<tr> 
<td>&nbsp;</td>
<td align="center" valign="baseline">
<!--designit name="Label for submit button" descr="" size="1" type="asp" varname="tButton" vartype="text"-->
<%
tButton="Send mail"
%>
<!--/designit-->
<input name="tmail" type="hidden" value="<%=tMail%>" />
<input name="url" type="hidden" value="<%=request("url")%>" />
<input name="yourcomments" type="hidden" value="<%=tYourcomments%>" />
<input type="submit" name="Submit" value="<%=tButton%>" class="submit" style="width:80px;" />
</td>
</tr>
</table>
</form>
<!--designit name="Error message when not all reqiured fields have content" descr="" size="1" type="javascript" varname="var tAll" vartype="text"-->
<script language="JavaScript">
var tAll='Fieds with a * are mandatory';
</script>
<!--/designit-->
<!--designit name="Error message when the field 'Your mail' is not a valid email address" descr="" size="1" type="javascript" varname="var tFrommail" vartype="text"-->
<script language="JavaScript">
var tFrommail='Your email is not valid';
</script>
<!--/designit-->
<!--designit name="Error message when the field 'Recievers mail' is not a valid email address" descr="" size="1" type="javascript" varname="var tTomail" vartype="text"-->
<script language="JavaScript">
var tTomail='The recievers email address is not valid.';
</script>
<!--/designit-->

<div id="sendmail">
<table class="searchresultsTABLE">
<tr> 
<td>
<h5>
<!--designit name="Header to the mail example mail" descr="" size="2" type="html"-->
This is what your mail will look like:
<!--/designit-->
</h5>
</td></tR>
<tr><td>
<%=replace(tMail,chr(13),"<br>")%></td></tr>
</table>
</div>
<!--designit name="Label" descr="" size="2" type="groupend"-->
<!--/designit-->

<% elseif stat = 1 then ' Mail er sendt %>
<br />
<br />
<table border="0" cellpadding="0" cellspacing="0" align="center"><tr><td>
<!--designit name="The Confirmation" descr="" size="2" type="groupstart"-->
<!--/designit-->
<!--designit name="Confirmation when sending" descr="" size="2" type="html"-->
<h5>Your mail has been sent.</h5>
<!--/designit--> 
<!--designit name="Label for Return-to-list link" descr="" size="1" type="asp" varname="tBack" vartype="text"-->
<%
tBack="Back to page"
%>
<!--/designit-->
<br /><br />
<br />
<br />
<br />
<a href="<%=request("url")%>"><img src="/general/layout/pil_hvid.gif" style="border:0px;margin:0px;" border="0" width="10" height="10"><%=tBack%></a>
</td></tr></table>
<!--designit name="Label" descr="" size="2" type="groupend"-->
<!--/designit-->
<% end if 'state controller %>
</div><!--  txt -->
</div><!--  colLeft -->
</div><!--  contentHolder -->
<div id="footer"><!--#include virtual="/includes/footer.asp" --></div>
</div><!-- mother -->
<!--#include virtual="/includes/drops.asp" -->
<!--#include virtual="/includes/log.asp"-->
</body>
</html>
