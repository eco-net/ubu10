<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--designit name="Headline" descr="" size="1" type="asp" varname="tHeadline" vartype="text"-->
<% 
tHeadline="Cykel Guiden"
%>
<!--/designit-->
<!--designit name="Price-tag" descr="Write xx where the price should be. E.g. 'Price: ## DDK'." size="1" type="asp" varname="tPrice" vartype="text"-->
<% 
tPrice="Pris: xx Kr."
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
<div id="guideContentResult">
<div id="listeBar"><%=tHeadline%></div>
<br>
<br>
<div id="bodycontent">
<!--designit name="Introtext" descr="" size="5" type="html"-->
Cykelguiden har fundet følgende cykler til dig:
<!--/designit-->
<br>
<br>
<iframe id="mainframe" name="mainframe" src="_results.asp?tprice=<%=tPrice%>" frameborder="0" framemargin="0" width="350" height="200" scrolling="yes">
</iframe>
<br>
<br>
<br>
<a href="questions.asp?answer=0_0_1">
<!--designit name="Link to start the guide" descr="" size="2" type="html"-->
Kør guiden igen.
<!--/designit-->
</a>
</div>
</div><!-- guidecontent -->
<div id="guideFooter"><img src="/general/layout/guideBottom2.gif" /></div>
</div>
<!-- guideMother -->
</body>
</html>
