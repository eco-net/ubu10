<%@LANGUAGE="VBSCRIPT"%>
<!--#include virtual="/Connections/ecoinfo.asp"-->
<%
Dim rsPageData
Dim rsPageData_cmd
Dim rsPageData_numRows

Set rsPageData_cmd = Server.CreateObject ("ADODB.Command")
rsPageData_cmd.ActiveConnection = MM_ecoinfo_STRING
rsPageData_cmd.CommandText = "SELECT * FROM ubu_news_maindata" 
rsPageData_cmd.Prepared = true

Set rsPageData = rsPageData_cmd.Execute
rsPageData_numRows = 0
%>
<%=rsPageData("id")%>
<%rsPageData.Close%>
<%
Set rsPageData = Nothing
%>
