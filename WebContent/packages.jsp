
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

	<jsp:include page="/header.jsp"/>

<body>

	<jsp:include page="/navbar.jsp"/>

	<section id="bodyBack">
    <!--Package SECTION-->    
    <section  id="services-sec">
        <div class="container">
            <div class="row ">
                <div class="text-center g-pad-bottom">
                   	<div class="col-md-12 col-sm-12 alert-info">
                   		<h4>Package Tours Available</h4>                          
                   	</div>
                    <div class="col-md-12 col-sm-12 alert-info">
                        <p>Browse through our selection of award-winning luxury tour packages and book one today!</p>                          
                    </div>
                </div>
            </div>
            
		<c:forEach items="${travelpackages}" var="travelpackage">
			
          	<div class="row go-marg">    
              
				<div class="col-md-3 col-sm-3">  
					<div class="panel panel-default ">   
                  	<div class="panel-body">   
                     	<h4><c:out value="${travelpackage.pkgName}"/></h4>
                    	<p><c:out value="${travelpackage.pkgDesc}"/></p>  
                    	<a class="btn btn-primary btn-md" href="bookings.jsp">Book Now!</a> 
                    	<br />
                    	<br />             
                	</div>
                	</div>
                </div>
                
                <div class="col-md-3 col-sm-3">
                	<div class="panel panel-default ">   
                  	<div class="panel-body">   
                	    <br/>
					    <br/>
                		<c:set var="sum" value="${travelpackage.pkgBasePrice + travelpackage.pkgAgencyCommission}"/>
                		<h4 class="label label-danger">Cost: <fmt:formatNumber value='${sum}'
                           type="currency" groupingUsed='true' /></h4>
                        <br/>
                        <br/>
						<p>Departure: <c:out value="${travelpackage.pkgStartDate}"/></p>
						<p>Return: <c:out value="${travelpackage.pkgEndDate}"/></p>
                        <br/>
   					</div>    
               		</div>
           		</div> 

           		<div class="col-md-6 col-sm-6">
                	<div class="panel panel-default ">   
                	<div class="panel-body">
   						<c:set var="strings" value="${fn:split(travelpackage.pkgName, ' ')}" />
   						<c:set var="string0" value="${fn:toLowerCase(strings[0])}" />
   						<img src="${pageContext.request.contextPath}/images/${string0}.png" alt="${string0}" class="img-rounded" height="250" />
   					</div> 
   					</div>     
                </div>
            </div>
        	
   		</c:forEach> 
          
        </div>
    </section>
    <!--END Package SECTION-->
    </section>
  
    <jsp:include page="/footer.jsp"/>
    
    
</body>
</html>