package com.infinitylabs.nso.service;

import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import com.infinitylabs.nso.model.LoginBean;

public interface LoginService {
	
	public JSONObject getLogin(LoginBean loginBean, String url, HttpSession session) throws JSONException;
	
	public JSONObject getTransactionId(String url, HttpSession session)throws JSONException;
	
	public JSONObject getNewTransactionId(String url, HttpSession session)throws JSONException ;
	
	public JSONObject getLogout(String url, HttpSession session)throws JSONException;
	

}
