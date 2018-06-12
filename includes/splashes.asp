<div id="splash1">
<form action="/general/acts/webid.asp" method="post" style="margin:0px;">
<h3>
<!--designit name="Headline" descr="" size="1" type="html"-->
Find det du søger
<!--/designit-->
</h3>
<img src="/general/layout/bevel_ruler.gif" />
<img src="/media/webID.jpg" width="165" height="65" /><br />
<p class="blue">
<!--designit name="Sub header" descr="" size="1" type="html"-->
Web ID
<!--/designit-->
</p>
<!--designit name="Text" descr="" size="2" type="html"-->
Brug weblink og gå direkte til cyklen. Du finder weblinket i kataloget.
<!--/designit-->
<!--designit name="Label for field" descr="" size="2" type="html"-->
Indtast weblink:
<!--/designit-->
</br />
<!--designit name="Label for button" descr="" size="1" type="asp" varname="tWebidbtn" vartype="text"-->
<% 
tWebidbtn="Find"
%>
<!--/designit-->
<input name="weblink" type="text" class="input" style="width:60px"/><input name="" type="submit" value="<%=tWebidbtn%>" class="submit"/>
</form>
<!--designit name="Errormessage when the entered webid is not found" descr="" size="1" type="javascript" varname="errorMessage" vartype="text"-->
<script language="JavaScript">
errorMessage='The entered value is not a WebID. Please try again.';
</script>
<!--/designit-->
<% if len(request("wlerror"))>0 then %>
<script language="JavaScript" type="text/JavaScript">
alert(errorMessage)
</script>
<% end if %>
</div>
<div id="splash2">
<h3>Newsheader</h3>
<img src="/general/layout/bevel_ruler.gif" />

<p><img src="/general/layout/pil_hvid.gif" /><a href="Link1">Lorem ipsum 1</a> </p><br> 
<p><img src="/general/layout/pil_hvid.gif" /><a href="Link2">Lorem ipsum 2</a> </p><br> 
<p><img src="/general/layout/pil_hvid.gif" /><a href="Link3">Lorem ipsum 3</a> </p><br> 
<p><img src="/general/layout/pil_hvid.gif" /><a href="Link4">Lorem ipsum 4</a> </p><br> 
</div>
<div id="splash3"><h3>Bicycle Guide</h3><img src="/general/layout/bevel_ruler.gif" />
<img src="/media/123_splash.gif" width="165" height="65" /><br />
<p class="blue">Problems deciding which bike to choose ?</p><p>Try the bicycle guide, a small test in 3 easy steps, leading you in the right direction.</p>
<p><img src="/general/layout/pil_hvid.gif"  /><a href="javascript:;" onClick="var thewin=window.open('http://www.kildemoes.dk/guide/index.asp','newwin','top=100,left=200,width=380,height=440');thewin.focus();">Open the guide</a></p></div>
