/**
 * Author:Mark, Filmon.
 * Date: oct-5-2015
 * Purpose: a Javascript connecting to the GetCustomerBookings Servelet 
 */
var req;
function getCustomer(custid,mode,state)
{
	req = new XMLHttpRequest();
	
    var url = "http://localhost:8080/Workshop7/GetCustomerBookings?custid=" + custid + "&mode=" + mode + "&state=" + state;
   
    req.open("GET", url);
    req.onreadystatechange = stateChanged
    req.send(null);
}

function stateChanged()
{
	if (req.readyState == 4)
	{
	   document.getElementById("custbookings").innerHTML = req.responseText;
	}
}