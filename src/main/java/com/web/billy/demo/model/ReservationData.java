package com.web.billy.demo.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ReservationData {
	
	@JsonProperty("ReservationData")
	
	private String account;
	private String username;
	private String customer;
	private String date;
	private String eatingTime;
	
	public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getEatingTime() {
		return eatingTime;
	}

	public void setEatingTime(String eatingTime) {
		this.eatingTime = eatingTime;
	}

}
