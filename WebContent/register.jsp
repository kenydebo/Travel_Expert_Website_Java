
<%@ page import="java.sql.*, java.io.*" %>

<%!
	// Declare variables
	String loginid = "0";
	String message = "";

	String CustFirstName = "";
    String CustLastName = "";
    String CustAddress = "";
    String CustCity = "";
    String CustProv = "";
    String CustCountry = "";
    String CustPostal = "";
    String CustHomePhone = "";
    String CustBusPhone = "";
    String CustEmail = "";
    String CustUsername = "";
    String CustPassword = "";
    String CustPassword2 = "";
    
    String custid = ""; //request.getParameter("custid");
%>

<%

	//HttpSession session = request.getSession(false);
	if (session == null || (session.getAttribute("loginid") == null) || (!session.getAttribute("loginStatus").equals("true")))
	{
		// user is NOT logged in; let this page display 
	} 
	else {
		// user IS logged in; redirect to customer page 
		response.sendRedirect("customer.jsp");
	}

    // Get message value from session data
    message = (String)session.getAttribute("message");     
    
    // Reset session message value
    session.setAttribute("message", "");
    
    // Check value from session message
    if (message == null)
        message = "";
%>

<%!
	// Code modified from class examples
   public String createCustomer(String [] customerArray)
		{
			String sql = "INSERT INTO customers " + 
				"(CustFirstName, CustLastName, CustAddress, CustCity, CustProv,	CustCountry, " +
				"CustPostal, CustHomePhone, CustBusPhone, CustEmail, AgentID"
			    + ") values ("
				+ "'" + customerArray[0] + "'," 
				+ " '" + customerArray[1] + "',"
				+ " '" + customerArray[2] + "',"
				+ " '" + customerArray[3] + "',"
				+ " '" + customerArray[4] + "',"
				+ " '" + customerArray[5] + "',"
				+ " '" + customerArray[6] + "',"
				+ " '" + customerArray[7] + "',"
				+ " '" + customerArray[8] + "',"
				+ " '" + customerArray[9] + "',"
				+ " " + customerArray[10] + ")";

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
					return "Registration successful. Thank you for joining Travel Experts.";
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
		

		public void displayForm(String [] customerArray, JspWriter out) throws IOException
		{

		}
		
		public String validate(String [] customerData)
		{
			for (int i=0; i<customerData.length; i++)
			{
				if (customerData[i].equals(""))
				{
					switch(i)
					{
						case 0:
							return "**First name must have a value!**";
						
						case 1:
							return "**Last name must have a value!**";
						
						case 2:
							break;						
						
						case 3:
							return "**You must include your city name!**";
							
						case 4:
							return "**You must include your province or state name!**";
							
						case 5:
							return "**You must include your country name!**";
							
						case 6:
							return "**You must include your postal or zip code!**";
							
						case 7:
							return "**Please provide your home phone number!**";
							
						case 8:
							break;
							
						case 9:

							break;
						
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


		
	<%
		if (request.getParameter("submit") != null)
		{
			String [] customer = new String[11];
			customer[0] = (String)request.getParameter("CustFirstName");
			customer[1] = (String)request.getParameter("CustLastName");
			customer[2] = (String)request.getParameter("CustAddress");
			customer[3] = (String)request.getParameter("CustCity");
			customer[4] = (String)request.getParameter("CustProv");
			customer[5] = (String)request.getParameter("CustCountry");
			customer[6] = (String)request.getParameter("CustPostal");
			customer[7] = (String)request.getParameter("CustHomePhone");
			customer[8] = (String)request.getParameter("CustBusPhone");
			customer[9] = (String)request.getParameter("CustEmail");
			customer[10] = (String)request.getParameter("AgentID");
	
			//pass data to validation function
			String message = validate(customer);
			
			if (message.equals(""))
			{
				//if not valid set error message and redisplay form
				out.print("<h4 style='color:crimson'>" + createCustomer(customer) + "</h4>");
				
				//after writing customer data empty the array so form will be empty
					customer[0] = "";
					customer[1] = "";
					customer[2] = "";
					customer[3] = "";
					customer[4] = "";
					customer[5] = "";
					customer[6] = "";
					customer[7] = "";
					customer[8] = "";
					customer[9] = "";
					customer[10] = "";
			
				displayForm(customer, out);
			} else
			{
			   out.print("<h4 style='color:crimson'>" + message + "</h4>");
			   //document.getElementById("formMessage").innerHTML = message;
			   displayForm(customer, out);
		    }
		}
		else
		{
			//display form
			String [] customer = {"","","","","","","","","","",""};
			displayForm(customer, out);
		}
	%>
		
		
	<section id="bodyBack">
	<!-- REGISTRATION FORM -->
	<section id="registrationForm">
	    <div class="container">
	        <div class="row ">
                <div class="text-center g-pad-bottom">
                   <div class="col-md-12 col-sm-12 alert-info">
                        <h4>Travel Experts Member Registration</h4>
                        <p>
                            Register today to learn about our special promotions, member discounts, and last minute deals.
                        </p>
                    </div>
                </div>
            </div>
	        
		    <div class="col-md-offset-2 col-md-8">
		    	
		    	<!-- NOTE: POST method used for more security -->
			    <!-- NOTE: action appends to end of URL string using; Project / ServletName -->
			    <form name="customerform" method="post" action="" class="form-horizontal" >
	
				<h6 class="text-left">Required fields indicated with a *</h6>
		        
		       	<div class="form-group">
			       	<label class="col-md-3 control-label">*First Name</label>
					<div class="col-md-6">	       
						<input name='CustFirstName' type='text' id='CustFirstName' class="form-control" TabIndex="1" placeholder="First Name" value="<%=CustFirstName%>" /> 
			       	</div>
		        </div>
		        
		       	<div class="form-group">
			       	<label class="col-md-3 control-label">*Last Name</label>
				 	<div class="col-md-6">
						<input name='CustLastName' type='text' id='CustLastName' class="form-control" TabIndex="2" placeholder="Last Name" value="<%=CustLastName%>" />
		       		</div>
		       	</div>
		       	
		       	<div class="form-group">
			       	<label class="col-md-3 control-label">Address</label>
			       	<div class="col-md-6">
						<input name='CustAddress' type='text' id='CustAddress' class="form-control" TabIndex="3" placeholder="Address" value="<%=CustAddress%>" />
		       		</div>
				</div>
				
		       	<div class="form-group">
			       	<label class="col-md-3 control-label">*City</label>
			       	<div class="col-md-6">
						<input name='CustCity' type='text' id='CustCity' class="form-control" TabIndex="4" placeholder="City" value="<%=CustCity%>" />
			       	</div>
				</div>
	                
		        <div class="form-group">
		            <label class="col-md-3 control-label">*Province</label>
		            <div class="col-md-3">
						<input name='CustProv' type='text' id='CustProv' class="form-control" TabIndex="5" placeholder="Province" value="<%=CustProv%>" />         
		            </div>
		            <label class="col-md-3 control-label">*Country</label>
		            <div class="col-md-3">
						<input name='CustCountry' type='text' id='CustCountry' class="form-control" TabIndex="6" placeholder="Country" value="<%=CustCountry%>" />
		            </div>
		        </div>
	
		        <div class="form-group">
		        	<label class="col-md-3 control-label">*Postal Code</label>
		        	<div class="col-md-3">
						<input name='CustPostal' type='text' id='CustPostal' class="form-control" TabIndex="7" placeholder="Postal" value="<%=CustPostal%>" />
			        </div>
		        </div>
				
		        <div class="form-group">
		           	<label class="col-md-3 control-label">*Home Phone</label>
		           	<div class="col-md-3">
						<input name='CustHomePhone' type='text' id='CustHomePhone' class="form-control" TabIndex="8" placeholder="Home Phone" value="<%=CustHomePhone%>" />	
		            </div>
		            <label class="col-md-3 control-label">Business Phone</label>
			            <div class="col-md-3">
					<input name='CustBusPhone' type='text' id='CustBusPhone' class="form-control" TabIndex="9" placeholder="Business Phone" value="<%=CustBusPhone%>" />
		            </div>
		        </div>
		         
		        <div class="form-group">
		        	<label class="col-md-3 control-label">Email</label>
		        	<div class="col-md-6">
						<input name='CustEmail' type='email' id='CustEmail' class="form-control" TabIndex="10" placeholder="Email" value="<%=CustEmail%>" />	    
		         	</div>
		         </div>
		        <div class="form-group">
		        	<label class="col-md-3 control-label">Username</label>
		        	<div class="col-md-6">
						<input name='CustUsername' type='text' id='CustUsername' class="form-control" TabIndex="11" placeholder="Username" value="<%=CustUsername%>" />
		        	</div>
				</div>
				
		        <div class="form-group">
			        <label class="col-md-3 control-label">Password</label>
			        <div class="col-md-4">
						<input name='CustPassword' type='password' id='CustPassword' class="form-control" TabIndex="12" placeholder="Password" value="<%=CustPassword%>" />
			        </div>
			    </div>
			         
				<div class="form-group">		   
			        <label class="col-md-3 control-label">Re-enter Password</label>
			        <div class="col-md-4">
						<input name='CustPassword2' type='password' id='CustPassword2' class="form-control" TabIndex="13" placeholder="Re-enter Password" value="<%=CustPassword2%>" />	
		        	</div>
				</div>
				
				<br />
	 			<div class="form-group">
		        	<label class="col-md-12 text-center" ID="lblError" style="color:red">
		        	    <% 
					        // If message null nothing to output
					        if (message == null) 
					            out.print("");
					        // If message not null print its message
					        else
					            out.print(message);
					        //out.print("session id:" + session.getId()); 
					    %>
		        	</label>
		       	</div>
		        <br />
		        
		        <div class="text-center">
					<input type='submit' name='submit' value='Register' class="btn btn-primary btn-lg" >
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input name='reset' type='reset' id='reset' value='Reset' class="btn btn-warning btn-lg" />
				</div>
				
				<br />
	            <p><b>Privacy statement:</b> Travel Experts respects your privacy. We will not share your information.</p>
				
	          	</form>
		    </div> 
	    </div>
	</section> 
	<!-- END REGISTRATION FROM -->
	</section>
	
    <jsp:include page="/footer.jsp"/>
    
    
</body>
</html>