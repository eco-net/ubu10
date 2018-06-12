<%
	IF LEN(session("siteid"))=0 or len(session("userid"))=0 or len(session("level"))=0 THEN
		if LEN(request("username"))=0 then
			userid=request.cookies("beloginname")
			userpw=request.cookies("beloginpw")
		END IF
		IF Len(userid)<2 THEN 
			userid=replace(replace(request("username"),"'","''"),"*","")
			userpw=replace(replace(request("password"),"'","''"),"*","")
		END IF
		IF Len(userid)<2 THEN
			response.redirect("/login/login.asp")
			response.end
		END IF
		SET rsData=server.CreateObject("ADODB.recordset")
		rsData.activeConnection=MM_data_STRING
		rsData.source="SELECT d.id, d.siteid, d.name as username,t.content as password,t2.content as userlevel FROM ((eco_data d inner join eco_data_texts t on d.id=t.dataid and t.ckey='password') inner join eco_data_r_cat c on d.id=c.dataid) inner join eco_data_texts t2 on c.catid=t2.dataid and t2.ckey='userlevel' WHERE d.name='" & userid & "' AND t.content='" & userpw & "'"

		rsData.open()
		IF NOT rsData.EOF THEN 
			session("userid")=rsData.Fields.Item("id").value
			session("level")=CINT("0" & rsData.Fields.Item("userlevel").value)
			session("username")=rsData.Fields.Item("username").value
			session("siteid")=rsData.Fields.Item("siteid").value
			response.cookies("siteid")=session("siteid")
			response.cookies("userid")=session("userid")
			response.cookies("beloginpw")=rsData.Fields.Item("password").value
			response.cookies("beloginname")=rsData.Fields.Item("username").value
			response.cookies("beloginpw")=rsData.Fields.Item("password").value
			
			session.timeout=1000
'			IF LEN(request("username"))>0 THEN
				if rsData.Fields.Item("siteid").value=0 then
					response.redirect("782.asp")
				else
					response.redirect("782.asp")
				end if
'			END IF
		ELSE			
			IF LEN(request("username"))=0 THEN
				response.redirect("login.asp")
			ELSE
				IF LEN(request("error"))>0 THEN
					response.redirect("login.asp")
				ELSE
					response.redirect("login.asp?error=1")				
				END IF
			END IF
		END IF
		rsData.close()
		rsData=""
	END IF
%>