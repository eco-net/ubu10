<%
DIM stat,theSQL,rsC,dataid,rsQ
'init
stat=0
if len(request("thename"))>0 then
	stat=1
	submitForm()
	if CINT("0"&request("newsletter"))>0 and len(request("email"))>0 then subscribe siteid,request("email")
else
end if

SUB submitForm()
	DIM thename,adr1,adr2,zip,city,email,theid,x,item,delim
	thename=replace(request("thename"),"'","''")
	adr1=replace(request("address1"),"'","''")
	adr2=replace(request("address2"),"'","''")
	zip=replace(request("zip"),"'","''")
	city=replace(request("city"),"'","''")
	email=replace(request("email"),"'","''")
	
	'Inserting personal info, creating the record
	theSQL="INSERT INTO cen_competition_submittions (dataid,name,street1,street2,zip,city,region,country,email) VALUES (" &_
		dataid & ",'" & thename & "','" & adr1 & "','" & adr2 & "','" &_
		zip & "','" & city & "','','','" &_
		email & "')"
	
	theid=InsertRec(theSQL,"cen_competition_submittions","id","")
	
	' inserting answers
	theSQL="Update cen_competition_submittions SET "
	x=1
	FOR EACH ITEM IN request("qnum")
		IF request("qtype")(x)="t" THEN delim="'" ELSE delim=""
		IF x>1 THEN theSQL=theSQL & ","
		theSQL=theSQL & "q" & item & "=" & delim & replace(request("answer")(x),"'","''") & delim
		x=x+1
	NEXT
	theSQL=theSQL&" WHERE id="&theid
	execCommand theSQL
END SUB

%>
