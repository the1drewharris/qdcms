var xmlHttp

function getInfo(nameid,type)
{ 
	xmlHttp=GetXmlHttpObject();
	if (xmlHttp==null)
	  {
	  alert ("Your browser does not support AJAX!");
	  return;
	  } 
	var url="/crm/events/includes/getinfo.cfm?nameid="+nameid+"&type="+type;
	xmlHttp.onreadystatechange=ProductStateChanged;
	xmlHttp.open("GET",url,true);
	xmlHttp.send(null);
}

function ProductStateChanged() 
{ 
	if(xmlHttp.readyState==4)
	{
		var dataStr=xmlHttp.responseText;
		var dataArr=dataStr.split(',');
		if(dataArr[0]=='location')
		{
			document.getElementById('locationname').value=dataArr[1];
			document.getElementById('locationphone').value=dataArr[2];
			document.getElementById('locationemail').value=dataArr[3];
			document.getElementById('locationaddress1').value=dataArr[4];
			document.getElementById('locationaddress2').value=dataArr[5];
			document.getElementById('locationcity').value=dataArr[6];
			document.getElementById('locationstate').value=dataArr[7];
			document.getElementById('locationzip').value=dataArr[8];
		}
		else if (dataArr[0]=='contact')
		{
			document.getElementById('contactfirstname').value=dataArr[1];
			document.getElementById('contactlastname').value=dataArr[2];
			document.getElementById('contactphone').value=dataArr[3];
			document.getElementById('contactemail').value=dataArr[4];
			document.getElementById('contactaddress1').value=dataArr[5];
			document.getElementById('contactaddress2').value=dataArr[6];
			document.getElementById('contactcity').value=dataArr[7];
			document.getElementById('contactstate').value=dataArr[8];
			document.getElementById('contactzip').value=dataArr[9];
		}
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