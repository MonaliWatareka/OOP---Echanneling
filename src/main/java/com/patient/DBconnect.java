package com.patient;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
	private static String jdbcURL= "jdbc:mysql://localhost:3306/echannelingg";
	private static String jdbcUsername= "root";
	private static String jdbcPassword="Kulugammana081";
	private static Connection con;
	
	public static Connection getDBConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			
			
		}catch(Exception e) {
			System.out.println("Database connection is not success!!!!!!");
		}
		return con;
		
	}
	

}
