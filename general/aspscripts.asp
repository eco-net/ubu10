<!--#include virtual="/connections/data.asp" -->
<%
DIM gConn
Set gConn = Server.CreateObject ("ADODB.Connection")
gConn.Open MM_data_STRING

FUNCTION openRS(theSQL)
	Dim rs_XX
	set rs_XX = Server.CreateObject("ADODB.Recordset")
	rs_XX.ActiveConnection = gConn
	rs_XX.Source = theSQL
'	response.write(theSQL)
'	response.end
	on error resume next
	rs_XX.Open()
	if err then
		response.write theSQL
		response.end
	end if
	set openRS = rs_XX
END FUNCTION

FUNCTION getCurlang()
	DIM theurl, lang
	theurl=request.servervariables("URL")
	IF Instr(theurl,"/dk/")>0 THEN
		lang="dk"
	ELSEIF Instr(theurl,"/d/")>0 THEN
		lang="d"
	ELSEIF Instr(theurl,"/gb/")>0 THEN
		lang="gb"
	END IF
	getCurlang=lang
END FUNCTION

FUNCTION FormatDateDB(theDate)
	IF LEN(theDate)>0 THEN
		theDate=CDate(theDate)
		FormatDateDB="{ts '" & datepart("yyyy",theDate) & "-" & right("0" & CStr(datepart("m",theDate)),2) & "-" &_
			right("0" & CSTR(datepart("d",theDate)),2) & " 00:00:00'}"
	ELSE
		FormatDateDB="''"
	END IF
END FUNCTION

SUB execCommand(theSQL)
	gConn.Execute theSQL
END SUB


FUNCTION InsertRec(theSQL,theTable,theIDfield,theSelect)

	gConn.Execute theSQL

	DIM theComm
'    Set theComm = Server.CreateObject("ADODB.Command")
'    theComm.ActiveConnection = gConn
'    theComm.CommandText = theSQL
'	theComm.Execute
'    set theComm=nothing

	IF LEN(theTable)>0 THEN
		Set theComm = Server.CreateObject("ADODB.RecordSet")
		theComm.ActiveConnection = gConn
		theComm.Source = "SELECT MAX(" & theIDfield & ") as themax FROM " & theTable
		IF LEN(theSelect)>0 THEN
			theComm.Source = theComm.Source & " WHERE " & theSelect
		END IF
		theComm.Open()
		InsertRec=theComm.Fields.Item("themax").value
		theComm.Close()
	ELSE
		InsertRec=0
	END IF
END FUNCTION


FUNCTION GetSetting(datatype,lang)
	DIM rs
	set rs=server.createobject("ADODB.recordset")
	rs.activeconnection=gConn
	rs.source="SELECT settingsvalue,settingstext FROM eco_settings WHERE datatype=" & datatype
	IF LEN(lang)>0 THEN rs.source=rs.source & " AND language='" & lang & "'"
	rs.Open()
	IF NOT rs.EOF THEN
		IF LEN(rs("settingstext"))=0 THEN
			 GetSetting=rs("settingsvalue")
		ELSE
			 GetSetting=rs("settingstext")
		END IF
	ELSE
		GetSetting=0
	END IF
	rs.close()
	set rs=nothing
END FUNCTION


FUNCTION ReadFile(thePath)
	' --------------------------------
	' Læser en fil. Hvis filen ikke eksisterer, returneres en tom streng.
	' --------------------------------
	
	DIM fs,ts,theText
	
'	response.write("<br>læser fil: " & thePath)

	thePath=Server.MapPath(thePath)
	SET fs = CreateObject("Scripting.FileSystemObject")
	IF fs.FileExists(thePath)=false THEN
		theText=""
	ELSE		
		Set ts=fs.OpenTextFile(thePath)
		theText=ts.ReadAll()
		set ts = nothing
	END IF
	set fs=nothing
	ReadFile=theText
END FUNCTION

FUNCTION getDbFieldValue(theTable,valueField,idField,id,strWhere)
	' Returnerer værdien af feltet theField fra tabellen theTable, fra den post, hvor id-feltet er sat til værdien af parametren id
	' en feltværdi fra en tabelpost, hvor id-feltet er sat til en given værdi.
	' NB: Hvis id-værdien er en streng, skal strengen indeholde omsluttende ''
	Dim rs, theSQL, theItems
	if len(strWhere)>0 then strWhere = " AND " & strWhere
	theSQL = "SELECT " & valueField & " FROM " & theTable & " WHERE " & idField & "=" & id & strWhere
'	if instr(theSQL,"w.w")>0 then
'		response.write("theSQL: " & theSQL)
'		response.end
'	end if
	set rs = openRS(theSQL)
	if not rs.EOF then 
		theItems=rs.GetRows
		getDbFieldValue = theItems(0,0)
	else
		getDbFieldValue = ""
	end if
	rs.Close
END FUNCTION

FUNCTION getOptionsFromDb(theTable, criteria, nameField, valueField, selectField, selectValue, sortField, extraInfo)
	getOptionsFromDb = getNamedOptionsFromDb(theTable, criteria, nameField, valueField, selectField, selectValue, sortField, extraInfo, "Vælg")
END FUNCTION

FUNCTION getNamedOptionsFromDb(theTable, criteria, nameField, valueField, selectField, selectValue, sortField,extraInfo, firstlabel)

	' *** FUNKTION: ***
	' Funktionen returnerer en tekststreng til indsættelse som option-tags i en select-tag
	'
	' Parametre:
	' theTable: 	Den tabel, data skal hentes fra
	' criteria: 	Udvælgelseskriteria, hvis ikke alle data i tabellen skal med. 
	' 				Eks: "id>20 AND txt='poul'", dvs. uden WHERE. Kan være tomt.
	' nameField: 	Det felt, der giver teksten til dropdown-listen
	' valueField: 	Det felt, der giver værdierne til dropdown-listen. Kan være tomt.
	' selectField og selectValue: Hvis en værdi i listen skal være valgt i forvejen,
	'				skal tabelfeltet "selectField" indeholde værdien "selectValue". Kan være tomme, men så skal begge være det.
	'
	' Eksempel:
	' <select name="thelist">
	' <% = getOptionsFromDb("hw6_product_groups","id>20", "thename", "theid", "id", "20")
	' </select>
	'
	' *****************
	
	Dim rs_XX, whereClause, resultString, strValue, strSelected,strSelect, sortString, arrExtraInfo
	
	' Init
	if len(firstlabel)=0 then firstlabel = "Vælg"
	resultString = "<option value="""">&lt; " & server.HTMLEncode(firstlabel) &" &gt;</option>" & vbNewLine
	IF len(criteria)>0 then whereClause = " WHERE " & criteria
	IF selectField <> nameField AND selectField <> valueField AND len(selectField)>0 AND len(selectValue)>0 THEN strSelect = "," & selectField & " AS selectfield "
	IF len(sortField)>0 then 
		sortString=" ORDER BY " & sortField
		strSelect = strSelect & ", " & replace(replace(sortField,"DESC",""),"ASC","") & " AS sortField "	' skal medtages, for at distinct kan fungere
	end if

	SET rs_XX=server.createobject("ADODB.recordset")
	rs_XX.activeconnection = gConn
	IF extraInfo<>"" then
		arrExtraInfo=split(extraInfo,",")
		rs_XX.source = "SELECT distinct " & nameField & " + Case " & arrExtraInfo(0) & " WHEN 0 THEN '" & arrExtraInfo(2) & "' ELSE '" & arrExtraInfo(1) & "' END AS namefield, " & valueField & " AS valuefield " & strSelect & " FROM " & theTable & whereClause & sortString
	ELSE
		rs_XX.source = "SELECT distinct " & nameField & " AS namefield, " & valueField & " AS valuefield " & strSelect & " FROM " & theTable & whereClause & sortString
	END IF
	'response.write rs_XX.source
'	response.end
	on error resume next
	rs_XX.Open
	if err then 
		dumpvar "SQL", rs_xx.source
		response.end
	end if
'	dumpvar "name", rs_xx("namefield")
	
	IF rs_xx.EOF and rs_xx.BOF then
		resultString= "<option value="""">&lt;"&firstlabel&"&gt;</option>" & vbNewLine
	END IF
	
	' Gennemløb poster
	DO WHILE NOT rs_XX.EOF
		strValue=""
		IF len(rs_XX("valuefield"))>0 THEN strValue = " value = """ & server.HTMLEncode(rs_XX("valuefield")) & """"

		strSelected = ""
		if selectField<>"" AND selectValue<>"" then
			if selectfield=namefield then
				if CSTR(rs_XX("namefield")) = CSTR(selectValue) then strSelected = " selected"
			elseif selectfield=valuefield then
				if CSTR(rs_XX("valuefield")) = CSTR(selectValue) then strSelected = " selected"
			else
				if rs_XX("selectField") = selectValue then strSelected = " selected"
			end if
		end if

		resultString = resultString & "<option" & strValue & strSelected & ">" & server.HTMLEncode(rs_XX("nameField") & "") & "</option>" & vbNewline

		rs_XX.MoveNext
	LOOP
	rs_xx.Close
	'response.write resultString
	getNamedOptionsFromDb = resultString
END FUNCTION

Function RegExp_getObj(patrn, strng)
	' bruges af GetRecCount
   Dim regEx, Match, Matches   ' Create variable.
   Set regEx = New RegExp   ' Create a regular expression.
   regEx.Pattern = patrn   ' Set pattern.
   regEx.IgnoreCase = True   ' Set case insensitivity.
   regEx.Global = True   ' Set global applicability.
   Set RegExp_getObj = regEx.Execute(strng)   ' Execute search.
End Function

FUNCTION RegExp_getAttrValue(theAttr,theTag)
	set theReg=RegExp_getObj(theAttr&"=""[^""]*""",theTag)
	if theReg.count>0 then
		theVal=mid(theReg.item(0).value,len(theAttr)+3)
		theVal=left(theVal,len(theVal)-1)
	else
		theVal=""
	end if
	set theReg=nothing
	RegExp_getAttrValue=theVal
END FUNCTION
FUNCTION SetHREFTarget(theHTML)
	if instr(theHTML,"</")=0 then theHTML=replace(theHTML,chr(13),"<br>")
	DIM Matches,strTag,url,domain,strNewTag, oldTag, strOldTag
	domain=request.servervariables("HTTP_HOST")
	set Matches=RegExp_getObj("<a href.*>[.\n]*",theHTML)
	for i=0 to Matches.count - 1
		strTag=Matches.Item(i).Value
		url=RegExp_getAttrValue("href",strTag)
'		response.write "<b>"&Matches.Item(i).Value&"</b><br>"
'		response.write "url:"&lcase(url)&" , domain:"&lcase(domain)&"<br>"
		if instr(url,"http:")>0 and instr(lcase(url),lcase(domain))=0 then 'ekstern link -> åbner i nyt vindue
			set oldTag=RegExp_getObj(""">",strTag)
			strOldTag=left(strTag,oldTag.Item(0).firstindex+2)
			strNewTag="<a href="""&url&""" target=""_new"">"
			theHTML=replace(theHTML,strOldTag,strNewTag)
		end if
	next
	SetHREFTarget = theHTML
END FUNCTION

SUB Subscribe (siteid,email)
	DIM rs
	set rs = openRS("Select id from cen_data where context=35 and siteid="&siteid&" and name='"&email&"'")
	if rs.eof then
		execCommand "Insert into cen_data (context,contextname,siteid,name) values (35,'Subscribers',"&siteid&",'" & email & "')"
		set rs = openRS("Select id from cen_data where context=35 and siteid="&siteid&" and name='"&email&"'")
		execCommand "Insert into cen_data_texts (dataid,ckey,content) values ("&rs("id")&",'email','" & email & "')"
	end if
	set rs = nothing
END SUB
%>