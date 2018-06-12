<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<html>
<head>
<script language="JavaScript" type="text/JavaScript">
function resizewin(){//Resizer og centrere popup-vinduet
	var sw=screen.availWidth,sh=screen.availHeight,iw=lp.width+30,ih=lp.height+60;
	window.moveTo((sw-iw)/2,(sh-ih)/2);
	window.resizeTo(iw,ih);
	window.focus();
}
</script>

<title>Large Image</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body onload="resizewin();">
<img id="lp" src="<%=request("path")%>" border="0">
</body>
</html>
