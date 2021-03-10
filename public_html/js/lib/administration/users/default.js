var thissite;

function enabledisable(siteid,roleid,userid)
{
	thissite=siteid
	if(roleid!=3)
	{
		document.getElementById(siteid).innerHTML='NOT APPLICABLE';
	}
	else
	{
		xmlHttp=GetXmlHttpObject();
		var url="/cms/administration/users/showmodules/?userid=" + userid + "&siteid=" + siteid;
		xmlHttp.onreadystatechange=stateChanged;
		xmlHttp.open("GET",url,true);
		xmlHttp.send(null);	
	}
	return;
}

function stateChanged() 
{ 
	if(xmlHttp.readyState==4)
	{
		document.getElementById(thissite).innerHTML=xmlHttp.responseText;
	}
}

function GetXmlHttpObject()
{
	var xmlHttp=null;
	try
	  {
	  // Firefox, Opera 8.0+, Safari
	  xmlHttp=new XMLHttpRequest();
	  }
	catch (e)
	  {
	  // Internet Explorer
	  try
	    {
	    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
	    }
	  catch (e)
	    {
	    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
	    }
	  }
	return xmlHttp;
}