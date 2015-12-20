    
<%!
    // Declare variables
    String message = "";
%>
<%
    // Get message value from session data
    message = (String)session.getAttribute("message");      
    
    // Reset session message value
    session.setAttribute("message", "");
    
    // Check value from session message
    if (message == null)
        message = "";
%>  
   
   
	<jsp:include page="/header.jsp"/>
	
<body>

	<jsp:include page="/navbar.jsp"/>

	<section id="bodyBack">
	<!-- LOGIN FORM -->
	<section id="loginForm">
		<div class="container">
	        <div class="row ">
                <div class="text-center g-pad-bottom">
                   <div class="col-md-12 col-sm-12 alert-info">
                        <h4>Member Log-in</h4>
                        <p>
                            Please enter your Travel Experts username and password 
                            to access your personal profile and booking information.
                        </p>
                    </div>
                </div>
            </div>
	        
	        <div class="row go-marg">
		    	<div class="col-md-offset-2 col-md-8">
		    	
			    	<!-- NOTE: POST method used for more security -->
				    <!-- NOTE: action appends to end of URL string using; Project / ServletName -->
				    <form name="loginform" method="post" action="/Workshop7/Login" class="form-horizontal">
			        
			        <br />
			        <br />
			        
			       	<div class="form-group">
				       	<label class="col-md-4 control-label">User ID</label>
						<div class="col-md-4">	       
							<input name='userid' type='text' id='txtUserName' class="form-control" TabIndex="1" placeholder="Username" /> 
				       	</div>
			        </div>
			        
			        <div class="form-group">
				        <label class="col-md-4 control-label">Password</label>
				        <div class="col-md-4">
							<input name='password' type='password' id='txtPassword' class="form-control" TabIndex="2" placeholder="Password" />
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
						<button type="submit" class="btn btn-primary btn-lg" ID="btnSubmitx" OnClick="btnSubmit_Click" >Login</button>
				        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				        <button type="reset" class="btn btn-warning btn-lg" ID="btnClearbtnClear" >Reset</button>
		        	</div>
		        	
			        </form>
	        	</div>
	        </div>
			<br />
	        <br />
	        <br />
	        <br />

	        <div class="row go-marg">
	        	<div class="text-center g-pad-bottom">
		        	<div class="col-md-12 col-sm-12 ">
						<p><b>Privacy statement:</b> Travel Experts respects your privacy. We will not share your information with anyone</p>
	                </div>
	            </div>
			</div>
			
	    </div> 
	</section> 
	<!-- END LOGIN FORM -->

    </section>
    <jsp:include page="/footer.jsp"/>
    
    
</body>
</html>