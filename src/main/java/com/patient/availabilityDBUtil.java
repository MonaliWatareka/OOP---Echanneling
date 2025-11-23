package com.patient;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class availabilityDBUtil {
	
	private static boolean isSuccess;
	private static Connection con= null;
	private static Statement stat = null;
	private static ResultSet rs=null;

    // set availability/insert
    public static boolean setAvailability(String name, String special, String date, String starttime, String endtime, String hospital) {
    	
        isSuccess = false;

        try {
            // Get database connection
            Connection con = DBconnect.getDBConnection();
            
            String sql = "INSERT INTO availability (dName, specialization, date, startTime, endTime, hospital) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(sql);

            // Set parameters
            pstmt.setString(1, name);
            pstmt.setString(2, special);
            pstmt.setString(3, date);
            pstmt.setString(4, starttime);
            pstmt.setString(5, endtime);
            pstmt.setString(6, hospital);
           

            int rs = pstmt.executeUpdate();

            if (rs > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
    
    
    //retrieve data to availability list
    public static List<availability> getAvailabilityDetails(String id){
    	
    	int convertedId = Integer.parseInt(id);
    	
    	ArrayList<availability> avail = new ArrayList<>();
    	
    	try {
    		
    		// Get database connection
            Connection con = DBconnect.getDBConnection();
            Statement stmt = con.createStatement();
            
            String sql = "SELECT * FROM availability WHERE availabilityId = '" + convertedId + "'";
            ResultSet rs = stmt.executeQuery(sql);
    		
            while (rs.next()) {
            	int availabilityId = rs.getInt(1);
                String dName = rs.getString(2);
                String specialization = rs.getString(3);
                String date = rs.getString(4);
                String starttime = rs.getString(5);
                String endtime = rs.getString(6);
                String hospital = rs.getString(7);

                availability a = new availability(availabilityId, dName, specialization, date, starttime, endtime, hospital);
                avail.add(a);
            }
            
            
    		
    	}catch(Exception e) {
    		
    		e.printStackTrace();
    		
    	}
    	
    	
		return avail;
    	
    }
    
    
    //display avaialabilities
	 public static List<availability> getAllAvailabilities(){
	    	
	    	ArrayList<availability> avail = new ArrayList<>();
	    	
	    	try {
	    		
	    		// Get database connection
	            Connection con = DBconnect.getDBConnection();
	            Statement stmt = con.createStatement();
	            
	            String sql = "SELECT * FROM availability  ";
	            
	            ResultSet rs = stmt.executeQuery(sql);
	    		
	            while (rs.next()) {
	            	int availabilityId = rs.getInt(1);
	            	String dName = rs.getString(2);
	            	String specialization = rs.getString(3);
	                String date = rs.getString(4);
	                String starttime = rs.getString(5);
	                String endtime = rs.getString(6);
	                String hospital = rs.getString(7);
	
	                availability a = new availability(availabilityId, dName, specialization, date, starttime, endtime, hospital);
	                avail.add(a);
	            }
	                        	
	    	}catch(Exception e) {
	    		
	    		e.printStackTrace();
	    		
	    	}
	    	
	    	
			return avail;
	
	 }
			
	//Update availabilities
	 public static boolean updataAvailability(String Aid, String dname, String specialization, String date, String start, String end, String hos) {
	 
	 	 isSuccess =false;
	
	      try {
	         
	     	// Get database connection
	          Connection con = DBconnect.getDBConnection();
	          Statement stmt = con.createStatement();
	     	 
	          String sql = "UPDATE availability SET specialization='"+specialization+"', date='"+date+"',startTime='"+start+"',endTime='"+end+"',hospital='"+hos+"'"
	          				+" WHERE  availabilityId = '"+Aid+"'" ;
	          
	          int rs = stmt.executeUpdate(sql);
	
	          if (rs > 0) {
	         	 
	              isSuccess = true;
	              
	          }else {
	         	 
	         	 isSuccess =false; 
	         	 
	          }
	
	          
	          
	      } catch (Exception e) {
	     	 
	     	 e.printStackTrace();
	      }
	      
	      return isSuccess;
	      
	  }
	 
	 //delete availability
	 
	 public static boolean deleteAvailability(String id) {
	     
	 	 isSuccess = false;
	
	     try {
	         // Get database connection
	         Connection con = DBconnect.getDBConnection();
	         Statement stmt = con.createStatement();
	         
	         int convertId = Integer.parseInt(id);
	        
	         String sql = "DELETE FROM availability WHERE availabilityId = '" + convertId + "'";
	         int rs = stmt.executeUpdate(sql);
	
	         if (rs > 0) {
	             isSuccess = true;
	         }
	     } catch (Exception e) {
	         e.printStackTrace();
	     }
	
	     return isSuccess;
	 }
	 
	//appointment list display at doc
		
			public static List<Appointment> getAllAppointments() {
				
				List<Appointment> appointments = new ArrayList<>();
				
				try {
					con= DBconnect.getDBConnection();
					stat=con.createStatement();
					String sql = "SELECT * FROM appointment";
					rs=stat.executeQuery(sql);
					 while (rs.next()) {
						 	Appointment appointment = new Appointment();
						 	appointment.setId(rs.getInt("id"));
						 	appointment.setName(rs.getString("name"));
						 	appointment.setPhone(rs.getString("phone"));
						 	appointment.setR_num(rs.getString("r_num"));
						 	appointment.setDate(rs.getString("date"));
						 	appointment.setTime(rs.getString("time"));
						 	appointment.setReason(rs.getString("reason"));
						 	appointment.setEmail(rs.getString("Email"));
				            appointments.add(appointment);
				        }
					
					
				}catch(Exception e) {
					e.printStackTrace();
		    }
				return appointments;
		}

}
