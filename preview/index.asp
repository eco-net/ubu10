<%response.cookies("pageid")=request("id")%>
<html>
<head>
<title>Preview page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<frameset rows="45,*,45" frameborder="NO" border="0" framespacing="0" cols="*"> 
 <frame name="topFrame" scrolling="NO" noresize src="header.asp" frameborder="NO" marginwidth="0" marginheight="0">
 <frame name="previewFrame" src="<%=session("userid")%>.asp" scrolling="AUTO" noresize frameborder="NO" marginwidth="0" marginheight="0">
 <frame name="bottomFrame" scrolling="NO" noresize src="footer.asp" frameborder="NO" marginwidth="0" marginheight="0">
</frameset>
<noframes>
<body bgcolor="#FFFFFF" text="#000000">
</body>
</noframes> 
</html>
