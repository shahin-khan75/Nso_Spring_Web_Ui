package com.infinitylabs.nso.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonRootName;

@JsonRootName("rpcBean")
public class RpcBean {
	
	@JsonProperty("id")
	private int id;
	
	@JsonProperty("jsonrpc")
	private String jsonRpc;
	
	@JsonProperty("params")
	private String params;
	
	@JsonProperty("method")
	private String method;
	
	@JsonProperty("loginBean")
	private LoginBean loginBean;
	
	@JsonProperty("result")
private Result result;
	
	@JsonProperty("error")
	private Error error;
	
	public RpcBean(){
		
	}
	/*public RpcBean(int id, String jsonRpc, String params, String method, LoginBean loginBean) {
		this.id = id;
		this.jsonRpc = jsonRpc;
		this.params = params;
		this.method = method;
		this.loginBean = loginBean;
	}*/
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getJsonRpc() {
		return jsonRpc;
	}
	public void setJsonRpc(String jsonRpc) {
		this.jsonRpc = jsonRpc;
	}
	public String getParams() {
		return params;
	}
	public void setParams(String params) {
		this.params = params;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public LoginBean getLoginBean() {
		return loginBean;
	}
	public void setLoginBean(LoginBean loginBean) {
		this.loginBean = loginBean;
	}
	public Result getResult() {
		return result;
	}
	public void setResult(Result result) {
		this.result = result;
	}
	public Error getError() {
		return error;
	}
	public void setError(Error error) {
		this.error = error;
	}
	
	

}
