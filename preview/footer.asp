<%if request("done")=1 then%>
<script language="JavaScript" type="text/JavaScript">
top.opener.location=top.opener.location
</script>
<% end if %>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="/sitemanager/general/backend.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" text="#000000" class="bgBottom">
<form method="post">
<table border="0" cellspacing="0" cellpadding="5" class="topbar" width="100%">
<tr> 
<td align="right">
<input name="" type="button" value="Close window" onClick="top.window.close();">
<img src="/sitemanager/general/graphics/spacer.gif" width="20" height="3"></td>
</tr>
</table>
</form>
</body>
</html>
