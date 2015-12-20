
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%!
	// Declare variables
	String message = "";
%>


	<jsp:include page="/header.jsp"/>

<body>

	<jsp:include page="/navbar.jsp"/>

	<section id="bodyBack">
    <!--CONTACT SECTION-->    
    <section  id="services-sec">
        <div class="container">
            <div class="row ">
                <div class="text-center g-pad-bottom">
                   <div class="col-md-12 col-sm-12 alert-info">
						<h4 class="adjst" >
                      		1-800-TRA-VELX      
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      		info@TravelExperts.com
						</h4>
					</div>
				   <div class="col-md-12 col-sm-12 alert-info">
				       	<p>
                   			Contact us: online, toll-free phone, email, or 
                            in person at one of our locations. 
                        </p>      
                    </div>
                </div>
            </div>
             
			<c:forEach items="${agencies}" var="agency">
			      
            
           	<div class="row go-marg">
            
				<div class="col-md-6 col-sm-6">
					
					<div class="col-md-6 col-sm-6">
					<div class="panel panel-default ">   
                	<div class="panel-body">
						<h4 class="adjst"><c:out value="${agency.agncyAddress}"/></h4>
						<span>
						    <c:out value="${agency.agncyCity}" /> 
						    <c:out value="${agency.agncyProv}" />
						    <br/>
							<c:out value="${agency.agncyPostal}" />
							<br/>
							<c:out value="${agency.agncyCountry}" />
						</span>
						<br/>
						<br/>
						<h4 class="adjst"><c:out value="${agency.agncyPhone}" /></h4>
						<p>Fax: <c:out value="${agency.agncyFax}" /></p>
					</div>
					</div>
					</div>
					
					<div class="col-md-6 col-sm-6">
					<div class="panel panel-default ">   
                	<div class="panel-body">
					   	<h4 class="adjst">Agents</h4>
					   	<br/>
						<br/>
					   	<p>
	                       	Lorem ipsum dolor sit amet, consectetur adipiscing elit.
	              			Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
	                  	</p>
	                  	<br/>
						<br/>
					</div>
					</div>
					</div>
			
           		</div>
				
                <div class="col-md-6 col-sm-6">
					<iframe class="cnt" src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d2508.3677496242512!2d-114.0885587!3d51.04629709999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sca!4v1432088827996" ></iframe>
           		</div>
           		
            					
			</div>
			
			
			</c:forEach>
			
		 	<div class="row g-pad-bottom">
            
				<div class="col-md-12 col-sm-12">
					<h2 class="text-info">Message Us! </h2>
				</div>   
				
				<div class="col-md-6 col-sm-6">
	                <div class="row">
	                <div class="col-md-12 ">
                        <div class="form-group">
                            <textarea name="message" id="message" required="required" class="form-control" rows="10" placeholder="Message"></textarea>
                        </div>
	                </div>
	                </div>
              	</div>
              	
				<div class="col-md-6 col-sm-6">
				
	                <div class="form-group">
	                    <input type="text" class="form-control" id="name" required="required" placeholder="Name">
	                </div>
	                <div class="form-group">
	                    <input type="text" class="form-control" id="email" required="required" placeholder="Email address">
	                </div>
	                <div class="form-group">
	                    <form name="contactform" method="post" >
	                    <button type="submit" name="submit" value="submit" class="btn btn-primary btn-lg"  >Submit</button>
	                    </form>
						<%     
					        if (request.getParameter("submit") != null)
							{
					        	
// 						        	String [] customer = new String[3];
// 									customer[0] = (String)request.getParameter("message");
// 									customer[1] = (String)request.getParameter("name");
// 									customer[2] = (String)request.getParameter("email");
									
// 									if (customer[0].equals("") || customer[1].equals("") || customer[2].equals("") )
// 									{
						
							        	//String message = "We receive your email, Thanks for choosing us";
// 							        	out.print("<div ><h4 >" + "Please fill out all fields." + "</h4></div>");
// 									}
// 									else 
										//String message = "We receive your email, Thanks for choosing us";
							        	out.print("<div ><h4 >" + " Message received, Thank You" + "</h4></div>");
								}
						        %>
	                </div>
	                
				</div>	
				
            </div>
        </div>
    </section>
    <!--END CONTACT SECTION-->
    </section>
   
    <jsp:include page="/footer.jsp"/>
    
    
</body>
</html>