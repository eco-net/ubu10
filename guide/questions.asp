<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/siteid.asp" -->
<%
Dim qid,aid,theSQL,qnum,guideresults,i
qid=cint("0"&split(request("answer"),"_")(2))
aid=cint("0"&split(request("answer"),"_")(1))
prevqid=cint("0"&split(request("answer"),"_")(0))
guideresults=""&session("guideresults")
theSQL="Select top 1 d.id,t0.content as question,t1.content as answer1,t2.content as answer2,t3.content as answer3,"&_
	"t4.content as answer4,t5.content as answer5,c1.catid as qid1,c2.catid as qid2,c3.catid as qid3,c4.catid as qid4,"&_
	"c5.catid as qid5 "&_
	"from (((((((((("&_
	"cen_data d inner join cen_data_texts t0 on d.id=t0.dataid and t0.ckey='question') "&_
	"inner join cen_data_texts t1 on d.id=t1.dataid and t1.ckey='answer1') "&_
	"inner join cen_data_texts t2 on d.id=t2.dataid and t2.ckey='answer2') "&_
	"inner join cen_data_texts t3 on d.id=t3.dataid and t3.ckey='answer3') "&_
	"inner join cen_data_texts t4 on d.id=t4.dataid and t4.ckey='answer4') "&_
	"inner join cen_data_texts t5 on d.id=t5.dataid and t5.ckey='answer5') "&_
	"inner join cen_data_r_cat c1 on d.id=c1.dataid and c1.ckey='answer1question') "&_
	"inner join cen_data_r_cat c2 on d.id=c2.dataid and c2.ckey='answer2question') "&_
	"inner join cen_data_r_cat c3 on d.id=c3.dataid and c3.ckey='answer3question') "&_
	"inner join cen_data_r_cat c4 on d.id=c4.dataid and c4.ckey='answer4question') "&_
	"inner join cen_data_r_cat c5 on d.id=c5.dataid and c5.ckey='answer5question' "&_
	"where "
if qid=1 then ' first question
	theSQL=theSQL&"d.siteid="&siteid&" and d.context=46 order by d.sortnumber"
	session("guideresults")=""
	guideresults=""
	session("curqid")=""
elseif qid>1 then 'next question 
	theSQL=theSQL&" d.id="&qid
	if cint("0"&session("curqid"))<>qid then
		session("curqid")=qid
		guideresults=guideresults&","&prevqid&"_"&aid
		session("guideresults")=guideresults
	end if
else ' no question -> result
	guideresults=guideresults&","&prevqid&"_"&aid
	session("guideresults")=guideresults
	response.redirect "results.asp"
end if
set rsQ=openRS(theSQL)
qnum=ubound(split(guideresults,","))+1
if qnum=0 then qnum=1
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--designit name="Headline" descr="" size="1" type="asp" varname="tHeadline" vartype="text"-->
<%
tHeadline="Cykel guide"
%>
<!--/designit-->
<title><%=tHeadline%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="/general/styles/guide.css" rel="stylesheet" type="text/css">
<link href="/general/styles/global.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
function gonext(theform){
	var i=-1;
	for(var z=0;z<theform.answer.length;z++){if(theform.answer[z].checked==true)i=z;}
	if(i>-1){return true;} 
	else {alert('Please mark an answer');return false;}
}
window.onBlur=window.focus();
</script>
</head>
<body>
<div id="guideMother">
<div id="guideTop"></div>
<div id="guideContentFront">
<div id="listeBar"><%=tHeadline%></div>
<br>
<br>
<div id="bodycontent">
<form action="" method="get" onSubmit="return gonext(this);">
<table width="220" border="0" cellspacing="0" cellpadding="4">
<tr><td class="blue" valign="top"><%=qnum%>.</td><td colspan="2"><strong><%=rsQ("question")%></strong><br></td></tr>
<% i=1
do while len(rsQ("answer"&i))>0 %>
<tr><td>&nbsp;</td><td valign="top"><input name="answer" type="radio" value="<%=rsQ("id")&"_"&i&"_"&rsQ("qid"&i)%>"></td><td width="99%"><%=rsQ("answer"&i)%></td></tr>
<% i=i+1
loop %>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>
<input name="prev" type="hidden" value="1">
<input type="submit" name="Submit" value="Videre" class="submit">
</td>
</tr>
</table>
</form>
</div>
</div><!-- guidecontent -->
<div id="guideFooter"><img src="/general/layout/guideBottom.gif" /></div>
</div>
<!-- guideMother -->
</body>
</html>
