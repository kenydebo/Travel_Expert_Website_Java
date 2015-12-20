
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
 * Servlet implementation class GetCustomer
 */
@WebServlet("/GetCustomer")
public class GetCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 
		PrintWriter out = response.getWriter();
		response.setHeader("Access-Control-Allow-Origin", "*");
		
		String custid = request.getParameter("custid");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelexperts", "root", "P@ssw0rd");
			PreparedStatement stmt = conn.prepareStatement("select * from customers where CustomerId=?");
			stmt.setString(1, custid);
			ResultSet rs = stmt.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			StringBuffer output = new StringBuffer();
			if (rs.next())
			{
				
				output.append("<div id='container'>");
				output.append("<div id='demo_jui'>");
			
				output.append("<table class='table table-striped' id='customer' >");
				output.append("<thead>");
				output.append("<tr>");
				for (int i=1; i<=rsmd.getColumnCount(); i++)
				{
				   output.append("<th>" + rsmd.getColumnLabel(i) + "</th>");
				}
				output.append("</tr>");
				output.append("</thead>");
				
				output.append("<tbody>");
				output.append("<tr>");
				for (int i=1; i<=rsmd.getColumnCount(); i++)
				{
				   output.append("<td>" + rs.getString(i) + "</td>");
				}
				output.append("</tr>");
				output.append("</tbody>");
				output.append("</table>");
				output.append("</div");
				output.append("</div");
			}
			else
			{
				output.append("<h1>Customer not found</h1>");
			}
			conn.close();
			out.print(output);
		} catch (ClassNotFoundException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
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
