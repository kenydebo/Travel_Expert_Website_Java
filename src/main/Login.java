package main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbase.Customer;
import static dbase.CustomerDB.getCustomer;
import static dbase.CustomerDB.getCustomerUserid;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/*

enable customers to display and update their account info in a web page using Java Server Page 
technology to serve out database-driven pages. 

develop a couple of JSP pages that can be called from the customer account page to allow customers to view and print their travel information. 
Depending on your site design, these could use AJAX to update main page or load separate pages. 
We are not specifying the exact features so you have the freedom to be creative.

One of your team members should also build a customer authentication page to ensure that a customer 
can only view their own data.


Don’t forget to check if the page is loading for the first time, 
as you don’t need to call the database unless the page was submitted.

 */

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    // Variables
    private String dbuser;
    private String dbpass;
    
      
    @Override
    public void init() throws ServletException {
        
        dbuser = getInitParameter("dbuser");
        dbpass = getInitParameter("dbpass");        
        System.out.println("user:" + dbuser + " pass:" + dbpass);
        
        super.init(); //To change body of generated methods, choose Tools | Templates.
    }

      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String message = "";

        // From form field data get customerid for custuserid
        Customer customer = getCustomerUserid(request.getParameter("userid"));
        String password = request.getParameter("password"); 
        String userid = Integer.toString(customer.getCustomerId());
        // Connect to db to get Customer record from db
        //Customer customer = getCustomer(userid);  
        
        // Confirm data matches
        System.out.print(userid + password + "  " + customer.getCustomerId() + customer.getCustPassword() );
        
        // test w James133 
        if (password.equals(customer.getCustPassword()) )
        {
            // NOTE: session is built-in to .jsp pages but in .java you must create one!
            HttpSession session = request.getSession();
            //Set session loginStatus to true
            session.setAttribute("loginStatus", "true");
            // OR in one line
            // request.getSession().setAttribute("loginStatus", "true");
            
            // set loginid session attribute from page userid parameter
            session.setAttribute("loginid", userid);	// CustomerId
            session.setAttribute("custid", customer.getCustUserid());		// CustUserid
            session.setAttribute("custname", customer.getCustFirstName());
            
            // Redirect to customer page
            //response.sendRedirect("customer.jsp");
            // OR RequestDispatcher which allows you to send request response data w/o having to use session to pass data
            RequestDispatcher rd = request.getRequestDispatcher("customer.jsp");
            rd.forward(request, response);
        }
        else
        {
            // Send message through session 
            message = "User Login Failed. UserId or Password was incorrect.";
            HttpSession session = request.getSession();
            session.setAttribute("message", message);
            session.setAttribute("loginStatus", "false");
            
            // Redirect back to login page
            response.sendRedirect("login.jsp");
      
            // OR Can append message to url
            //response.sendRedirect("login.jsp?message=" + message);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
