
<!-- Zahra -->
<%@page import="dbase.CustomerDB"%>
<%@page import="dbase.Customer"%>
<%@ page import="java.sql.*, java.io.*" %>

<%!
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
    String loginid = ""; 

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
	
%>




<%!		
		//to show the data in textfields
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
		
		
		 		
		public String updateCustomer(String [] customerArray) 
		{
			
			String message ="";
			//retrieve data from database
		  	String sql = "UPDATE Customers SET " + 
				"CustFirstName=?, " + 
 				"CustLastName=?, " + 
 				"CustAddress=?, " +
 				"CustCity=?, " + 
 				"CustProv=?, " + 
 				"CustPostal=?, " +
				"CustCountry=?, " + 
 				"CustHomePhone=?, " +
 				"CustBusPhone=?, " +
			 	"CustEmail=?, " + 
				"CustPassword=?, " + 		 
				"CustUserid=? " + 
	          	"WHERE CustomerId=?"; 
		           
				 try
				    {
				    	// connect to database	    	
				        Class.forName("com.mysql.jdbc.Driver");
						Connection dbConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelexperts","root","P@ssw0rd");
				        
						//put data from database to statement
				        PreparedStatement preparedStmt = dbConn.prepareStatement(sql);
				        
						//put daat from statement to array
				        preparedStmt.setString(1, customerArray[0]);
				        preparedStmt.setString(2, customerArray[1]);
				        preparedStmt.setString(3, customerArray[2]);
				        preparedStmt.setString(4, customerArray[3]);
				        preparedStmt.setString(5, customerArray[4]);
				        preparedStmt.setString(6, customerArray[5]);
				        preparedStmt.setString(7, customerArray[6]);
				        preparedStmt.setString(8, customerArray[7]);
				        preparedStmt.setString(9, customerArray[8]);
				        preparedStmt.setString(10, customerArray[9]);
				        preparedStmt.setString(11, customerArray[10]);
				        preparedStmt.setString(12, customerArray[11]);
			        	preparedStmt.setInt(13, Integer.parseInt(loginid));
		
				        //to know that whether the update happen or not
			        	int rowsInserted = preparedStmt.executeUpdate();
				        
		
				        // Cleanup
				        dbConn.close();  
				        
				        //check for update
						if (rowsInserted >= 1)
						{
							 System.out.println("Update successful!");
							 message="Update Succesfull!";
						}
						else message="Sorry Update is not Successfull";
		    		}
		   		 catch (Exception excp)
		    		{
		        		excp.printStackTrace();
		   		 	}
				 
				 //fill the textboxes
				 try 
				 {
				 Class.forName("com.mysql.jdbc.Driver");
				 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelexperts", "root", "P@ssw0rd");
				 PreparedStatement stmt = conn.prepareStatement("select * from customers where CustomerId=?");
				 stmt.setString(1, loginid);
				 ResultSet resultset = stmt.executeQuery();
				 ResultSetMetaData rsmd = resultset.getMetaData();
				 StringBuffer output = new StringBuffer();

				 while (resultset.next())
				 {
				     CustFirstName = resultset.getString(2);
				 	CustLastName = resultset.getString(3);
				 	CustAddress = resultset.getString(4);
				 	CustCity = resultset.getString(5);
				 	CustProv = resultset.getString(6);
				 	CustCountry = resultset.getString(7);
				 	CustPostal = resultset.getString(8);
				 	CustHomePhone = resultset.getString(9);
				 	CustBusPhone = resultset.getString(10);
				 	CustEmail = resultset.getString(11);
				 	CustUsername = resultset.getString(12);
				 	CustPassword = resultset.getString(13);
				 	CustPassword2 = resultset.getString(13);  
				 }
				 conn.close();
				 }catch(ClassNotFoundException e)
				 {
					 e.getStackTrace();
				 }catch(SQLException e)
				 {
					 e.getStackTrace();
				 }
				 
		
				 
				 return message;
				 
		}
%>

<%
//filling textboxes
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelexperts", "root", "P@ssw0rd");
PreparedStatement stmt = conn.prepareStatement("select * from customers where CustomerId=?");
stmt.setString(1, loginid);
ResultSet resultset = stmt.executeQuery();
ResultSetMetaData rsmd = resultset.getMetaData();
StringBuffer output = new StringBuffer();

while (resultset.next())
{
    CustFirstName = resultset.getString(2);
	CustLastName = resultset.getString(3);
	CustAddress = resultset.getString(4);
	CustCity = resultset.getString(5);
	CustProv = resultset.getString(6);
	CustCountry = resultset.getString(7);
	CustPostal = resultset.getString(8);
	CustHomePhone = resultset.getString(9);
	CustBusPhone = resultset.getString(10);
	CustEmail = resultset.getString(11);
	CustUsername = resultset.getString(12);
	CustPassword = resultset.getString(13);
	CustPassword2 = resultset.getString(13);  
}
conn.close();
%> 



	<jsp:include page="/header.jsp"/>
	
<body>


	<jsp:include page="/navbar.jsp"/>

	
		
	
	<section id="bodyBack">
	<!-- PROFILE FORM -->
	<section id="profileForm">
	     <div class="container">
	        
	        <div class="row ">
                <div class="text-center g-pad-bottom">
                   <div class="col-md-12 col-sm-12 alert-info">
                            <h4>Update Customer Profile</h4>
                            <p>
                                Please use the form on this page to update your customer profile. 
                            </p>
                            
                    </div>
                </div>
            </div>
            <div class=" text-center col-md-12 col-sm-12  ">
            <!-- the update button -->
              <%
			if (request.getParameter("submit") != null)
			{
				String [] customer = new String[12];
				customer[0] = (String)request.getParameter("CustFirstName");
				customer[1] = (String)request.getParameter("CustLastName");
				customer[2]= (String)request.getParameter("CustAddress");
				customer[3]= (String)request.getParameter("CustCity");
				customer[4] = (String)request.getParameter("CustProv");
				customer[5] = (String)request.getParameter("CustPostal");
				customer[6] = (String)request.getParameter("CustCountry");
				customer[7] = (String)request.getParameter("CustHomePhone");
				customer[8] = (String)request.getParameter("CustBusPhone");
				customer[9] = (String)request.getParameter("CustEmail");
				customer[10] = (String)request.getParameter("CustPassword");
				customer[11] = (String)request.getParameter("CustUsername");
				
				System.out.println("customer length " + customer.length);
				//pass data to validation function
				String message = validate(customer);
				
				if (message.equals(""))
				{
					//if not valid set error message and redisplay form
					out.print("<div class='col-md-12 col-sm-12' ><h4 class='col-md-12 col-sm-12' style='color:crimson'>" + updateCustomer(customer) + "</h4></div>");
					
					
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
						customer[11] = "";
				
					displayForm(customer, out);
				} else
				{
				   out.print("<h4 style='color:crimson'>" + message + "</h4>");

				   displayForm(customer, out);
			    }
			}
			else
			{
				//display form
				String [] customer = {"","","","","","","","","","","",""};
				displayForm(customer, out);
			}
	
		%>	
	      </div>  
	    <div class="col-md-offset-2 col-md-8">
	  
	    	
	    	<!-- NOTE: POST method used for more security -->
		    <!-- NOTE: action appends to end of URL string using; Project / ServletName -->
		    <form name="customerform" method="post" action="" class="form-horizontal" >

			<h6 class=" text-center col-md-12 col-sm-12  " class="text-left">Required fields indicated with a *</h6>
			
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
							<input name='CustProv' type='text' id='CustProv'
								class="form-control" TabIndex="5" placeholder="Province"
								value="<%=CustProv%>" />
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
			
	        <label ID="formMessage" style="color: red"></label>
	        <br />
	        
			<div class="text-center">
				<input type='submit' name='submit' value='Update' class="btn btn-primary btn-lg" 
					onClick="" onsubmit="">
					
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input name='reset' type='reset' id='reset' value='Reset' class="btn btn-warning btn-lg" onClick="this.form.reset()"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<a name="cancel" class="btn btn-danger btn-lg" href="customer.jsp">Cancel</a>
				
			</div>
			
			

        

		
			<br />
            <p><b>Privacy statement:</b> Travel Experts respects your privacy. We will not share your information with anyone</p>
            
          	</form>
	    </div> 
	    </div>
	</section> 
	<!-- END PROFILE Form -->
	</section>
		  
    <jsp:include page="/footer.jsp"/>
    
</body>
<html></html>