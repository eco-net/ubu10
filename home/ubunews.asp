<!--#include virtual="Connections/ecoinfo.asp" -->
<!--#include virtual="general/common.asp"-->
<%
set rsNews = Server.CreateObject("ADODB.Recordset")
rsNews.ActiveConnection = MM_ecoinfo_STRING
rsNews.Source = "SELECT * FROM ubu_news_maindata ORDER BY createdate desc"
rsNews.CursorType = 0
rsNews.CursorLocation = 2
rsNews.LockType = 3
rsNews.Open()
if not rsNews.EOF then
while not rsNews.EOF 
str="<p><strong>" & rsNews("title") & "<br>" & FormatDate(rsNews("createdate")) & "</strong></p><p>" & rsNews("shortdescription") & "</p>"
if rsNews("description")<>"" then
str=str & "<p><a href='/pages/news.asp?id=" & rsNews("id") & "'>Læs mere</a></p>"
else
str=str & "<p>&nbsp;</p>"
end if
response.write str
rsNews.MoveNext
wend
end if
rsNews.Close

%>