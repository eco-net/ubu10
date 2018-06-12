<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% dim siteid,pageid,dataid,menuid,submenuid %>
<!--#include virtual="/includes/siteid.asp" -->
<%
Dim guideresults,arrGuideresults,arrAnswer,qid,qnum,tPrice
guideresults=session("guideresults")
arrGuideresults=split(guideresults,",")
tPrice=request("tprice")
theSQL="Select d.id,d.name "&_
	"from (("&_
	"cen_data d "&_
	"inner join cen_guideresults_r_questions g1 on d.id=g1.dataid) "&_
	"inner join cen_guideresults_r_questions g2 on d.id=g2.dataid) "&_
	"inner join cen_guideresults_r_questions g3 on d.id=g3.dataid "&_
	"where 0=0 "
for i=1 to ubound(arrGuideresults)
	arrAnswer=split(arrGuideresults(i),"_")
	theSQL=theSQL&"and g"&i&".qid="&arrAnswer(0)&" and g"&i&".aid="&arrAnswer(1)&" "
next
'response.write theSQL&"<br><br>"
set rsR=openRS(theSQL)
resultid=rsR("id")
bikeids="0"
set rsR=openRS("Select catid from cen_data_r_cat where dataid="&resultid&" and ckey='bicycle'")
do while not rsR.eof
	bikeids=bikeids&","&rsR("catid")
	rsR.movenext
loop
'bikeids=mid(bikeids,2)
theSQL="Select d.id,t.content as name,f.val as price,m.filepath from (((cen_data d "&_
	"inner join cen_data_texts t on d.id=t.dataid and t.ckey='menuname') "&_
	"inner join cen_data_floats f on d.id=f.dataid and f.ckey='price') "&_
	"inner join cen_data_integers i on d.id=i.dataid and i.ckey='smallimage') "&_
	"inner join cen_data_media m on i.val=m.dataid and m.ckey='image' "&_
	"where d.id in ("&bikeids&")"
'response.write theSQL&"<br><br>"
set rsR=openRS(theSQL)
menuid=siteid
dataid=resultid
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="/general/styles/guide.css" rel="stylesheet" type="text/css">
<link href="/general/styles/global.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript" src="/general/drops.js">></script>
</head>
<body id="bikelist">
<% do while not rsR.eof
	response.write "<table border=""0"" cellspacing=""0"" cellpadding=""0"" width=""100%""><tr>"&vbcrlf
	response.write "<td width=""110""><a href=""/pages/bicycle.asp?id="&rsR("id")&""" target=""main""><img src="""&rsR("filepath")&""" border=""0"" width=""100""></a></td>"&vbcrlf
	response.write "<td valign=""top""><br><a href=""/pages/bicycle.asp?id="&rsR("id")&""" target=""main""><b>"&rsR("name")&"</b></a><br><br><span class=""blue"">"&replace(tPrice,"xx",rsR("price"))&"</span></td></tr></table>"&vbcrlf&vbcrlf
	rsR.movenext
loop %>
<!--#include virtual="/includes/log.asp" -->
</body>
</html>
