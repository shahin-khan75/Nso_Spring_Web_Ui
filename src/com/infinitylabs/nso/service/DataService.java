package com.infinitylabs.nso.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

public interface DataService {

	public JSONObject getVPNPath(HttpSession session,String url) throws JSONException ;
	public void getQueryHeaderId(String path,HttpSession session,String url,String vpnType) throws JSONException ;
	public JSONObject getExistVpnName(HttpServletRequest request,HttpSession session,String url) throws JSONException ;
	public JSONObject createService(HttpServletRequest request,HttpSession session,String url) throws JSONException ;
	public JSONObject getSavedDeviceList(HttpServletRequest request,HttpSession session,String url) throws JSONException;
	public JSONObject set_value(HttpSession session, String url,String value,String deviceValue) throws JSONException;
	public JSONObject dryRunCommit(HttpServletRequest request,HttpSession session,String url)throws JSONException;
	public JSONObject validateCommit(HttpServletRequest request,HttpSession session,String url)throws JSONException;
	public JSONObject Commit(HttpServletRequest request,HttpSession session,String url)throws JSONException;
}
