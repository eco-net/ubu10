<%
dim sql,rs,i
sql="Select "&topdef&" d.name,da.content as ndate, t1.content as body, t2.content as place, m.filepath as image "&_
	"from(((("&_
	"eco_data d inner join eco_data_dates da on d.id=da.dataid) "&_
	"inner join eco_data_texts t1 on d.id=t1.dataid and t1.ckey='body') "&_
	"inner join eco_data_texts t2 on d.id=t2.dataid and t2.ckey='imageloc') "&_
	"inner join eco_data_integers i on d.id=i.dataid and i.ckey='image') "&_
	"left outer join eco_data_media m on i.val=m.dataid and m.ckey='image' "&_
	" where context=16 and hidden=0 order by ndate Desc"
set rs = openrs(sql)
if not rs.eof then
	if topdef="" then
		for i=1 to topcount
			if not rs.eof then rs.movenext
		next
	end if
	response.write "<h2>Aktuelt</h2>"
	do while not rs.eof
		if rs("image")<>"" then
			CreateNewsarticleWithImage
		else
			CreateNewsarticleNoImage
		end if
		rs.movenext
	loop
	if topdef<>"" then response.write "<p align=""right""><br><a href=""newsarchive.asp"">Se ældre nyheder i Nyhedsarkivet&gt;&gt;</a>"
end if
set rs=nothing 


Sub CreateNewsarticleWithImage
%>
<table border="0" cellpadding="0" cellspacing="0">
<tr><td>
<%
if rs("place")="b" then response.write GetText(rs("body"),rs("name"),rs("ndate"))
 if rs("place")="v" then %>
	<table width="1" cellpadding="0" cellspacing="0" align="left" style="margin-right:5px;"><tr><td>
<% elseif rs("place")="h" then %>
	<table width="1" cellpadding="0" cellspacing="0" align="right" style="margin-left:5px;"><tr><td>
<% elseif rs("place")="t" then %>
	<table cellpadding="0" cellspacing="0" width="100%" style="margin-bottom:5px;"><tr><td>
<% elseif rs("place")="b" then %>
	<table cellpadding="0" cellspacing="0" width="100%" style="margin-top:5px;"><tr><td>
<% end if %>
<img src="<%=rs("image")%>" border="0"<%=GetAlign(rs("place"))%>>
</td></tr></table>
<%if rs("place")<>"b" then response.write GetText(rs("body"),rs("name"),rs("ndate"))%>
</td></tr>
</table>
<%
END SUB


Sub CreateNewsarticleNoImage
%>
<table border="0" cellpadding="0" cellspacing="0">
<tr><td>
<%=GetText(rs("body"),rs("name"),rs("ndate"))%>
</td></tr>
</table>
<%
END SUB


FUNCTION GetAlign(str)
	if str="t" or str="b" then 
		GetAlign=""
	elseif str="v" then
		GetAlign=" align=""left"""
	elseif str="h" then
		GetAlign=" align=""right"""
	end if		
END FUNCTION

FUNCTION GetText(str,header,ndate)
	if instr(str,"<P>")=0 and instr(str,"<BR>")=0 and instr(str,"<p>")=0  and instr(str,"<br>")=0 then
		str=replace(str,chr(13),"<br>")
	end if
	str="<h1>" & header&"</h1><b style=""color:#696969"">"&FormatDate(ndate)&"</b>. "&str
	GetText=str
END FUNCTION

Function FormatDate(ndate)
	FormatDate=datepart("d",ndate)&"."&datepart("m",ndate)&"."&datepart("yyyy",ndate)
END Function
%>