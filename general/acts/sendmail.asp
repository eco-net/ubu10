<%
Dim theBody, stat
stat=0

if len(request("toMail"))>0 then
	theBody = replace(replace(request("tMail"),request("yourcomments"),request("comments")),chr(13),"<bR>")
	DoSendMails request("tomail"),request("frommail"),request("subject"),theBody
	if CINT("0"&request("newsletter"))>0 then subscribe siteid,request("fromMail")
	stat=1
end if

SUB DoSendMails(strTo,strFrom,thesubj,thebody)
	
	if len(strTo)>0 then
		dim msg, conf
		set msg = server.CreateObject("CDO.Message")
		set conf = server.CreateObject("CDO.Configuration")
		conf.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "mail.dir.dk"
		conf.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
		conf.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
		conf.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
		conf.Fields.Update
		
		msg.configuration = conf
		msg.MimeFormatted=True
		msg.To = strTo
		msg.From = strFrom
		msg.subject = thesubj
		msg.HTMLBody = thebody
		msg.autoGenerateTextBody = true
		msg.send()
	end if
END SUB
%>