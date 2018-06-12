<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252" %>
<%
sesid=Cint("0"&session("eco_sessionid"))
IF sesid=0 THEN
	sesid=1
	writelog date&" "&time
	session("eco_sessionid")=1
	Session.Timeout=20
END IF

Sub Writelog(theStr)
   Const ForReading = 1, ForWriting = 2, ForAppending = 8
   Dim fso, f
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set f = fso.OpenTextFile(server.MapPath("log.txt"), ForAppending, True)
   f.Write theStr&vbcrlf
   f.Close
End Sub
%>