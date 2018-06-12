<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--designit name="Headline" descr="" size="1" type="asp" varname="tHeadline" vartype="text"-->
<%
tHeadline="Cykelguide"
%>
<!--/designit-->
<title><%=tHeadline%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="/general/styles/guide.css" rel="stylesheet" type="text/css">
<link href="/general/styles/global.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="guideMother">
<div id="guideTop"></div>
<div id="guideContentFront">
<div id="listeBar"><%=tHeadline%></div>
<br>
<br>
<div id="bodycontent">
<!--designit name="Intro text" descr="" size="10" type="html"-->
Svar på 3 spørgsmål og lad cykelguiden anbefale den/de cykler der passer til dit behov. <br><br>
Det tager kun et øjeblik.
<!--/designit--> 
<br>
<br>
<br>
<a href="questions.asp?answer=0_0_1">
<!--designit name="Link to start the guide" descr="" size="2" type="html"-->
Start cykelguiden
<!--/designit-->
</a>
<br>
<br>
<br>
<a href="about.asp">
<!--designit name="Link to About page" descr="Leave empty if you do not want to use this page" size="2" type="html"-->
Læs mere om cykelguiden
<!--/designit-->
</a>
</div>
</div><!-- guidecontent -->
<div id="guideFooter"><img src="/general/layout/guideBottom.gif" /></div>
</div>
<!-- guideMother -->
</body>
</html>
