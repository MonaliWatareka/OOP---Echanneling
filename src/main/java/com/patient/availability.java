package com.patient;

public class availability {
	private int availabilityId;
	private String dName;
	private String specialization;
	private String date;
	private String startTime;
	private String endTime;
	private String hospital;
	
	public availability() {
		
	}

	public availability(int availabilityId, String dName, String specialization, String date, String startTime, String endTime, String hospital) {
		
		this.availabilityId = availabilityId;
		this.dName = dName;
		this.specialization = specialization;
		this.date = date;
		this.startTime = startTime;
		this.endTime = endTime;
		this.hospital = hospital;
	}

	public int getAvailabilityId() {
		return availabilityId;
	}

	public String getdName() {
		return dName;
	}

	public String getSpecialization() {
		return specialization;
	}

	public String getDate() {
		return date;
	}

	public String getStartTime() {
		return startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public String getHospital() {
		return hospital;
	}

	public void setAvailabilityId(int availabilityId) {
		this.availabilityId = availabilityId;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

    public void setSpecialization(String specialization) {
        this.specialization = specialization; 
    }
	public void setDate(String date) {
		this.date = date;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public void setHospital(String hospital) {
		this.hospital = hospital;
	}
	
	
	
	
	

}
