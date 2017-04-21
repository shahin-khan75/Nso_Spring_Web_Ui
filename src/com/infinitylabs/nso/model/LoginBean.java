package com.infinitylabs.nso.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonRootName;

@JsonRootName("loginBean")
public class LoginBean {

	@JsonProperty("username")
	private String username;


	@JsonProperty("password")
	private String password;
	
	

	public LoginBean(){

	}

	public LoginBean(String username, String password) {
		this.username = username;
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}



}
