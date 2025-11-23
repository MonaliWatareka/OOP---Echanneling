package com.patient;

public class LabReport {
	

	int lid;
	String hName;
	String patientName;
	String testType;
	String testResult;
	String date;
	public LabReport() {
		
	}
	public LabReport(int lid, String hName, String patientName, String testType, String testResult, String date) {
		super();
		this.lid = lid;
		this.hName = hName;
		this.patientName = patientName;
		this.testType = testType;
		this.testResult = testResult;
		this.date = date;
	}
	public int getLid() {
		return lid;
	}
	public String gethName() {
		return hName;
	}
	public String getPatientName() {
		return patientName;
	}
	public String getTestType() {
		return testType;
	}
	public String getTestResult() {
		return testResult;
	}
	public String getDate() {
		return date;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}
	public void sethName(String hName) {
		this.hName = hName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	public void setTestType(String testType) {
		this.testType = testType;
	}
	public void setTestResult(String testResult) {
		this.testResult = testResult;
	}
	public void setDate(String date) {
		this.date = date;
	}

	
	
	

}
