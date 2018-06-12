<%
DIM catid, rs, catname, id
catid = CINT("0"&request("catid"))
id = CINT("0"&request("id"))

submenuid=catid
if catid=0 and id=0 then response.redirect "accessoriesindex.asp"

if catid>0 then
	set rs = openRS("Select name from cen_data where id="&catid)
	catname = rs("name")
	set rs = openRS("Select d.id,t1.content as name, t2.content as text, m.filepath as img from "&_
		"((("&_
		"cen_data d inner join cen_data_texts t1 on d.id=t1.dataid and t1.ckey='name') "&_
		"inner join cen_data_texts t2 on d.id=t2.dataid and t2.ckey='description') "&_
		"inner join cen_data_integers i on d.id=i.dataid and i.ckey='image') "&_
		"inner join cen_data_media m on i.val=m.dataid and m.ckey='image' "&_
		"where d.context=28 and d.hidden=0 and d.siteid="&siteid&" and d.category="&catid&" order by d.sortnumber")
else
	set rs = openRS("Select name from cen_data where id="&id)
	catname = rs("name")
	set rs = openRS("Select d.id,t1.content as name, t2.content as text, m.filepath as img from "&_
		"((("&_
		"cen_data d inner join cen_data_texts t1 on d.id=t1.dataid and t1.ckey='name') "&_
		"inner join cen_data_texts t2 on d.id=t2.dataid and t2.ckey='description') "&_
		"inner join cen_data_integers i on d.id=i.dataid and i.ckey='image') "&_
		"inner join cen_data_media m on i.val=m.dataid and m.ckey='image' "&_
		"where d.id="&id)
end if
%>