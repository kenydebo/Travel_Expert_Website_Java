package dbase;

import static dbase.MySQLData.connectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TravelPackageDB {

	 public static TravelPackage getTravelPackage(String packageId)  
	    {
	        // Local variables
	        Connection connection = null;
	        ResultSet resultSet = null;
	        PreparedStatement statement = null;   
	        
	        TravelPackage travelpackage = new TravelPackage();

	        try 
	        {
	            // Open db connection
	            connection = connectDB();
	            
	            // Define query string 
	            String query = " SELECT * FROM Packages " +
	                " WHERE PackageId=?";
	            
	            // Statements allow us to issue SQL queries to dbase
	            statement = connection.prepareStatement(query);
	            statement.setString(1, packageId);
	            
	            // Execute SQL statement and get back a result set (or an exception)
	            resultSet = statement.executeQuery();
	            
	            // Add data to customer 
	            while (resultSet.next()) 
	            {   
	            	travelpackage.setPackageId(resultSet.getInt("PackageId"));
	            	travelpackage.setPkgName(resultSet.getString("PkgName"));
	            	travelpackage.setPkgStartDate(resultSet.getDate("PkgStartDate"));
	            	travelpackage.setPkgEndDate(resultSet.getDate("PkgEndDate"));
	            	travelpackage.setPkgDesc(resultSet.getString("PkgDesc"));
	            	travelpackage.setPkgBasePrice(resultSet.getDouble("PkgBasePrice"));
	            	travelpackage.setPkgAgencyCommission(resultSet.getDouble("PkgAgencyCommission"));	
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
	        return travelpackage;
	    }
	    
	    
	    public static List<TravelPackage> getTravelPackages(String filter)  
	    {
	        // Local variables
	        Connection connection = null;
	        ResultSet resultSet = null;
	        PreparedStatement statement = null;     
	        
	        List<TravelPackage> travelpackages = new ArrayList<TravelPackage>();

	        try 
	        {
	            // Open db connection
	            connection = connectDB();
	            
	            String query = " SELECT * FROM Packages " +
	            		" WHERE PackageId > 0";
		                //" WHERE AgentId=?";
	            	            
	            statement = connection.prepareStatement(query);
	            resultSet = statement.executeQuery();
	            
	            // Add Agent objects to agents list
	            while (resultSet.next()) 
	            {
	            	TravelPackage travelpackage = new TravelPackage();
	            	travelpackage.setPackageId(resultSet.getInt("PackageId"));
	            	travelpackage.setPkgName(resultSet.getString("PkgName"));
	            	travelpackage.setPkgStartDate(resultSet.getDate("PkgStartDate"));
	            	travelpackage.setPkgEndDate(resultSet.getDate("PkgEndDate"));
	            	travelpackage.setPkgDesc(resultSet.getString("PkgDesc"));
	            	travelpackage.setPkgBasePrice(resultSet.getDouble("PkgBasePrice"));
	            	travelpackage.setPkgAgencyCommission(resultSet.getDouble("PkgAgencyCommission"));	
	            	travelpackages.add(travelpackage);  
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
	        return travelpackages;
	    }

}
