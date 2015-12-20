package dbase;

import static dbase.MySQLData.connectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class CustomerDB {
      
    
       
    public static Customer getCustomer(String customerId)  
    {
        // Local variables
        Connection connection = null;
        ResultSet resultSet = null;
        PreparedStatement statement = null;   
        
        Customer customer = new Customer();

        try 
        {
            // Open db connection
            connection = connectDB();
            
            // Define query string 
            String query = " SELECT * FROM Customers " +
                " WHERE CustomerId=?";
            
            // Statements allow us to issue SQL queries to dbase
            statement = connection.prepareStatement(query);
            statement.setString(1, customerId);
            
            // Execute SQL statement and get back a result set (or an exception)
            resultSet = statement.executeQuery();
            
            // Add data to customer 
            while (resultSet.next()) 
            {   
                customer.setCustomerId(resultSet.getInt("CustomerId"));
                customer.setCustAddress((resultSet.getString("CustAddress")));
                customer.setCustBusPhone((resultSet.getString("CustBusPhone")));
                customer.setCustCity((resultSet.getString("CustCity")));
                customer.setCustCountry((resultSet.getString("CustCountry")));
                customer.setCustEmail((resultSet.getString("CustEmail")));
                customer.setCustFirstName((resultSet.getString("CustFirstName")));
                customer.setCustLastName((resultSet.getString("CustLastName")));
                customer.setCustHomePhone((resultSet.getString("CustHomePhone")));                
                customer.setCustPostal((resultSet.getString("CustPostal")));
                customer.setCustProv((resultSet.getString("CustProv")));
                customer.setAgentId(resultSet.getInt("AgentId"));
                customer.setCustPassword(resultSet.getString("CustPassword"));
                customer.setCustUserid(resultSet.getString("CustUserid"));
            }  
        } 
        catch ( SQLException e) {
             e.printStackTrace();
        } 
        finally {
            // Cleanup
            if (resultSet != null) try { resultSet.close(); } catch (SQLException ignore) {}
            if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
            if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
        }
        // Return agents list
        return customer;
    }
    
    
    public static List<Customer> getCustomers(String query)  
    {
        // Local variables
        Connection connection = null;
        ResultSet resultSet = null;
        Statement statement = null;     
        
        List<Customer> customers = new ArrayList<Customer>();

        try 
        {
            // Open db connection
            connection = connectDB();
            
            // Statements allow us to issue SQL queries to dbase
            statement = connection.createStatement();

            // Execute SQL statement and get back a result set (or an exception)
            resultSet = statement.executeQuery(query);
      
            // Add Agent objects to agents list
            while (resultSet.next()) 
            {
                Customer customer = new Customer();
                customer.setCustomerId(resultSet.getInt("CustomerId"));
                customer.setCustAddress((resultSet.getString("CustAddress")));
                customer.setCustBusPhone((resultSet.getString("CustBusPhone")));
                customer.setCustCity((resultSet.getString("CustCity")));
                customer.setCustCountry((resultSet.getString("CustCountry")));
                customer.setCustEmail((resultSet.getString("")));
                customer.setCustEmail((resultSet.getString("CustEmail")));
                customer.setCustFirstName((resultSet.getString("CustFirstName")));
                customer.setCustLastName((resultSet.getString("CustLastName")));
                customer.setCustHomePhone((resultSet.getString("CustHomePhone")));                
                customer.setCustPostal((resultSet.getString("CustPostal")));
                customer.setCustProv((resultSet.getString("CustProv")));
                customer.setAgentId(resultSet.getInt("AgentId"));
                customer.setCustPassword(resultSet.getString("CustPassword"));
                customer.setCustUserid(resultSet.getString("CustUserid"));
                customers.add(customer);  
            }  
        } 
        catch ( SQLException e) {
             e.printStackTrace();
        } 
        finally {
            // Cleanup
            if (resultSet != null) try { resultSet.close(); } catch (SQLException ignore) {}
            if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
            if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
        }
        // Return agents list
        return customers;
    }
    
    public static Customer getCustomerUserid(String custuserId)  
    {
        // Local variables
        Connection connection = null;
        ResultSet resultSet = null;
        PreparedStatement statement = null;   
        
        Customer customer = new Customer();

        try 
        {
            // Open db connection
            connection = connectDB();
            
            // Define query string 
            String query = " SELECT * FROM Customers " +
                " WHERE CustUserid=?";
            
            // Statements allow us to issue SQL queries to dbase
            statement = connection.prepareStatement(query);
            statement.setString(1, custuserId);
            
            // Execute SQL statement and get back a result set (or an exception)
            resultSet = statement.executeQuery();
            
            // Add data to customer 
            while (resultSet.next()) 
            {   
                customer.setCustomerId(resultSet.getInt("CustomerId"));
                customer.setCustAddress((resultSet.getString("CustAddress")));
                customer.setCustBusPhone((resultSet.getString("CustBusPhone")));
                customer.setCustCity((resultSet.getString("CustCity")));
                customer.setCustCountry((resultSet.getString("CustCountry")));
                customer.setCustEmail((resultSet.getString("CustEmail")));
                customer.setCustFirstName((resultSet.getString("CustFirstName")));
                customer.setCustLastName((resultSet.getString("CustLastName")));
                customer.setCustHomePhone((resultSet.getString("CustHomePhone")));                
                customer.setCustPostal((resultSet.getString("CustPostal")));
                customer.setCustProv((resultSet.getString("CustProv")));
                customer.setAgentId(resultSet.getInt("AgentId"));
                customer.setCustPassword(resultSet.getString("CustPassword"));
                customer.setCustUserid(resultSet.getString("CustUserid"));
            }  
        } 
        catch ( SQLException e) {
             e.printStackTrace();
        } 
        finally {
            // Cleanup
            if (resultSet != null) try { resultSet.close(); } catch (SQLException ignore) {}
            if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
            if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
        }
        // Return agents list
        return customer;
    }
    
    
    public static void updateCustomerAgent(String customerId, String AgentId) 
    {
        // Local variables
        Connection connection = null;
        ResultSet resultSet = null;
        PreparedStatement statement = null;
        
        try 
        {
            // Open db connection
            connection = connectDB();
            
            // Statements allow us to issue SQL queries to dbase
            String query = "UPDATE Customers SET " + 
                    "AgentId = ? WHERE CustomerID = ? " ; 

            statement = connection.prepareStatement(query);
            //String temp = txtAgtFirstName.getText();
            statement.setString(1, customerId);
            statement.setString(2, AgentId);      
            
            
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Update successful!");
            }    
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            // Cleanup
            if (resultSet != null) try { resultSet.close(); } catch (SQLException ignore) {}
            if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
            if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
        }
    }
            
        
    
}
