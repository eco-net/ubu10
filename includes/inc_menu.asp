<%
'response.write "her"
'response.end
' homepage
DIm rs1,curid,rs2,theSQL,theSel,classTag,imgTag
set rs1=openRS("Select d.id,d.name,d.sortnumber from eco_data d inner join eco_data_pages p on d.id=p.dataid where d.context=1 and d.hidden=0 and d.category="&menuid&" and p.parentid=0 order by d.sortnumber")
response.write "<div id=""leftbar_content"">"&vbcrlf
while not rs1.eof
	curid=rs1("id")
	if Cint(curid)=cint(pageid) then menuid=curid
	
	' skriver xml til hovedmenu
	response.write "<h3><a id=""C"&curid&""" href=""javascript:ShowMenu('D"&curid&"','C"&curid&"');"" class=""niveau0"" onfocus=""this.blur()"">"&rs1("name")&"</a></h3>"&vbcrlf
	response.write "<div class=""subMenu"" id=""D"&curid&""">"&vbcrlf
	response.write "<script language=""JavaScript"" type=""text/JavaScript"">HideMenu('D"&curid&"','C"&curid&"');</script>"&vbcrlf
	response.write "<ul class=""navlist"">"&vbcrlf
	' henter sider i denne menu (=category)
	theSQL = "Select d.id,t.content as name,p.parentid,p.url from (eco_data d inner join eco_data_texts t on d.id=t.dataid and t.ckey='menutitle') inner join eco_data_pages p on d.id=p.dataid where p.parentid="&curid&" and d.hidden=0 order by p.sortnumber"
	'response.write theSQL
	set rs2=openRS(theSQL)
	if not rs2.eof then
		while not rs2.eof
			classtag=""
			imgtag=""
			if cint(rs2("id"))=cint(pageid) then 'selected
				menuid=curid
				theSel="<script language=""JavaScript"" type=""text/JavaScript"">gCurSubMenu='D"&curid&"';gCurMenu='C"&curid&"'</script>"&vbcrlf
				classtag=" class="""
				'imgtag="<img src=""/general/icons/menupil.gif"" border=""0"" width=""4"" height=""7"">&nbsp;"
			end if
			if cint(rs2("parentid"))=0 then 'niveau 1
				if classtag<>"" then classtag=classtag&"niveau1Selected"""
				response.write "<li><a href="""&rs2("url")&""""&classtag&">"&imgtag&rs2("name")&"</a></li>"&vbcrlf
			else 'nuíveau 2
				if classtag<>"" then 
					classtag=classtag&"niveau2Selected"""
				else
					classtag=" class=""sub"""
				end if
				response.write "<li><a href="""&rs2("url")&""""&classtag&">"&imgtag&rs2("name")&"</a></li>"&vbcrlf
			end if
			rs2.movenext
		wend
	end if
	response.write "</ul></div>"&vbcrlf
	rs2.close
'	response.write "</li>"&vbcrlf
	rs1.movenext
wend
'response.write "</ul>"&vbcrlf
set rs1=nothing
set rs2=nothing
response.write theSel
response.write "</div>"&vbcrlf
%>
<script language="JavaScript" type="text/JavaScript">
gCurMenu='C<%=menuid%>';
gCurSubMenu='D<%=menuid%>';
if(gCurMenu!='')ShowMenu(gCurSubMenu,gCurMenu);
</script>
