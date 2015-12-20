/*
 * Purpose: MySQL database functions class for TravelExperts Database 
 * Author: Mark Poffenroth
 * Date: August 2015
 */

package dbase;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLData 
{
    
    // Fields and Properties
    private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
    private static final String DB_URL = "jdbc:mysql://localhost:3306/travelexperts";
    //private static final String DB_URL = "jdbc:mysql://192.168.25.137:3306/travelexperts";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "P@ssw0rd";

    
    /// <summary>
    /// Open connection to database
    /// </summary>
    public static Connection connectDB() 
    {
        // Local variables
        Connection connection = null;
        
        try 
        {
            // Load MySQL driver. 
            // Implementation of driver class causes an instance (driver object) to be created.
            Class.forName(DB_DRIVER);

            // Request DriverManager to attempt connection to database.
            connection = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
        } 
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
    
    
    /// <summary>
    /// Get MetaData column names for a SQL query
    /// </summary>
    /// <param name="query">SQL command to run.</param>
    /// <returns>List of meta data column name Strings.</returns>
    public static List<String> getMetaData(String query) 
    {
        // Local variables
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        
        List<String> metaData = new ArrayList<String>();

        try 
        {
            // Open db connection
            connection = connectDB();
            
            // Statements allow us to issue SQL queries to dbase.
            // Note: One statement object supports exactly one result set at a time. 
            // If you want several result sets at same time, create several Statement objects.
            statement = connection.createStatement();

            // Execute SQL statement and get back a result set (or an exception)
            resultSet = statement.executeQuery(query);
            
            // Get metadata from database for input ResultSet
            ResultSetMetaData rsmd = resultSet.getMetaData(); 

            // Loop through columns 
            for(int col=1; col<=rsmd.getColumnCount(); col++)  
            {
                // Add column names to String list
                metaData.add(rsmd.getColumnLabel(col));
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
        // String list
        return metaData;
    }
    
}
