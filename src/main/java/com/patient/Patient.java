package com.patient;

public class Patient {
	private int patientID;
	private String patientFName;
	private String patientLName;
	private String patientPhone;
	private String patientDOB;
	private String patientEmail;
	private String patientPassword;
	public Patient(int patientID, String patientFName, String patientLName, String patientPhone, String patientDOB,
			String patientEmail, String patientPassword) {
		
		this.patientID = patientID;
		this.patientFName = patientFName;
		this.patientLName = patientLName;
		this.patientPhone = patientPhone;
		this.patientDOB = patientDOB;
		this.patientEmail = patientEmail;
		this.patientPassword = patientPassword;
		
		
	}
	public int getPatientID() {
		return patientID;
	}
	public String getPatientFName() {
		return patientFName;
	}
	public String getPatientLName() {
		return patientLName;
	}
	public String getPatientPhone() {
		return patientPhone;
	}
	public String getPatientDOB() {
		return patientDOB;
	}
	public String getPatientEmail() {
		return patientEmail;
	}
	public String getPatientPassword() {
		return patientPassword;
	}
	


	

}
