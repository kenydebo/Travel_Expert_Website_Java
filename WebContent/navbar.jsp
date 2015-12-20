
	<!-- NAV SECTION -->
	<div class="navbar navbar-inverse ">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">
					<img class="logo" src="images/logo.png" alt="Travel Experts"/>
				</a>
			</div>
			<div >
				<ul class="nav navbar-nav navbar-right">
					<li><a id="A0" href="index.jsp">HOME</a></li>
					<li><a id="A1" href="/Workshop7/GetPackages">PACKAGES</a></li>
					<li><a id="A2" href="/Workshop7/GetAgencies">CONTACT</a></li>
					<li><a id="A3" href="/Workshop7/bookings.jsp">BOOK NOW</a></li>
					<!-- LOGIN OR LOGOUT based on session value -->
		            <%
		                String username= (String) session.getAttribute("loginid");
		                String custname = (String) session.getAttribute("custname");
		                if (username == null) {
		            %>
		            <li><a id="A3" href="register.jsp">REGISTRATION</a></li>
		            <li><a id="A5" href="login.jsp">LOG IN</a></li>
		
		        <% } else {
		         %>
		         	<li><a id="A5" href="customer.jsp"><%=custname%>'s HOMEPAGE</a></li>
		         	<li><a id="A6" href="/Workshop7/Logout">LOG OUT</a></li>
		        <% }%>
				</ul>
			</div>
		</div>
	</div> 					
    <!--END NAV SECTION -->
