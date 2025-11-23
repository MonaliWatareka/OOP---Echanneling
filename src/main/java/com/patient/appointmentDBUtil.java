package com.patient;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class appointmentDBUtil {
	
	private static boolean isSuccess;
	private static Connection con= null;
	private static Statement stat = null;
	private static ResultSet rs=null;

	 //insert appointment 
	 public static boolean insertAppointment(String name, String phone, String r_num, String date, String time, String reason,String Email) {
			
			isSuccess = false;
					
			try {
				//Database Connection
				con = DBconnect.getDBConnection();
				stat = con.createStatement();
				
				//SQL query
				String sql = "insert into appointment values (0, '"+name+"','"+phone+"','"+r_num+"','"+date+"','"+time+"','"+reason+"','"+Email+"')";
				int rs = stat.executeUpdate(sql);
				
				if(rs > 0) {
					isSuccess = true;
				}
				else {
					isSuccess = false;
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return isSuccess;
		}
		//display appointment form
	 public static List<Appointment> getAppointmentDetails(String username){
			
			//int convertedID = Integer.parseInt(Id);
			ArrayList<Appointment> app = new ArrayList<>();
			
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
					app.add(c);
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return app;
		}
		
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

		//Update appointmnet  data
		public static boolean updateAppointment(String id, String name, String phone, String record, String date, String time, String reason,String username) {
			
			try {
				//Database Connection
				con = DBconnect.getDBConnection();
				stat = con.createStatement();
				
				//SQL query
				String sql = "update appointment set name='"+name+"',phone='"+phone+"',r_num='"+record+"',date='"+date+"',time='"+time+"',reason='"+reason+"',Email='"+username+"'" + "where id='"+id+"'";
				int rs = stat.executeUpdate(sql);
				
				if(rs > 0) {
					isSuccess = true;
				}
				else {
					isSuccess = false;
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return isSuccess;
		}
		//Delete appointment data
			public static boolean deleteAppointment(String id) {
				
				int convId = Integer.parseInt(id);
				
				try {
					//Database Connection
					con = DBconnect.getDBConnection();
					stat = con.createStatement();
					
					//SQL query
					String sql = "delete from appointment where id='"+convId+"'";
					int r = stat.executeUpdate(sql);
					
					if(r > 0) {
						isSuccess = true;
					}
					else {
						isSuccess = false;
					}
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				
				return isSuccess;
			}
			
			

		

}
