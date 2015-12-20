/*Author:Filmon Ghezehey
 *Date: Oct-5-2015
 *Purpose: A servelet that gets all the Customers booking Information from the database  
 */

package dbase;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetCustomerBookings
 */
@WebServlet("/GetCustomerBookings")

public class GetCustomerBookings extends HttpServlet {
	String query;
	String dollar = "";
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetCustomerBookings() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		StringBuffer output = new StringBuffer();
		int mode = Integer.parseInt(request.getParameter("mode"));
		int state = Integer.parseInt(request.getParameter("state"));
		if (state == 0) {
			if (mode == 2) {
				query = "SELECT PkgName as PackageName,PkgStartDate as PackageStartDate, PkgEndDate as PackageEndDate,	PkgDesc as PackageDescription FROM Packages WHERE PackageId IN (SELECT PackageId from Bookings WHERE CustomerId=?)";
				GetInfo(request, response);
			} else if (mode == 3) {
				query = "SELECT ProdName, bd.ItineraryNo, bd.TripStart,bd.TripEnd,bd.Description,bd.BasePrice "
						+ "from Products p, Products_Suppliers ps,BookingDetails bd, Bookings b "
						+ "WHERE p.ProductId=ps.ProductId And ps.ProductSupplierId=bd.ProductSupplierId "
						+ " AND bd.BookingId=b.BookingId AND b.CustomerId =?";
				GetInfo(request, response);
			} else if (mode == 4) {
				query = "SELECT sum(bd.BasePrice) as TotalOwing FROM BookingDetails bd, Bookings b "
						+ "WHERE bd.BookingId = b.BookingId  AND b.CustomerId =?";
				dollar = "$";
				GetInfo(request, response);
				dollar = "";
			} else if (mode == 5) {
				query = "SELECT agtFirstName as FirstName, agtLastName as LastName, agtEmail as Email, agtBusPhone as Phone "
						+ "FROM agents a, customers c Where  c.AgentId = a.AgentId AND c.CustomerId=?";
				GetInfo(request, response);
			} else if (mode == 6) {
				query = "SELECT agncyAddress as Address, agncyCity as City, agncyCountry as Country, agncyProv as Province, agncyPostal as PostalCode, "
						+ " agncyPhone as Phone, agncyFax as Fax FROM agencies Where agencyId=?";
				GetInfo(request, response);
			} else {
				query = "SELECT BookingNo,BookingDate,TravelerCount, PkgName as PackageName FROM Bookings b,Packages p WHERE CustomerId=? AND p.PackageId = b.PackageId";
				GetInfo(request, response);
			}
		} else {
			out.append("<h3>Bookings<h3>");
			query = "SELECT BookingNo,BookingDate,TravelerCount, PkgName as PackageName FROM Bookings b,Packages p WHERE CustomerId=? AND p.PackageId = b.PackageId";
			GetInfo(request, response);
			out.append("Packages");
			query = "SELECT PkgName as PackageName,PkgStartDate as PackageStartDate, PkgEndDate as PackageEndDate,	PkgDesc as PackageDescription FROM Packages WHERE PackageId IN (SELECT PackageId from Bookings WHERE CustomerId=?)";
			GetInfo(request, response);
			out.append("Products");
			query = "SELECT ProdName, bd.ItineraryNo, bd.TripStart,bd.TripEnd,bd.Description,bd.BasePrice "
					+ "from Products p, Products_Suppliers ps,BookingDetails bd, Bookings b "
					+ "WHERE p.ProductId=ps.ProductId And ps.ProductSupplierId=bd.ProductSupplierId "
					+ " AND bd.BookingId=b.BookingId AND b.CustomerId =?";
			GetInfo(request, response);
			out.append("Total Owing");
			query = "SELECT sum(bd.BasePrice) as TotalOwing FROM BookingDetails bd, Bookings b "
					+ "WHERE bd.BookingId = b.BookingId  AND b.CustomerId =?";
			dollar = "$";
			GetInfo(request, response);
			dollar = "";
			out.append("Aagent");
			query = "SELECT agtFirstName as FirstName, agtLastName as LastName, agtEmail as Email, agtBusPhone as Phone "
					+ "FROM agents a, customers c Where  c.AgentId =a.AgentId AND c.CustomerId=?";
			GetInfo(request, response);
			out.append("Agencies");
			query = "SELECT agncyAddress as Address, agncyCity as City, agncyCountry as Country, agncyProv as Province, agncyPostal as PostalCode, "
					+ " agncyPhone as Phone, agncyFax as Fax FROM agencies ag, agents a, customers c Where a.agencyId=ag.agencyId AND "
					+ " a.agentId= c.agentId AND c.customerId=?";
			GetInfo(request, response);

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mode = request.getParameter("mode");
		if (mode == "packages") {
			query = "SELECT * FROM Packages WHERE PackageId IN (SELECT PackageId from Bookings WHERE CustomerId=?";
			GetInfo(request, response);
		} else if (mode == "products") {
			query = "SELECT ProdName, bd.ItineraryNo, bd.TripStart,bd.TripEnd,bd.Description,bd.BasePrice "
					+ "from Products p, Products_Suppliers ps,BookingDetails bd, Bookings b "
					+ "WHERE p.ProductId=ps.ProductId And ps.ProductSupplierId=bd.ProductSupplierId "
					+ " AND bd.BookingId=b.BookingId AND b.CustomerId =?";
			GetInfo(request, response);
		} else if (mode == "total") {
			query = "SELECT sum(bd.BasePrice) as totalamount " + "FROM BookingDetails bd, Bookings b "
					+ "WHERE bd.BookingId = b.BookingId " + "AND b.CustomerId =?";
			GetInfo(request, response);
		} else if (mode == "booking") {
			query = "SELECT * FROM Bookings WHERE CustomerId=?";
			GetInfo(request, response);
		}

	}

	protected void GetInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String custid = request.getParameter("custid");
		PrintWriter out = response.getWriter();
		response.setHeader("Access-Control-Allow-Origin", "*");

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelexperts", "root",
					"P@ssw0rd");
			/*
			 * PreparedStatement stmt = conn.prepareStatement(
			 * "select * from bookings b " +
			 * " inner join customers c on c.customerid = b.customerid where c.CustomerId=?"
			 * );
			 */
			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.setString(1, custid);
			ResultSet rs = stmt.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			StringBuffer output = new StringBuffer();

			output.append("<div id='container'>");
			output.append("<div id='demo_jui'>");

			output.append("<table class='table table-striped' id='customer' cellspacing='15' >");
			output.append("<thead>");
			output.append("<tr>");
			for (int i = 1; i <= rsmd.getColumnCount(); i++) {
				output.append("<td align='center'><b>" + rsmd.getColumnLabel(i) + "<b></td>");
			}
			output.append("</tr>");
			output.append("</thead>");

			output.append("<tbody>");

			while (rs.next()) {

				output.append("<tr>");				

				for (int i = 1; i <= rsmd.getColumnCount(); i++)
				{
						if (Integer.parseInt(request.getParameter("mode")) == 4) 
						{							
						
						// output.append("<td align='center'><script
						// type='text/javascript'>$(document).ready(function(){"
						//				+ "formatCurrency(" + rs.getString(i) + ");"
                         //		+ "});</script></td>");
							output.append("<td align='center'>"+"&#36;" + rs.getString(i) + "</td>");
						
					    }
						else if(Integer.parseInt(request.getParameter("mode")) == 3 && i==rsmd.getColumnCount())						
					    {
						output.append("<td align='center'>"+"&#36;" + rs.getString(i) + "</td>");
					    }
					   else				
						output.append("<td align='center'>" + rs.getString(i) + "</td>");
				}
				output.append("</tr>");

			}

	output.append("</tbody>");output.append("</table>");output.append("</div");;output.append("</div");output.append("<br><br>");

	conn.close();out.print(output);}catch(

	ClassNotFoundException e)

	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch(

	SQLException e)

	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}}
