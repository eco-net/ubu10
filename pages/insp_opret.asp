<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--#include virtual="/general/aspscripts.asp"-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="pragma" content="no-cache">
<title>UBU10</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Content-Language" content="dk">
<link href="/general/styles/styles.css" rel="stylesheet" type="text/css">
</head>
<body style="margin:5px;">
<div id="publishBox">
<h4>
<!--designit name="Header for uploading area" descr="" size="2" type="html"--> 
Opret indl&aelig;g / kommentar<!--/designit-->
</h4>
<!--designit name="Errormessage when mandatory data is missing from upload-form." descr="" size="1" type="javascript" varname="errorText" vartype="text"-->
<script language="JavaScript">
errorText='Navn, email, overskrift og tekst skal udfyldes.'
</script>
<!--/designit-->
<form name="upload" action="act_insp.asp" method="post" enctype="multipart/form-data" onSubmit="if(!this.header.value.length || !this.sendername.value.length || !this.mail.value.length || !this.body.value.length){alert(errortext);return false} else {return true};">
<table width="100%" border="0" cellpadding="2" cellspacing="0">
<tr>
<td>
<!--designit name="Label for name field" descr="" size="2" type="html"-->
Navn:
<!--/designit-->
</td>
</tr>
<tr>
<td valign="top"><input name="sendername" type="text" class="input" id="sendername" style="width:320px;" maxlength="100"></td>
</tr>
<tr>
<td>
<!--designit name="Label for name field" descr="" size="2" type="html"-->
Email-adresse: (Udfyldes kun, hvis du vil modtage en mail, når der kommer kommentarer til indlægget. Din email-adresse vil kun være kendt af redaktionen.)
<!--/designit-->
</td>
</tr>
<tr>
<td valign="top"><input name="mail" type="text" class="input" style="width:320px;" maxlength="100"></td>
</tr>
<tr>
<td>
<!--designit name="Label for name field" descr="" size="2" type="html"-->
Overskrift:
<!--/designit-->
</td>
</tr>
<tr>
<td valign="top"><input name="header" type="text" class="input" style="width:320px;" maxlength="100"></td>
</tr>
<tr>
<td>
<!--designit name="Label for description field" descr="" size="2" type="html"-->
Tekst:
<!--/designit-->
</td>
</tr>
<tr>
<td valign="top"><textarea name="body" style="width:320px;" class="textarea" cols="" rows="10" wrap="virtual"></textarea></td>
</tr>
<tr>
<td>
<!--designit name="Label for file-field" descr="" size="2" type="html"-->
URL til mere info:
<!--/designit-->
</td>
</tr>
<tr>
<td valign="top"><input name="url" type="text" class="file" style="width:320px;" lang="en" maxlength="100"/></td>
</tr>
<tr>
<td>
<!--designit name="Label for file-field" descr="" size="2" type="html"-->
Fil/Dokument:
<!--/designit-->
</td>
</tr>
<tr>
<td valign="top"><input name="file" type="file" class="file" style="width:320px;" lang="en" maxlength="100"/></td>
</tr>
<tr><td>
</td></tr>
</table>
<!--designit name="Label for submit button" descr="" size="1" type="asp" varname="btnLabel" vartype="text"-->
<%btnLabel="Publish"%>
<!--/designit-->
<input type="hidden" name="parentid" value="<%=request("parentid")%>" />
<p><input type="submit" name="Submit" value="Opret" class="submit" style="width:100px"></p>
</form>
</div>
</body>
</html>

