package dbase;

import static dbase.MySQLData.connectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class AgentDB {

	 public static Agent getAgent(String agentId)  
	    {
	        // Local variables
	        Connection connection = null;
	        ResultSet resultSet = null;
	        PreparedStatement statement = null;   
	        
	        Agent agent = new Agent();

	        try 
	        {
	            // Open db connection
	            connection = connectDB();
	            
	            // Define query string 
	            String query = " SELECT * FROM Agents " +
	                " WHERE AgentId=?";
	            
	            // Statements allow us to issue SQL queries to dbase
	            statement = connection.prepareStatement(query);
	            statement.setString(1, agentId);
	            
	            // Execute SQL statement and get back a result set (or an exception)
	            resultSet = statement.executeQuery();
	            
	            // Add data to customer 
	            while (resultSet.next()) 
	            {   
            	    agent.setAgentId(resultSet.getInt("AgentId"));
            	    agent.setAgtFirstName(resultSet.getString("AgtFirstName"));
            	    agent.setAgtMiddleInitial(resultSet.getString("AgtMiddleInitial"));
            	    agent.setAgtLastName(resultSet.getString("AgtLastName"));
            	    agent.setAgtBusPhone(resultSet.getString("AgtBusPhone"));
            	    agent.setAgtEmail(resultSet.getString("AgtEmail"));
            	    agent.setAgtPosition(resultSet.getString("AgtPosition"));
            	    agent.setAgencyId(resultSet.getInt("AgencyId"));
            	    agent.setAgentStatus(resultSet.getString("AgentStatus"));                
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
	        return agent;
	    }
	    
	    
	    public static List<Agent> getAgents(String filter)  
	    {
	        // Local variables
	        Connection connection = null;
	        ResultSet resultSet = null;
	        PreparedStatement statement = null;     
	        
	        List<Agent> agents = new ArrayList<Agent>();

	        try 
	        {
	            // Open db connection
	            connection = connectDB();
	            
	            String query = " SELECT * FROM Agents " +
	            		" WHERE Agentid > 0";
		                //" WHERE AgentId=?";
	            
	            statement = connection.prepareStatement(query);
	            resultSet = statement.executeQuery();
	      
	            // Add Agent objects to agents list
	            while (resultSet.next()) 
	            {
	            	Agent agent = new Agent();
	            	agent.setAgentId(resultSet.getInt("AgentId"));
            	    agent.setAgtFirstName(resultSet.getString("AgtFirstName"));
            	    agent.setAgtMiddleInitial(resultSet.getString("AgtMiddleInitial"));
            	    agent.setAgtLastName(resultSet.getString("AgtLastName"));
            	    agent.setAgtBusPhone(resultSet.getString("AgtBusPhone"));
            	    agent.setAgtEmail(resultSet.getString("AgtEmail"));
            	    agent.setAgtPosition(resultSet.getString("AgtPosition"));
            	    agent.setAgencyId(resultSet.getInt("AgencyId"));
            	    agent.setAgentStatus(resultSet.getString("AgentStatus")); 
	            	agents.add(agent);  
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
	        return agents;
	    }
	    

}
