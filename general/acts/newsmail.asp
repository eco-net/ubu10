<%
DIM stat,email
stat = 0
email=""&request("mail")

if email<>"" then ' tilmelding
	stat = 1
	Subscribe siteid,email
else
	email=""&request("mail2")
	if email<>"" then ' afmelding
		stat = 2
		set rs = openRS("Select id from cen_data where context=35 and siteid="&siteid&" and name='"&email&"'")
		if not rs.eof then
			execCommand "Delete from cen_data_texts where dataid="&rs("id")
			execCommand "Delete from cen_data where id="&rs("id")
		end if
		set rs = nothing
	end if
end if
%>
