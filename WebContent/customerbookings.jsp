<!-- 

Authothor: Filmon Ghezehey
Date: Oct-5-2015
Purpose: a page print for customer Travel Information.
 -->

<%@page import="dbase.GetCustomer"%>
<%@page import="dbase.Customer"%>
<%@page import="dbase.CustomerDB"%>
<%@page import="dbase.AgencyDB" %>
<%@page import="dbase.AgentDB"%>
<%@page import="dbase.Agent"%>
<%@page import="dbase.Agency"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%! 
	String loginid = "0";
    Customer customer;
    Agency agency;
    Agent agent;
    
%>

<%



	//HttpSession session = request.getSession(false);
	if (session == null || (session.getAttribute("loginid") == null) || (!session.getAttribute("loginStatus").equals("true")))
	{
		// user is NOT logged in; redirect to login
	    response.sendRedirect("login.jsp");
	} 
	else {
		// user IS logged in; let this page display 
		if (session.getAttribute("loginid") != null )
	    	loginid = session.getAttribute("loginid").toString(); // This should be validated too
	    System.out.println("\n" + loginid);
	}
	
	
	
	customer = CustomerDB.getCustomer(loginid);
	String CustFirstName = customer.getCustFirstName();
	String CustLastName = customer.getCustLastName();
	String CustAddress = customer.getCustAddress();
	String CustCity = customer.getCustCity();
	String CustCountry = customer.getCustCountry();
	String CustProv = customer.getCustProv();
	String CustPostal= customer.getCustPostal();
	
	agent = AgentDB.getAgent(Integer.toString(customer.getAgentId()));
	agency=AgencyDB.getAgency(Integer.toString(agent.getAgencyId()));
	
	String AgencyCity = agency.getAgncyCity();
	String AgencyAddress = agency.getAgncyAddress();
	String AgencyPhone = agency.getAgncyPhone();
	String AgencyPostal= agency.getAgncyPostal();
	String AgencyProv = agency.getAgncyProv();
	String AgencyFax = agency.getAgncyFax();
	String AgencyCountry = agency.getAgncyCountry();
%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

<!--  NOTE can only have one of these; if both only the 2nd will show on page 
		since both use dropdown select to fire !!!! -->
<script type="text/javascript" src="custdetail.js"></script>
<script type="text/javascript" src="custbookings.js"></script>





<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.9/css/jquery.dataTables.css">

<!-- jQuery -->
<script type="text/javascript" charset="utf8"
	src="//code.jquery.com/jquery-1.10.2.min.js"></script>

<!-- DataTables -->
<script type="text/javascript" charset="utf8"
	src="//cdn.datatables.net/1.10.9/js/jquery.dataTables.js"></script>


<script type="text/javascript">
	        $(document).ready(function () {
	            $("#customer").DataTable({
	            	"processing": true,
	            	"ajax": {
	            		"url": "/dbase/GetCustomer.java", "dataSrc": "", "type": "GET"
	            	}
	            });
	        });
	        
	 </script>

<script>
function printPage() {
    window.print();
}
</script>



<body>


	

	<section id="bodyBack">
	<!-- CUSTOMER SECTION -->
	<section id="customermain">
		
			
			<div class="row ">
				<div class="text-center g-pad-bottom">
					<div class="col-md-11.5 col-sm-12 alert-info">
					<button align="right" onclick="printPage()">Print this Page</button></legend>
					<a href="customer.jsp"> <button align="right" >Cancel</button></legend></a>
					
			
					</div>
					 <img class="logo" width="250" height="100"
				src="images/logo.png" alt="Travel Experts" /><br>
				
				</div>
				
			</div>			

			<div class="row">
				<div class="col-md-offset-2 col-md-8">
<!-- 				<div class="panel panel-default"> -->
<%-- 					<h3><table width="100%" style="font-size:20px"><tr><td>Agency Address:<%=AgencyAddress%>&nbsp<%=AgencyCity%>&nbsp<%=AgencyProv%>.&nbsp<%=AgencyCountry%>&nbsp<%=AgencyPostal%> --%>
<%-- 					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td><td align="right">Phone:<%=AgencyPhone%>&nbspFax:<%=AgencyFax%></td></tr></table></h3>	 --%>
<!-- 						</div> -->
						
               <h3> <label align= "center" class="col-md-11" ID="lblCustomerProfile"><br><br>Travel Information</label></h3><br>
					
				</div>
			</div>


			<div class="row">
				<div class="col-md-offset-2 col-md-8">

					<div class="panel panel-default">
						<div class="panel-heading">
							<div width="100%" align="right">
							     <script>today = new Date();
							     var monthNames = [
							                       "January", "February", "March",
							                       "April", "May", "June", "July",
							                       "August", "September", "October",
							                       "November", "December"
							                     ];

							                     var date = new Date();
							                     var day = date.getDate();
							                     var monthIndex = date.getMonth();
							                     var year = date.getFullYear();
							                 
							                     document.write(day + ' ' + monthNames[monthIndex] + ' ' + year);
							    </script></div>
						</div>
						
						<div class="panel-body">
                       <table style="font-size:20px" width ="100%" cellspacing = "40"><tr> <td >
                           <h><div><%=CustFirstName%>&nbsp<%=CustLastName%>,&nbsp
                            <%=CustAddress%></div>
                            <div><%=CustCity%>&nbsp<%=CustProv%>.&nbsp
                            <%=CustCountry%>&nbsp<%=CustPostal %></div> </h>                       
                        </td><td align="right">
                       </td></tr></table>
					
							
							<script type="text/javascript">
							$(document).ready(function(){   
					        	getCustomer(<%=loginid%>,1,1);
					        	});
							
							function gettdate()
							{
							today = new Date();
							var dateString = today.format("dd-m-yy");
							document.write(dateString) ;
							}
							
							</script>
							
							 <div id="custbookings"></div>
							 <button onclick="printPage()">Print this page</button>
	                             

							<!-- 
               <asp:BoundField DataField="ItineraryNo" HeaderText="Itinerary No" SortExpression="ItineraryNo" />
               <asp:BoundField DataField="TripStart" DataFormatString="{0:MM-dd-yyyy}"  HeaderText="Trip Start Date" SortExpression="TripStart" />
               <asp:BoundField DataField="TripEnd" DataFormatString="{0:MM-dd-yyyy}"  HeaderText="Trip End Date" SortExpression="TripEnd" />
               <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
               <asp:BoundField DataField="Destination" HeaderText="Destination" SortExpression="Destination" />
               <asp:BoundField DataField="BasePrice" DataFormatString="{0:c}" HeaderText="Base Price" SortExpression="BasePrice" />
 			-->

						</div>
					</div>
				</div>
			</div>
</section>
</section>

			
</body>
</html>