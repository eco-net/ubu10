<% 
'DIM homepagename DIMMES i homepagetitle.asp
DIM searchpagename,sendlinkpagename,sitemappagename,aboutpageID,aboutpagename
%>
<!--designit name="Link to searchpage" descr="" size="1" type="asp" varname="searchpagename" vartype="text"-->
<%
searchpagename=""
%>
<!--/designit-->
<!--designit name="Link to 'Send link to this page' function" descr="" size="1" type="asp" varname="sendlinkpagename" vartype="text"-->
<%
sendlinkpagename=""
%>
<!--/designit-->
<!--designit name="Link to Sitemap" descr="" size="1" type="asp" varname="sitemappagename" vartype="text"-->
<%
sitemappagename=""
%>
<!--/designit-->
<!--designit name="Link to About page" descr="" size="1" type="asp" varname="aboutpagename" vartype="text"-->
<%
aboutpagename="Om sitet"
%>
<!--/designit-->
<!--designit name="ID of about page" descr="" size="1" type="asp" varname="aboutpageID" vartype="text"-->
<%
aboutpageID="723"
%>
<!--/designit-->
<%
response.write "<div id=""tools""><a href=""/home/index.asp"">"&homepagename&"</a>"
if aboutpagename<>"" then response.write "&nbsp;|&nbsp;<a href=""/pages/"&aboutpageID&".asp"">"&aboutpagename&"</a>"
if sendlinkpagename<>"" then response.write "&nbsp;|&nbsp;<a href=""javascript:sendpage("&pageid&");"">"&sendlinkpagename&"</a>"
if searchpagename<>"" then response.write "&nbsp;|&nbsp;<a href=""/sitetools/search.asp"">"&searchpagename&"</a>"
if sitemappagename<>"" then response.write "&nbsp;|&nbsp;<a href=""/sitetools/sitemap.asp"">"&sitemappagename&"</a>"
response.write "&nbsp;&nbsp;</div>"
%>