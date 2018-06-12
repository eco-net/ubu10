<!--#include virtual="/general/aspscripts.asp" -->
<% siteid=1 
if pageid>0 then
	if menuid=0 then menuid = getDbFieldValue("eco_data","category","id",pageid,"")
end if
%>