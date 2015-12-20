package dbase;

import static dbase.MySQLData.connectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AgencyDB {

	 public static Agency getAgency(String agencyId)  
	    {
	        // Local variables
	        Connection connection = null;
	        ResultSet resultSet = null;
	        PreparedStatement statement = null;   
	        
	        Agency agency = new Agency();

	        try 
	        {
	            // Open db connection
	            connection = connectDB();
	            
	            // Define query string 
	            String query = " SELECT * FROM Agencies " +
	                " WHERE AgencyId=?";
	            
	            // Statements allow us to issue SQL queries to dbase
	            statement = connection.prepareStatement(query);
	            statement.setString(1, agencyId);
	            
	            // Execute SQL statement and get back a result set (or an exception)
	            resultSet = statement.executeQuery();
	            
	            // Add data to customer 
	            while (resultSet.next()) 
	            {   
	            	agency.setAgencyId(resultSet.getInt("AgencyId"));
	            	agency.setAgncyAddress(resultSet.getString("AgncyAddress"));
	            	agency.setAgncyCity(resultSet.getString("AgncyCity"));
	            	agency.setAgncyProv(resultSet.getString("AgncyProv"));
	            	agency.setAgncyPostal(resultSet.getString("AgncyPostal"));
	            	agency.setAgncyCountry(resultSet.getString("AgncyCountry"));
	            	agency.setAgncyPhone(resultSet.getString("AgncyPhone"));
	            	agency.setAgncyFax(resultSet.getString("AgncyFax"));          	    
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
	        return agency;
	    }
	    
	    
	    public static List<Agency> getAgencies(String filter)  
	    {
	        // Local variables
	        Connection connection = null;
	        ResultSet resultSet = null;
	        PreparedStatement statement = null;     
	        
	        List<Agency> agencies = new ArrayList<Agency>();

	        try 
	        {
	            // Open db connection
	            connection = connectDB();
	            
	            String query = " SELECT * FROM Agencies " +
	            		" WHERE AgencyId > 0";
		                //" WHERE AgentId=?";
	            	            
	            statement = connection.prepareStatement(query);
	            resultSet = statement.executeQuery();
	            
	            // Add Agent objects to agents list
	            while (resultSet.next()) 
	            {
	            	Agency agency = new Agency();
	            	agency.setAgencyId(resultSet.getInt("AgencyId"));
	            	agency.setAgncyAddress(resultSet.getString("AgncyAddress"));
	            	agency.setAgncyCity(resultSet.getString("AgncyCity"));
	            	agency.setAgncyProv(resultSet.getString("AgncyProv"));
	            	agency.setAgncyPostal(resultSet.getString("AgncyPostal"));
	            	agency.setAgncyCountry(resultSet.getString("AgncyCountry"));
	            	agency.setAgncyPhone(resultSet.getString("AgncyPhone"));
	            	agency.setAgncyFax(resultSet.getString("AgncyFax"));     
	            	agencies.add(agency);  
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
	        return agencies;
	    }
	    

}