package com.patient;

public class Appointment {
	private int id;
	private String name;
	private String phone;
	private String r_num;
	private String date;
	private String time;
	private String reason;
	private String email;
	
	public Appointment() {}

	public Appointment(int id, String name, String phone, String r_num, String date, String time, String reason,
			String email) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.r_num = r_num;
		this.date = date;
		this.time = time;
		this.reason = reason;
		this.email = email;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPhone() {
		return phone;
	}

	public String getR_num() {
		return r_num;
	}

	public String getDate() {
		return date;
	}

	public String getTime() {
		return time;
	}

	public String getReason() {
		return reason;
	}

	public String getEmail() {
		return email;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setR_num(String r_num) {
		this.r_num = r_num;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	

	
	
	
}
