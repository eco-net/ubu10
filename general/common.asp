<%
Function FormatDate(theDate)
	IF LEN(theDate)>0 THEN
		theDate=CDate(theDate)
		FormatDate= Right("0" & DatePart("d",theDate),2) & "-" & right("0" & DatePart("m",theDate),2) & "-" & DatePart("yyyy",theDate) 
	ELSE
		FormatDate="''"
	END IF
End Function
%>