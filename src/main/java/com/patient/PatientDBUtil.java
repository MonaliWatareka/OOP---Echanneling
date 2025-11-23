package com.patient;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PatientDBUtil {
	
	private static boolean isSuccess;
	private static Connection con= null;
	private static Statement stat = null;
	private static ResultSet rs=null;
	
	//login
	
	public static boolean validateLogin(String username,String password, String usertype) {
		try {
			con= DBconnect.getDBConnection();
			stat=con.createStatement();
			
			// SQL query for patient or doctor admin
            String sql;
            if ("patient".equals(usertype)) {
                sql = "SELECT * FROM patient WHERE Email='" + username + "' AND Password='" + password + "'";
            } else {
                sql = "SELECT * FROM docadmin WHERE email='" + username + "' AND password='" + password + "'";
            }
			
			
			
			rs=stat.executeQuery(sql);
			if(rs.next()) {
				isSuccess=true;
			}
			else {
				isSuccess=false;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return isSuccess;
		
	}
	//login get patient detail
	public static List<Patient> getPatient(String username){
		ArrayList<Patient> patient = new ArrayList<>();
		try {
			con= DBconnect.getDBConnection();
			stat=con.createStatement();
			String sql="select * from patient where Email='"+username+"'";
			rs=stat.executeQuery(sql);
			
			while(rs.next()) {
				int pid = rs.getInt(1);
				String fname=rs.getString(2);
				String lname=rs.getString(3);
				String phone=rs.getString(4);
				String dob=rs.getString(5);
				String email=rs.getString(6);
				String password=rs.getString(7);
				
				Patient newPatient = new Patient(pid, fname, lname, phone,dob ,email, password);
				patient.add(newPatient);
				
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return patient;
		
	}
	
	//get docadmin details
	
	public static List<docAdmin> getDocadmin(String username) {
		  
		ArrayList<docAdmin> docadmin = new ArrayList<>();
	        try {
	            con = DBconnect.getDBConnection();
	            stat = con.createStatement();
	            String sql = "SELECT * FROM docadmin WHERE email='" + username + "'";
	            rs = stat.executeQuery(sql);

	            while (rs.next()) {
	                int id = rs.getInt(1);
	                String name = rs.getString(2);
	                String email = rs.getString(3);
	                String password = rs.getString(4);
	                
	                docAdmin admin = new docAdmin(id, name, email, password );
	                docadmin.add(admin);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return docadmin;

	}
	


	//create account
	public static boolean createPatient(String fname,String lname,String phone,String dob,String email,String password) {
		boolean isSuccess=false;
		
		try {
			con= DBconnect.getDBConnection();
			stat=con.createStatement();
			String sql="insert into patient values(0,'"+fname +"','"+lname+"','"+phone+"','"+dob+"','"+email+"','"+password+"' )";
			int rs=stat.executeUpdate(sql);
			if(rs>0) {
				isSuccess=true;
			}
			else {
				isSuccess=false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
		
	}
	
	//update account
	public static boolean updatePatient(String id,String fname,String lname,String phone,String dob,String email,String password) {
		try {
			con= DBconnect.getDBConnection();
			stat=con.createStatement();
			String sql= "update patient set First_name='"+fname+"',Last_name='"+lname+"',Phone='"+phone+"',DOB='"+dob+"',Email='"+email+"',Password='"+password+"' where pid='"+id+"'" ;
			int rs=stat.executeUpdate(sql);
			if(rs>0) {
				isSuccess=true;
			}
			else {
				isSuccess=false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return isSuccess;
		
	}
	
	//retrieve patient data
	public static List<Patient> getPatientDetails(String id){
		ArrayList<Patient> patient = new ArrayList<>();
		try {
			con= DBconnect.getDBConnection();
			stat=con.createStatement();
			String sql="select * from patient where pid='"+id+"'";
			rs=stat.executeQuery(sql);
			
			while(rs.next()) {
				int pid = rs.getInt(1);
				String fname=rs.getString(2);
				String lname=rs.getString(3);
				String phone=rs.getString(4);
				String dob=rs.getString(5);
				String email=rs.getString(6);
				String password=rs.getString(7);
				
				Patient newPatient = new Patient(pid, fname, lname, phone,dob ,email, password);
				patient.add(newPatient);
				
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return patient;
		
	}
	
	//delete account
	public static boolean deletePatient(String id) {
		int convertedID=Integer.parseInt(id);
		try {
			con= DBconnect.getDBConnection();
			stat=con.createStatement();
			String sql=" delete from patient where pid='"+convertedID+"'   ";
			int rs=stat.executeUpdate(sql);
			if(rs>0) {
				isSuccess=true;
			}
			else {
				isSuccess=false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return isSuccess;
		
	}
	
	//availability list display at patient
	
	public static List<availability> getAllAvailability() {
		
		List<availability> availabilities = new ArrayList<>();
		
		try {
			con= DBconnect.getDBConnection();
			stat=con.createStatement();
			String sql = "SELECT * FROM availability ";
			rs=stat.executeQuery(sql);
			 while (rs.next()) {
		            availability availability = new availability();
		            availability.setAvailabilityId(rs.getInt("availabilityId"));
		            availability.setdName(rs.getString("dName"));
		            availability.setSpecialization(rs.getString("specialization"));
		            availability.setDate(rs.getString("date"));
		            availability.setStartTime(rs.getString("startTime"));
		            availability.setEndTime(rs.getString("endTime"));
		            availability.setHospital(rs.getString("hospital"));
		            availabilities.add(availability);
		        }
			
			
		}catch(Exception e) {
			e.printStackTrace();
    }
		return availabilities;
  }
	//my appointment list display at patient
	public static List<Appointment> getAllAppointmentDetails(String username ){
		
		ArrayList<Appointment> apps = new ArrayList<>();
		
		try {
			//Database Connection
			con = DBconnect.getDBConnection();
			stat = con.createStatement();
			
			//SQL query
			String sql = "select * from appointment where Email='"+username+"'";
			rs = stat.executeQuery(sql);
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String phone = rs.getString(3);
				String record = rs.getString(4);
				String date = rs.getString(5);
				String time = rs.getString(6);
				String reason = rs.getString(7);
				String Email=rs.getString(8);
				
				Appointment c = new Appointment(id, name, phone, record, date, time, reason,Email);
				apps.add(c);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return apps;
	}
	 
		

}
