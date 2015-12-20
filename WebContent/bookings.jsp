<%@ page import="java.sql.*, java.io.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="dbase.TravelPackageDB" %>
<%@page import="dbase.TravelPackage" %>
<%@page import="java.util.List" %>


<%! 
	String loginid = "0";
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
	    	loginid = session.getAttribute("loginid").toString(); 
	}	

%>
 


<%!	
	String BookingId = "";
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    	Date now = new Date();
    String BookingDate = sdf.format(now);
    String BookingNo = "JJ89";
    String TravelerCount = "";
    String CustomerId = loginid;
    String TripTypeId = "";
    String PackageId = "";
    String PackageName = "";
     
    

List<TravelPackage> pk = TravelPackageDB.getTravelPackages("filter");
%>





<%!
   public String createBooking(String [] bookingArray)
		{
			String sql = "INSERT INTO bookings ("
				+ " BookingDate, BookingNo, TravelerCount,CustomerId, TripTypeId, PackageId "
			    + ") values ("		
				 + " '" + bookingArray[0] + "', " 
				 + " '" + bookingArray[1] + "', "
				 + " '" + bookingArray[2] + "', "
				 + " '" +     loginid     + "', "
				 + " '"  + bookingArray[3] + "', "
				 + "  "  + bookingArray[4] + ")";

		    try
		    {
		    	// Code section changed to implement AJAX w/ local mysql db		    	
		        Class.forName("com.mysql.jdbc.Driver");
				Connection dbConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelexperts","root","P@ssw0rd");
		        
		        Statement stmt = dbConn.createStatement();

		        int rows = stmt.executeUpdate(sql);

		        // Cleanup
		        dbConn.close();  
		        
				if (rows == 1)
				{
					return "Booking was successful. Thank you for Booking with Travel Experts.";
				}
				else
				{
					return "Insert was NOT successful";
				}
		    }
		    catch (Exception excp)
		    {
		        excp.printStackTrace();
		    }
			return "";
		}
		

		public void displayForm(String [] bookingArray, JspWriter out) throws IOException
		{

		}
		
		
		
		public String validate(String [] bookingData)
		{
			for (int i=0; i<bookingData.length; i++)
			{
				if (bookingData[i].equals(""))
				{
					switch(i)
					{
						case 0:
							return "**Field must have a value";
						
						case 1:
							return "**Field must have a value!**";
						
						case 2:
							return "**Field must have a value!**";						
						
						case 3:
							return "**Field must have a value!**";
							
						case 4:
							return "**Field must have a value!**";
								
						
						
						default:
						return "field must have a value.";
					}
				}
			}
			return "";
		}
		
		
	
%>

	<jsp:include page="/header.jsp"/>
	
<body>

	<jsp:include page="/navbar.jsp"/>

	

	<section id="bodyBack">
	<!-- REGISTRATION FORM -->
	<section id="bookingform">
	
	<div class="container">
	    <fieldset>	        
	        <div class="row ">
                <div class="text-center g-pad-bottom">
                   <div class="col-md-12 col-sm-12 alert-info">
                            <h4>Booking Page</h4>
                            <p>
                                Book from special user specific trips
                                offered to you by Travel Experts 
                            </p>
                            
                    </div>
                </div>
            </div>
	        
	   
	    	
	    	<!-- NOTE: POST method used for more security -->
		    <!-- NOTE: action appends to end of URL string using; Project / ServletName -->
		    <form name="customerform" method="post" action="" class="form-horizontal" >

			<h6 class="text-left">Required fields indicated with a *</h6>
			     	      
	       <div class="col-md-6">
	           
	       	<div class="form-group">
		       	<label class="col-md-6 control-label">*Booking Date</label>
			 	<div class="col-md-6" align="right">
					<input name='BookingDate' type='text' id='BookingDate' class="form-control" TabIndex="2" placeholder="Booking Date" value="<%=BookingDate%>" readonly/>
	       		</div>
	       	</div>
	       	
	       	<div class="form-group">
		       	<label class="col-md-6 control-label">Booking Number</label>
		       	<div class="col-md-6">
					<input name='BookingNo' type='text' id='BookingNo' class="form-control" TabIndex="3" placeholder="Booking Number" value="<%=BookingNo%>" readonly/>
	       		</div>
			</div>
			
	       	<div class="form-group">
		       	<label class="col-md-6 control-label">*Traveler Count</label>
		       	<div class="col-md-6">
		       	<select name="TravelerCount" class="form-control">
		       		<option value="0" selected>(please select:)</option>
		       		<%
		       		for(int i=1;i<=15;i++) {
		       		%>
		       		<option value="<%=i %>"><%=i %></option>
					<%} %>	       		
		       	</select>
		        </div>
			</div>
                

	        <div class="form-group">
	        	<label class="col-md-6 control-label">*Package Id</label>
	        	<div class="col-md-6">
	        	<select class="form-control" name="PackageId" id="package" TabIndex="3" >
	        		<option value="" selected>(Package)</option>
	        		<%
	        		for(int i=0;i<pk.size();i++) {
	        			PackageName=pk.get(i).getPkgName();	
	        			PackageId=Integer.toString(pk.get(i).getPackageId());
	        		%>
	        		<option value="<%=PackageId %>"><%=PackageName%></option>
	        	<%} %>	
	        	</select>
	        	</div>
	        </div>
	        

	        
	        <div class="form-group">
	        <label class="col-md-6 control-label">*Trip Type Type</label>
	            <div class="col-md-6">
				<select name="TripTypeId" class="form-control">
					<option value="" select>(Trip Type)</option>
					<option value="B">Business Class</option>
					<option value="G">First Class</option>
					<option value="L">Economy</option>
				</select>
				</div>
			</div>
			
			</div>
			
			<div class="col-md-6">
			 <div class="form-group">
		       	<label class="col-md-6 control-label">Payment Method</label>
		       	<div class="col-md-6">
				<select name="Payment_Method" class="form-control">
					<option value="" select>(Payment method)</option>
					<option value="Master_Card">Master Card</option>
					<option value="Visa_Card">Visa Card</option>
					<option value="Point_Card">Travel Expert's Point Card</option>
					<option value="Credit_Card">Credit Card</option>
					<option value="Air_Miles">Air Miles</option>
				</select>
				</div>
	        </div>
	         
	         <div class="form-group">
		       	<label class="col-md-6 control-label">Card Number</label>
		       	<div class="col-md-6">
				<input name='CardNumber' type='text' id='CardNumber' class="form-control" TabIndex="5" placeholder="Card Number" />
				</div>
	        </div>
	        
        
	        <div class="form-group">
		       	<label class="col-md-6 control-label">CCV</label>
		       	<div class="col-md-6">
				<input name='CCV' type='text' id='CCV' class="form-control" TabIndex="5" placeholder="CCV" />
				</div>
	        </div>
	       
			</div>
			
			<div class="col-md-6"> 
		        <div class="form-group pull-right">
		        	<img class="img-thumbnail" src="images/paypal.png"/>
		        	<img class="img-thumbnail" src="images/visa.png"/>	        	       
		       		<img class="img-thumbnail" src="images/western.png"/>	
			        <img class="img-thumbnail" src="images/master.png"/>
			        <img class="img-thumbnail" src="images/aim.jpg"/>
				</div>
			</div>
			

	
			
	        <label ID="formMessage" style="color:red"></label>
	        <br />
	        <br />
	        <br />
	        <br />
	        <div class="col-md-12">
	        	<%
			if (request.getParameter("submit") != null)
			{
				String [] booking = new String[5];
				booking[0] = (String)request.getParameter("BookingDate");
				booking[1]= (String)request.getParameter("BookingNo");
				booking[2]= (String)request.getParameter("TravelerCount");
				booking[3] = (String)request.getParameter("TripTypeId");
				booking[4] = (String)request.getParameter("PackageId");
				
		
				//pass data to validation function
				String message = validate(booking);
				
				if (message.equals(""))
				{
					//if not valid set error message and redisplay form
					out.print("<h4 style='color:crimson'>" + createBooking(booking) + "</h4>");
					
					//after writing booking data empty the array so form will be empty
						booking[0] = "";
						booking[1] = "";
						booking[2] = "";
						booking[3] = "";
						booking[4] = "";
				
					displayForm(booking, out);
				} else
				{
				   out.print("<div class='text-center'>" + " <h4 style='color:crimson' align='center'>" + message + "</h4>" + "</div>");
				   //document.getElementById("formMessage").innerHTML = message;
				   displayForm(booking, out);
			    }
			}
			else
			{
				//display form
				String [] booking = {"","","","","",};
				//displayForm(booking, out);
			}
		%>	
			<div class="text-center">
				<input type='submit' name='submit' value='Book' class="btn btn-primary btn-lg" 
					onClick="javascript:window.location='bookings.jsp';" >
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input name='reset' type='reset' id='reset' value='Reset' class="btn btn-warning btn-lg" onClick="this.form.reset()"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<a name="cancel" class="btn btn-danger btn-lg" href="customer.jsp">Cancel</a>
				
			</div>
			<br />
            <p align="center"><b>Privacy statement:</b> Travel Experts respects your privacy. We will not share your information with anyone</p>
			</div>
			
		
			
            
          	</form>
	    </div> 
	    </fieldset>
	</section> 
	<!-- /registration form -->
	</section>  
    <jsp:include page="/footer.jsp"/>
    
</body>
</html>