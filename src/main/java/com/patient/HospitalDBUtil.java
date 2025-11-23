package com.patient;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
public class HospitalDBUtil {

	  private static boolean isSuccess;
	  private static Connection con= null;
	  private static Statement stat = null;
	  private static ResultSet rs=null;
	  
	  
	  public static boolean createLabReport(String hname,String pname,String test, String details,String date) {
		   boolean isSuccess=false;
		   try {
			   con= DBconnect.getDBConnection();
			     stat=con.createStatement();
			     
			     String sql= "insert into labreport values(0,'"+hname+"','"+pname+"','"+test+"','"+details+"','"+date+"')";
			     int rs = stat.executeUpdate(sql);
			     if(rs>0) {
			    	 isSuccess=true;
			    	 
			     }else {
			    	 isSuccess=false;
			     }
			     
		   }catch(Exception e) {
			   e.printStackTrace();
		   }
		  
		  
		return isSuccess;
		  
	  }
	  
	  //read
	  public static List<LabReport> getById(String Id){
			
			int convertedID = Integer.parseInt(Id);
			
			ArrayList<LabReport> lab = new ArrayList<>();
			
			try {
				//Database Connection
				con= DBconnect.getDBConnection();
			    stat=con.createStatement();
				//SQL query
				String sql = "select * from labreport where id='"+convertedID+"'";
				rs=stat.executeQuery(sql);
				
				while(rs.next()) {
					int id = rs.getInt(1);
					String name = rs.getString(2);
					String Pname = rs.getString(3);
					String Test= rs.getString(4);
					String Details = rs.getString(5);
					String Date = rs.getString(6);
					
				LabReport c = new LabReport(id,name,Pname,Test,Details,Date);
					lab.add(c);
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return lab;
		}
	  
	  public static List<LabReport> getAllHospital() {
		    
		    List<LabReport> reports = new ArrayList<>();
		    
		    try {
		    	con= DBconnect.getDBConnection();
			    stat=con.createStatement();
			    String sql = "SELECT * FROM labreport";
		        rs=stat.executeQuery(sql);
		       while (rs.next()) {
		    	   LabReport labReport =new LabReport();
		    	   
		    	   labReport.setLid(rs.getInt("lid"));
		    	   labReport.sethName(rs.getString("hName"));
		    	   labReport.setPatientName(rs.getString("patientName"));
		    	   labReport.setTestType(rs.getString("testType"));
		    	   labReport.setTestResult(rs.getString("testResult"));
		    	   labReport.setDate(rs.getString("date"));
		    	   reports.add(labReport);
		    	   
		    	  
		    	 
		            }
		      
		      
		    }catch(Exception e) {
		      e.printStackTrace();
		    }
		    return reports;
		}
	  
	  //update 
	  public static boolean updatelab(String id,String name,String Pname,String Test,String Details,String Date) {
		  
		  
			try {
				con= DBconnect.getDBConnection();
				stat=con.createStatement();
				String sql= "update labreport set hName='"+name+"',patientName='"+Pname+"',testType='"+Test+"',testResult='"+Details+"',date='"+Date+"'"+"where lid='"+id+"'" ;
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
	  
	  
	  //delete
	  public static boolean deletelab(String id) {
			int convertedID=Integer.parseInt(id);
			try {
				con= DBconnect.getDBConnection();
				stat=con.createStatement();
				String sql=" delete from labreport where lid='"+convertedID+"'";
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
	

}
