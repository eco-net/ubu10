<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="//sitemanager/general/common.asp"-->
<%
set rs = openRS("Select filepath from eco_usersharings where id="&request("id"))
if len(rs("filepath"))>5 then DeleteFile(rs("filepath"))
execCommand "Delete from eco_usersharings where parentid="&request("id")
execCommand "Delete from eco_usersharings where id="&request("id")
if cint("0"&request("parentid"))>0 then
	response.redirect "insp_comments.asp?parentid="&request("parentid")
else
	response.redirect "782.asp?done=2"
end if
%>
