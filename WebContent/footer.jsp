
	<!-- FOOTER SECTION -->
 	<div id="footer">
		<div class="container">
			<div class="row text-center">
				<div class="col-md-12 col-sm-12">
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-center">
	                        <li><a id="F0" href="index.jsp">HOME</a></li>
							<li><a id="F1" href="packages.jsp">PACKAGES</a></li>
							<li><a id="F2" href="contact.jsp">CONTACT</a></li>
							<li><a id="F7" href="bookings.jsp">BOOK NOW</a></li>
							<!-- LOGIN OR LOGOUT based on session value -->
				            <%
				                String username= (String) session.getAttribute("loginid");   
				            	String custname = (String) session.getAttribute("custname");
				                if (username == null) {
				            %>
				            <li><a id="F3" href="register.jsp">REGISTRATION</a></li>
				            <li><a id="F4" href="login.jsp">LOG IN</a></li>
					        <% } else {
					         %>
					         	<li><a id="F5" href="customer.jsp"><%=custname%>'s HOMEPAGE</a></li>
					         	<li><a id="F6" href="/Workshop7/Logout">LOG OUT</a></li>
					        <% }%>
                        </ul>
                        <a href="http://instagram.com"><img class="logo-mkfz" src="images/instagram.png"/></a>
					    <a href="http://facebook.com"><img class="logo-mkfz" src="images/facebook.png"/></a>
					    <a href="http://googleplus.com"><img class="logo-mkfz" src="images/googleplus.png"/></a>
					    <a href="http://twitter.com"><img class="logo-mkfz" src="images/twitter.png"/></a>
                    	<img class="logo-mkfz" src="images/mfkz.png"/>
                    	<h5>Copyright &copy; 2015</h5>
                    </div>
				</div>
			</div>
		</div>
    </div>
    <!-- END FOOTER SECTION -->
    
    <!-- JAVASCRIPT FILES PLACED AT BOTTOM TO REDUCE LOADING TIME  -->
    <!-- CORE JQUERY  -->
    <script src="/jquery-2.1.4.min.js"></script>
    <!-- BOOTSTRAP CORE SCRIPT   -->
    <script src="/bootstrap/js/bootstrap.min.js"></script>  
     
   	