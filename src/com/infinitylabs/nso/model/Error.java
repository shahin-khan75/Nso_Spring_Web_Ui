package com.infinitylabs.nso.model;

import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

public class Error {
	@JsonProperty("message")
	private String message;
	@JsonProperty("data")
	private Data data;
	@JsonProperty("code")
	private Integer code;
	@JsonProperty("type")
	private String type;
	@JsonProperty("internal")
	private String internal;
	@JsonIgnore
	private Map<String, Object> additionalProperties = new HashMap<String, Object>();
	
	
	public Error(){}
	
	public Error(String message, Data data, Integer code, String type, String internal,
			Map<String, Object> additionalProperties) {
		this.message = message;
		this.data = data;
		this.code = code;
		this.type = type;
		this.internal = internal;
		this.additionalProperties = additionalProperties;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Data getData() {
		return data;
	}

	public void setData(Data data) {
		this.data = data;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getInternal() {
		return internal;
	}

	public void setInternal(String internal) {
		this.internal = internal;
	}

	public Map<String, Object> getAdditionalProperties() {
		return additionalProperties;
	}

	public void setAdditionalProperties(Map<String, Object> additionalProperties) {
		this.additionalProperties = additionalProperties;
	}
	
	
		

		
	
	
}
