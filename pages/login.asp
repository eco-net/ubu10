<%session.abandon() 
	labelHeader="Log ind"
	labelError="De indtastede oplysninger findes ikke i brugerkartoteket. Prøv igen:"
	labelLead="Log venligst ind ved at udfylde felterne nedenfor:"
	labelusername="Brugernavn: "
	labelPassword="Adgangskode: "
	labelBtn="Log ind"
%>
<html>
<head>
<title>Designit CMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<TABLE WIDTH=798 BORDER=0 CELLPADDING=0 CELLSPACING=0>
<!-- branding -->
<TR>
<TD width="798">
</TD>
</TR>
<TR>
<TD height="28">
<TABLE WIDTH=798 BORDER=0 CELLPADDING=0 CELLSPACING=0>
<!-- menubar -->
<TR>
<TD width="798"></TD>
</TR>
</TABLE>
</TD>
</TR>
<tr><td>

<br>
<br>
<br>

<table width="350" border="0" cellpadding="10" cellspacing="0" align="center">
<tr>
<td class="headline"><%= labelHeader %><br><br>
</td>
</tr>
</table>


<table width="350" border="0" cellpadding="2" cellspacing="0" align="center"><form method="post" action="act_login.asp"><tr>
<td width="6"><img src="/general/graphics/spacer.gif" width="6" height="1"></td>
<td colspan="2">
<% if CINT("0" & request("error"))>0 then %>
<strong><%= labelError %></strong>
<%else%>
<strong><%= labelLead %></strong>
<% end if %>
<br><br>
</td>
</tr>
<tr>
<td width="6"><img src="/general/graphics/spacer.gif" width="6" height="1"></td>
<td><%= labelUsername %></td><td><input type="text" name="username" class="textareasmall"></td>
</tr>
<tr>
<td width="6"><img src="/general/graphics/spacer.gif" width="6" height="1"></td>
<td><%= labelPassword %></td><td><input type="password" name="password" class="textareasmall"></td>
</tr>
<tr>
<td width="6"><img src="/general/graphics/spacer.gif" width="6" height="1"></td>
<td colspan="2"><br>
<br>

<div align="center">
<input type="hidden" name="error" value="<%=request("error")%>">
<input type="submit" name="Submit" value="<%= labelBtn %>" class="button">
</div>
</td></tr>
</form></table>

</td></tr></TABLE>
<script language="JavaScript">
document.forms[0].username.focus();
</script>
</body>
</html>

