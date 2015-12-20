<!-- 

Authothor: Filmon Ghezehey
Date: Oct-5-2015
Purpose: Customer page displaying profile and booking information.
 -->

<%@page import="dbase.GetCustomer"%>
<%@page import="dbase.Customer"%>
<%@page import="dbase.CustomerDB"%>
<%@page import="dbase.AgencyDB" %>
<%@page import="dbase.AgentDB"%>
<%@page import="dbase.Agent"%>
<%@page import="dbase.Agency"%>
<%@ page import="java.sql.*"%>
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

	Customer customer = CustomerDB.getCustomer(loginid);
	String CustFirstName = customer.getCustFirstName();
	String CustLastName = customer.getCustLastName();
	String CustAddress = customer.getCustAddress();
	String CustCity = customer.getCustCity();
	String CustCountry = customer.getCustCountry();
	String CustProv = customer.getCustProv();
	String CustPostal= customer.getCustPostal();
	String CustPhone = customer.getCustHomePhone();
	String CustEmail = customer.getCustEmail();
	CustPhone = String.valueOf(CustPhone).replaceFirst("(\\d{3})(\\d{3})(\\d+)", "($1)-$2-$3");
	
	agent = AgentDB.getAgent(Integer.toString(customer.getAgentId()));
	agency=AgencyDB.getAgency(Integer.toString(agent.getAgencyId()));
	
	Integer AgentId = agent.getAgentId();
	String AgencyCity = agency.getAgncyCity();
	String AgencyAddress = agency.getAgncyAddress();
	String AgencyPhone = agency.getAgncyPhone();
	String AgencyPostal= agency.getAgncyPostal();
	String AgencyProv = agency.getAgncyProv();
	String AgencyFax = agency.getAgncyFax();
	String AgencyCountry = agency.getAgncyCountry();
	Integer AgencyId= agency.getAgencyId();
	
	
%>


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


<jsp:include page="/header.jsp" />

<body>


	<jsp:include page="/navbar.jsp" />

	<section id="bodyBack">
	<!-- CUSTOMER SECTION -->
	<section id="services-sec">
		<div class="container">
			<div class="row ">
				<div class="text-center g-pad-bottom" class="col-md-5 col-md-offset-3">
					<div class="col-md-12 col-sm-8 alert-info">
						<h4>Welcome!</h4>
						
					</div>
				</div>
			</div>
           
		

			<div class="row">
				<div class=class="col-md-offset-2 col-md-8">
                      
					<div class="panel panel-default">
					<div class="panel-body"> 
					<b> <a style="font-size:20px" class="text-info " id="" href="customerbookings.jsp">Print Travel Information</a></b>
					</div>
						<div class="panel-heading">
							<h3>
								<label class="col-md-4	" ID="lblCustomerProfile">Profile</label>
								
								
								
							</h3>
						</div>
						<div class="panel-body">
						<a style="font-size:20px" class="text-info col-md-4" id="" href="customerprofile.jsp"><b>Edit Profile<b></a><br><br>
							<%--Display Detail View--%>
							<b><div style="font-size:18px">
                           <table width="100%" style="font-size:18px" >
                             <tr>
                               <td><h>&nbsp<%=CustFirstName%>&nbsp<%=CustLastName%></h></td>                                                      
                               <td><h>&nbsp<%=CustAddress%>&nbsp<%=CustCity%></h>&nbsp<%=CustProv%>.&nbsp<%=CustCountry%>&nbsp<%=CustPostal %></h></td>
                               <td>Email:&nbsp<%=CustEmail%></td>
                               <td>Phone:&nbsp<%=CustPhone%>
 
                               </td>
                              </tr>
                            </table>                       
                        </div><b><br>
							<div id="custdetail"></div>
						</div>
					</div>
				</div>
			</div>
		</div>

			<div class="row">
				<div class="col-md-offset-2 col-md-8">

					<div class="panel panel-default">
						<div class="panel-heading">
							<h3>
								<label class="col-md-4" ID="lblCustomerBookings">Booking</label>										
									 
							</h3>
							
						</div>
						
						<div class="panel-body">
                         <a style="font-size:20px" class="text-info" href="#" onclick="getCustomer(<%=loginid%>,1,0);return false;"><b>Bookings</b></a>&nbsp&nbsp&nbsp
	                	 <a style="font-size:20px"class="text-info" href="#" onclick="getCustomer(<%=loginid%>,2,0);return false;"><b>Packages</b></a>&nbsp&nbsp&nbsp
	                     <a style="font-size:20px" class="text-info" href="#" onclick="getCustomer(<%=loginid%>,3,0);return false;"><b>Products</b></a>&nbsp&nbsp&nbsp
	                     <a style="font-size:20px" class="text-info" href="#" onclick="getCustomer(<%=loginid%>,4,0);return false;"><b>TotalOwing</b></a> &nbsp&nbsp&nbsp
	                      <a style="font-size:20px" class="text-info" href="#" onclick="getCustomer(<%=loginid%>,5,0);return false;"><b>Agent</b></a>&nbsp&nbsp&nbsp
	                      <a style="font-size:20px" class="text-info" href="#" onclick="getCustomer(<%=AgencyId%>,6,0);return false;"><b>Agency</b></a></br>&nbsp&nbsp&nbsp
							<%--Customer Package Details--%>
							
							<script type="text/javascript">
							$(document).ready(function(){   
					        	getCustomer(<%=loginid%>,1,0);
					        	});
							</script>
							
							 <div id="custbookings"></div>
	                         	    

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
			<jsp:include page="/footer.jsp" />
</body>
</html>