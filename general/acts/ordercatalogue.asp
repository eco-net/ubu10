<%
DIM stat
stat=0
if request("name")<>"" then
	execcommand "INSERT INTO cen_brochureorders (name,street1,street2,zip,city,siteid) VALUES ('" &_
		request("name") & "','" & request("address1") & "','" & request("address2") & "','" &_
		request("zip") & "','" & request("city") & "',"&siteid&")"

	if CINT("0"&request("newsletter"))>0 then subscribe siteid,request("email")
	stat=1
end if
%>