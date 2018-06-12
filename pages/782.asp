<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252" %>
<%option explicit
DIM menuid,siteid,submenuid,pageid,dataid
pageid = "782"
menuid = "672"
%>
<!--#include virtual="/includes/siteid.asp" -->
<%submenuid = "704"


DIM catid, rs, catname, theSQL,prefix
'catid = CINT("0"&request("catid"))
'if catid=0 then catid=728
'set rs = openRS("Select name from eco_data where id="&catid)
'catname = rs("name")

theSQL="Select * from eco_usersharings where parentid=0 and siteid=670 and appid=1"
set rs = openRS(theSQL)
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<!--#include virtual="/includes/titleprefix.asp" --><title><%=titleprefix&"Inspirationsbank"%></title><!--#include virtual="/includes/head.asp" -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<script type="text/javascript" src="/general/x_core.js"></script>
<script type="text/javascript">
function toggleComment(cID)
{
	if(xDisplay('cmt'+cID)=='block')
	{
		xDisplay('cmt'+cID,'none');
	}
	else 
	{
		xDisplay('cmt'+cID,'block');
		var ifr=xGetElementById('i'+cID);
		//alert(ifr.src);
		if(ifr.src==window.location || ifr.src=='')ifr.src='insp_comments.asp?parentid='+cID+'&d=<%=date&time%>';
	}
}
</script>
</head>
<body>

<div id="mother">
<div id="contentHolder">
<div id="topbarsub"><!--#include virtual="/includes/homepagetitle.asp" --><!--#include virtual="/includes/tools.asp" --><div id="topbar_text"><!--#include virtual="/includes/tagline.asp" --></div></div>
<div id="menubar"><!--#include virtual="/includes/topmenu.asp" --></div>

<!-- LEFT MENU -->
<div id="leftmenu">
<img src="/images/leftmenu/top.gif" /><br>
<div id="leftmenu_text">
<table cellpadding="0" cellspacing="0" border="0">
<tr>
<td valign="top">
<!--#include virtual="/includes/leftmenu.asp" -->
</td>
<td><img src="/general/layout/spacer.gif" height="400" width="1"></td></tr>
</table>
<br>
</div><!-- / leftmenu_text -->
<img src="/images/leftmenu/bottom.gif" /><br>
</div><!--  leftmenu -->
<!-- END LEFT MENU -->

<!-- MAIN CONTENT -->
<div id="maincontent">
<h2>
<!--designit name="Overskrift" descr="" size="2" type="html"-->
Inspirationsbank
<!--/designit-->
</h2>
<div id="maincontenttext">
<!--designit name="Indledning" descr="" size="10" type="html"-->
<P>P&aring; denne side har du mulighed for at videregive dine erfaringer med Uddannelse for b&aelig;redygtig Udvikling. Det v&aelig;re sig erfaringer med integration af b&aelig;redygtig udvikling i konkrete fag, med afvikling af aktiviteter eller erfaringer med undervisningsmaterialer. </P>
<P>Du kan ogs&aring; bruge inspirationsbanken til at efterlyse erfaringer eller gode r&aring;d og inspiration fra andre, der arbejder med b&aelig;redygtig udvikling. Samtidig h&aring;ber vi, at du vil v&aelig;re med til at besvare andres sp&oslash;rgsm&aring;l eller kommentere p&aring; deres erfaringer.<BR><BR></P>
<!--/designit-->
<%
do while not rs.eof
	response.write "<table class=""inspresult""><tr>"&_
		"<td valign=""top"" colspan=""2""><span style=""font-size:9px;"">Oprettet af: "&rs("sendername")
		if len(session("username"))>0 then response.Write ", <a href=""mailto:"&rs("sendermail")&""">"&rs("sendermail")&"</a>"
		response.write "</span><h3 style=""margin-top:0px;margin-bottom:0px;"">"&rs("header")&"</h3>"&replace(rs("body"),chr(13),"<br>")&"</td></tr><tr><td>"
	if len(rs("url"))>0 then
		if left(rs("url"),2)="ht" then prefix="" else prefix="http://"
		response.write "<br><a href="""&prefix&rs("url")&""" target=""_blank"">L&aelig;s mere&gt;&gt;</a>"
	end if
	if len(rs("filepath"))>5 then
		response.write "<br><a href="""&rs("filepath")&""" target=""_blank"">Hent fil</a>"
	end if
	response.write "</td>"&_
	"<td valign=""bottom"" align=""right"" style=""font-size:9px;"">"&_
	"<a href=""javascript:;"" onClick=""window.open('insp_opret.asp?parentid="&rs("id")&"','opret','top=100,left=200,width=360,height=560');"">Opret kommentar</a><br>"&_
	"<a href=""javascript:;"" onclick=""toggleComment('"&rs("id")&"')"">Vis/Skjul kommentarer</a>"
	if len(session("username"))>0 then response.Write "<br><a href=""javascript:;"" onclick=""if(confirm('Er du sikker ?\nDenne handling kan ikke fortrydes.'))window.location='act_insp_del.asp?id="&rs("id")&"';"">Slet indlg</a>"
	response.write "</td></tr><tr><td colspan=""2"">"&_
	"<div id=""cmt"&rs("id")&""" style=""display:none;width:340px;height:200px;border:1px solid #FFFFFF""><h3 style=""margin-top:0px;margin-bottom:0px;"">Kommentarer til dette indl&aelig;g:</h3>"&_
	"<iframe id=""i"&rs("id")&""" src="""" scrolling=""auto"" frameborder=""0"" framemargin=""0"" width=""100%"" height=""175"" style=""margin:0px;padding:0px;""></iframe></div>"&_
	"</table>"
	rs.movenext
loop
%>
</div><!-- maincontenttext -->
</div><!-- maincontent -->
<!-- END MAIN CONTENT -->

<div id="colRight">
<!--designit name="Tekst f&aring;r opret-funktion" descr="" size="10" type="html"-->
For at oprette et indl&aelig;g, skal du f&oslash;lge nedenst&aring;ende link og dern&aelig;st f&oslash;lge de indstrukser, der gives.
<!--/designit-->
<p>
<a href="javascript:;" onClick="window.open('insp_opret.asp?parentid=0','opret','top=100,left=200,width=360,height=560');">
<!--designit name="Tekst p&aring; linket til oprettelse" descr="" size="10" type="html"-->
Opret indl&aelig;g
<!--/designit-->
</a>
</p>
<%if request("done")="1" then %>
<h3>
<!--designit name="Bekr&aelig;ftelse p&aring; at indl&aelig;g er oprettet" descr="" size="10" type="html"-->
Dit indl&aelig;g er oprettet.
<!--/designit-->
</h3>
<% end if %>
<%if request("done")="2" then %>
<h3>
<!--designit name="Bekr&aelig;ftelse p&aring; at indl&aelig;g er oprettet" descr="" size="10" type="html"-->
Indl&aelig;gget er slettet
<!--/designit-->
</h3>
<% end if %>
</div><!-- colRight -->

</div><!-- contentHolder -->
<div id="footer"></div>
<div id="footer_text"><!--#include virtual="/includes/footer.asp" --></div>
</div><!-- mother -->
<!-- dropdowns -->
<!--#include virtual="/includes/log.asp" -->
</body>
</html>
