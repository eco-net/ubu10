<%
DIM rs, prefix, noresults, resultHTML
DIM searchstr
searchstr=""&request("searchstr")
response.cookies("searchstr")=searchstr
noresults=false
'siteid=1
if len(searchstr)>0 then ' Searching for the term
	noresults=true
	set mi = new menuinfo
	mi.init()
	if mi.cat_hidden=0 then	SearchCatalogue
	if mi.art_hidden=0 then	SearchLifestyle
	if mi.acc_hidden=0 then	SearchAccessories
	if mi.ret_hidden=0 then	SearchRetailers
	if mi.mar_hidden=0 then	SearchMarket
	if mi.abo_hidden=0 then	SearchAbout
	SearchOtherPages
	response.write noresults
end if

SUB SearchCatalogue
	DIM theSQL,rs
	theSQL = "Select distinct d.id,d.name,d.sortnumber,d.context,d.category,p.url from (cen_data d "&_
		"inner join cen_data_texts t on d.id=t.dataid) "&_
		"left outer join cen_data_pages p on d.id=p.dataid "&_
		"where d.siteid="&siteid&" and (d.category="&mi.cat_id&" or d.context=21) and t.content like '%"&searchstr&"%' "&_
		"and d.hidden=0 order by d.context,d.category,d.sortnumber"
	set rs = openRS(theSQL)
	if not rs.eof then
		noresults=false
		resultHTML=resultHTML&"<br><h5>"&mi.cat_name&"</h5>"&"<ul>"
		do while not rs.eof
			if rs("context")=1 then prefix=tPages&" <a href="""&rs("url")&""">" else prefix=tBicycle&" <a href=""/pages/bicycle.asp?id="&rs("id")&""">"
			resultHTML=resultHTML&"<li>"&prefix&"<b>"&rs("name")&"</b></a></li>"
			rs.movenext
		loop
		resultHTML=resultHTML&"</ul>"
	end if
END SUB

SUB SearchLifestyle
	DIM theSQL,rs
	theSQL = "Select distinct d.id,d.name,d.sortnumber,d.context,d.category,p.url from (cen_data d "&_
		"inner join cen_data_texts t on d.id=t.dataid) "&_
		"left outer join cen_data_pages p on d.id=p.dataid "&_
		"where d.siteid="&siteid&" and (d.category="&mi.art_id&" or d.context=26) and t.content like '%"&searchstr&"%' "&_
		"and d.hidden=0 order by d.context,d.category,d.sortnumber"
	set rs = openRS(theSQL)
	if not rs.eof then
		noresults=false
		resultHTML=resultHTML&"<br><h5>"&mi.art_name&"</h5>"&"<ul>"
		do while not rs.eof
			if rs("context")=1 then prefix=tPages&" <a href="""&rs("url")&""">" else prefix=tArticles&" <a href="""&rs("url")&""">"
			resultHTML=resultHTML&"<li>"&prefix&"<b>"&rs("name")&"</b></a></li>"
			rs.movenext
		loop
		resultHTML=resultHTML&"</ul>"
	end if
END SUB

SUB SearchAccessories
	DIM theSQL,rs
	theSQL = "Select distinct d.id,d.name,d.sortnumber,d.context,d.category,p.url from (cen_data d "&_
		"inner join cen_data_texts t on d.id=t.dataid) "&_
		"left outer join cen_data_pages p on d.id=p.dataid "&_
		"where d.siteid="&siteid&" and (d.category="&mi.acc_id&" or d.context=28) and t.content like '%"&searchstr&"%' "&_
		"and d.hidden=0 order by d.context,d.category,d.sortnumber"
	set rs = openRS(theSQL)
	if not rs.eof then
		noresults=false
		resultHTML=resultHTML&"<br><h5>"&mi.acc_name&"</h5>"&"<ul>"
		do while not rs.eof
			if rs("context")=1 then prefix=tPages&" <a href="""&rs("url")&""">" else prefix=tAccessories&" <a href=""/pages/accessorieslist.asp?id="&rs("id")&""">"
			resultHTML=resultHTML&"<li>"&prefix&"<b>"&rs("name")&"</b></a></li>"
			rs.movenext
		loop
		resultHTML=resultHTML&"</ul>"
	end if
END SUB

SUB SearchRetailers
	DIM theSQL,rs
	theSQL = "Select distinct d.id,d.name,d.sortnumber,d.context,d.category,p.url from (cen_data d "&_
		"inner join cen_data_texts t on d.id=t.dataid) "&_
		"left outer join cen_data_pages p on d.id=p.dataid "&_
		"where d.siteid="&siteid&" and (d.category="&mi.ret_id&" or d.context=30) and t.content like '%"&searchstr&"%' "&_
		"and d.hidden=0 order by d.context,d.category,d.sortnumber"
	set rs = openRS(theSQL)
	if not rs.eof then
		noresults=false
		resultHTML=resultHTML&"<br><h5>"&mi.ret_name&"</h5>"&"<ul>"
		do while not rs.eof
			if rs("context")=1 then prefix=tPages&" <a href="""&rs("url")&""">" else prefix=tRetailers&" <a href=""/pages/retailers.asp?id="&rs("id")&""">"
			resultHTML=resultHTML&"<li>"&prefix&"<b>"&rs("name")&"</b></a></li>"
			rs.movenext
		loop
		resultHTML=resultHTML&"</ul>"
	end if
END SUB

SUB SearchMarket
	DIM theSQL,rs
	theSQL = "Select distinct d.id,d.name,d.sortnumber,d.context,d.category,p.url from (cen_data d "&_
		"inner join cen_data_texts t on d.id=t.dataid) "&_
		"left outer join cen_data_pages p on d.id=p.dataid "&_
		"where d.siteid="&siteid&" and (d.category="&mi.mar_id&" or d.context=32) and t.content like '%"&searchstr&"%' "&_
		"and d.hidden=0 order by d.context,d.category,d.sortnumber"
	set rs = openRS(theSQL)
	if not rs.eof then
		noresults=false
		resultHTML=resultHTML&"<br><h5>"&mi.mar_name&"</h5>"&"<ul>"
		do while not rs.eof
			if rs("context")=1 then prefix=tPages&" <a href="""&rs("url")&""">" else prefix=tMarket&" <a href=""/pages/marketbicycle.asp?id="&rs("id")&""">"
			resultHTML=resultHTML&"<li>"&prefix&"<b>"&rs("name")&"</b></a></li>"
			rs.movenext
		loop
		resultHTML=resultHTML&"</ul>"
	end if
END SUB

SUB SearchAbout
	DIM theSQL,rs
	theSQL = "Select distinct d.id,d.name,d.sortnumber,d.context,d.category,p.url from (cen_data d "&_
		"inner join cen_data_texts t on d.id=t.dataid) "&_
		"left outer join cen_data_pages p on d.id=p.dataid "&_
		"where d.siteid="&siteid&" and (d.category="&mi.abo_id&" or d.context in (9,37,39)) and t.content like '%"&searchstr&"%' "&_
		"and d.hidden=0 order by d.context,d.category,d.sortnumber"
	set rs = openRS(theSQL)
	if not rs.eof then
		noresults=false
		resultHTML=resultHTML&"<br><h5>"&mi.abo_name&"</h5>"&"<ul>"
		do while not rs.eof
			if rs("context")=1 then 
				prefix=tPages&" <a href="""&rs("url")&""">"
			elseif rs("context")=9 then
				prefix=tNews&" <a href=""/pages/newslist.asp?id="&rs("id")&""">"
			elseif rs("context")=37 then
				prefix=tFAQ&" <a href=""/pages/faqlist.asp?catid="&rs("id")&""">"
			elseif rs("context")=39 then
				prefix=tDownload&" <a href=""/pages/downloadlist.asp?id="&rs("id")&""">"
			end if
			resultHTML=resultHTML&"<li>"&prefix&"<b>"&rs("name")&"</b></a></li>"
			rs.movenext
		loop
		resultHTML=resultHTML&"</ul>"
	end if
END SUB

SUB SearchOtherPages
	DIM theSQL,rs
	theSQL = "Select distinct d.id,d.name,d.sortnumber,d.context,d.category,p.url from (cen_data d "&_
		"inner join cen_data_texts t on d.id=t.dataid) "&_
		"left outer join cen_data_pages p on d.id=p.dataid "&_
		"where d.siteid="&siteid&" and d.context=1 and d.category not in ("&mi.cat_id&","&mi.art_id&","&mi.acc_id&","&mi.ret_id&","&mi.mar_id&","&mi.abo_id&") and t.content like '%"&searchstr&"%' "&_
		"and d.hidden=0 order by d.context,d.category,d.sortnumber"
	set rs = openRS(theSQL)
	if not rs.eof then
		noresults=false
		resultHTML=resultHTML&"<br><h5>"&tOtherPages&"</h5>"&"<ul>"
		do while not rs.eof
			prefix=tPages&" <a href="""&rs("url")&""">"
			resultHTML=resultHTML&"<li>"&prefix&"<b>"&rs("name")&"</b></a></li>"
			rs.movenext
		loop
		resultHTML=resultHTML&"</ul>"
	end if
END SUB

CLASS menuinfo
	public cat_name
	public cat_id
	public cat_hidden
	public art_name
	public art_id
	public art_hidden
	public acc_name
	public acc_id
	public acc_hidden
	public ret_name
	public ret_id
	public ret_hidden
	public mar_name
	public mar_id
	public mar_hidden
	public abo_name
	public abo_id
	public abo_hidden

	Public SUB init()
		cataloguemenu()
		lifestylemenu()
		accessoriesmenu()
		retailermenu()
		marketmenu()
		aboutmenu()
	END SUB	

	Private SUB cataloguemenu()
		DIM rs
		set rs = openRs("Select d.id,d.name,d.hidden from cen_data d inner join cen_sitemanagement s on d.id=s.dataid where s.loadcontext='20,22,23,24' and d.siteid="&siteid)
		cat_name=rs("name")
		cat_id=rs("id")
		cat_hidden=rs("hidden")
		set rs=nothing
	END SUB
	Private SUB lifestylemenu()
		DIM rs
		set rs = openRs("Select d.id,d.name,d.hidden from cen_data d inner join cen_sitemanagement s on d.id=s.dataid where s.loadcontext='25' and d.siteid="&siteid)
		art_name=rs("name")
		art_id=rs("id")
		art_hidden=rs("hidden")
		set rs=nothing
	END SUB
	Private SUB accessoriesmenu()
		DIM rs
		set rs = openRs("Select d.id,d.name,d.hidden from cen_data d inner join cen_sitemanagement s on d.id=s.dataid where s.loadcontext='27' and d.siteid="&siteid)
		acc_name=rs("name")
		acc_id=rs("id")
		acc_hidden=rs("hidden")
		set rs=nothing
	END SUB
	Private SUB retailermenu()
		DIM rs
		set rs = openRs("Select d.id,d.name,d.hidden from cen_data d inner join cen_sitemanagement s on d.id=s.dataid where s.loadcontext='29,42,30' and d.siteid="&siteid)
		ret_name=rs("name")
		ret_id=rs("id")
		ret_hidden=rs("hidden")
		set rs=nothing
	END SUB
	Private SUB marketmenu()
		DIM rs
		set rs = openRs("Select d.id,d.name,d.hidden from cen_data d inner join cen_sitemanagement s on d.id=s.dataid where s.loadcontext='31,41,40' and d.siteid="&siteid)
		mar_name=rs("name")
		mar_id=rs("id")
		mar_hidden=rs("hidden")
		set rs=nothing
	END SUB
	Private SUB aboutmenu()
		DIM rs
		set rs = openRs("Select d2.id,d2.name,d2.hidden from (cen_data d inner join cen_sitemanagement s on d.id=s.dataid) inner join cen_data d2 on d.category=d2.id where s.loadcontext='34,35' and d.siteid="&siteid)
		abo_name=rs("name")
		abo_id=rs("id")
		abo_hidden=rs("hidden")
		set rs=nothing
	END SUB
END CLASS

%>