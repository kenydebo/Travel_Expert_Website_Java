/**
 * 
 */
var req;
function getCustomer(custid)
{
	req = new XMLHttpRequest();
	
    var url = "http://localhost:8080/Workshop7/GetCustomer?custid=" + custid;
    req.open("GET", url);
    req.onreadystatechange = stateChanged
    req.send(null);
}

function stateChanged()
{
	if (req.readyState == 4)
	{
	   document.getElementById("custdetail").innerHTML = req.responseText;
	}
}