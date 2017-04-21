package com.infinitylabs.nso.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.infinitylabs.nso.service.DataService;



@Component
public class DataServiceImpl implements DataService {

	@Override
	public JSONObject getVPNPath(HttpSession session, String url) throws JSONException {
		JSONObject pathJson = new JSONObject();
		pathJson.put("id", "2");
		pathJson.put("jsonrpc", "2.0");
		pathJson.put("method", "get_service_points");

		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Cookie", (String) session.getAttribute("sessionid"));
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<String> entity = new HttpEntity<String>(pathJson.toString(), headers);
		ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
		JSONObject jsonBody = null;
		if (responseEntity.getStatusCode() == HttpStatus.OK) {
			jsonBody = new JSONObject(responseEntity.getBody());
		}

		System.out.println("Service path :" + jsonBody.toString());
		return jsonBody;
	}

	@Override
	public void getQueryHeaderId(String path, HttpSession session, String url, String vpnType) throws JSONException {
		List<String> list = new ArrayList<String>();

		if (vpnType.contains("l3")) {
			System.out.println("for l3");
			list.add("vpn-name");// for L3 VPN
		} else if (vpnType.contains("l2")) {
			System.out.println("for l2");
			list.add("name");// for L2 VPN name should b change
		}
		// list.add("name");// for L2 VPN name should b change

		JSONObject param = new JSONObject();
		param.put("th", Integer.parseInt((String) session.getAttribute("th")));
		param.put("chunk_size", 25);
		param.put("initial_offset", 1);
		param.put("result_as", "string");
		param.put("selection", list);
		param.put("path", path);

		JSONObject queryHeaderJson = new JSONObject();
		queryHeaderJson.put("id", "2");
		queryHeaderJson.put("jsonrpc", "2.0");
		queryHeaderJson.put("method", "start_query");
		queryHeaderJson.put("params", param);

		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Cookie", (String) session.getAttribute("sessionid"));
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<String> entity = new HttpEntity<String>(queryHeaderJson.toString(), headers);
		ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
		JSONObject jsonBody = null;
		if (responseEntity.getStatusCode() == HttpStatus.OK) {
			jsonBody = new JSONObject(responseEntity.getBody());
		}
		System.out.println("Get QueryHeader :" + jsonBody.toString());
		String qh = jsonBody.getJSONObject("result").getString("qh");
		session.setAttribute("qh", qh);
	}

	@Override
	public JSONObject getExistVpnName(HttpServletRequest request, HttpSession session, String url)
			throws JSONException {

		JSONObject param = new JSONObject();
		param.put("qh", Integer.parseInt((String) session.getAttribute("qh")));

		JSONObject exixtjson = new JSONObject();
		exixtjson.put("id", "2");
		exixtjson.put("jsonrpc", "2.0");// run_query
		exixtjson.put("method", "run_query");
		exixtjson.put("params", param);

		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Cookie", (String) session.getAttribute("sessionid"));
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<String> entity = new HttpEntity<String>(exixtjson.toString(), headers);
		ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
		JSONObject jsonBody = null;
		if (responseEntity.getStatusCode() == HttpStatus.OK) {
			jsonBody = new JSONObject(responseEntity.getBody());
		}
		return jsonBody;
	}

	public boolean isExists(HttpServletRequest request, HttpSession session, String url) throws JSONException {
		JSONObject param = new JSONObject();
		param.put("th", Integer.parseInt((String) session.getAttribute("th")));
		param.put("path", (String) session.getAttribute("path") + "{\"" + request.getParameter("name") + "\"}");
		System.out.println("param Val:----" + param.toString());
		JSONObject json = new JSONObject();
		json.put("id", "2");
		json.put("jsonrpc", "2.0");
		json.put("method", "exists");
		json.put("params", param);

		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Cookie", (String) session.getAttribute("sessionid"));
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<String> entity = new HttpEntity<String>(json.toString(), headers);
		ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);

		JSONObject outputjson = new JSONObject(responseEntity.getBody());
		boolean exist = outputjson.getJSONObject("result").getBoolean("exists");
		return exist;
	}

	public JSONObject createService(HttpServletRequest request, HttpSession session, String url) throws JSONException {
		boolean exist = isExists(request, session, url);
		JSONObject outputjson = null;
		if (!exist) {
			JSONObject params = new JSONObject();
			params.put("path", (String) session.getAttribute("path") + "{\"" + request.getParameter("name") + "\"}");
			params.put("th", Integer.parseInt((String) session.getAttribute("th")));

			System.out.println("param :" + params.toString());
			JSONObject json = new JSONObject();
			json.put("id", "2");
			json.put("jsonrpc", "2.0");
			json.put("method", "create");
			json.put("params", params);

			RestTemplate restTemplate = new RestTemplate();
			HttpHeaders headers = new HttpHeaders();
			headers.add("Cookie", (String) session.getAttribute("sessionid"));
			headers.setContentType(MediaType.APPLICATION_JSON);

			HttpEntity<String> entity = new HttpEntity<String>(json.toString(), headers);
			ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);

			outputjson = new JSONObject(responseEntity.getBody());

		} else {
			throw new JSONException("provided service name already exists");
		}
		return outputjson;

	}

	@Override
	public JSONObject getSavedDeviceList(HttpServletRequest request, HttpSession session, String url)
			throws JSONException {
		JSONObject param=new JSONObject();
		param.put("th", Integer.parseInt((String)session.getAttribute("th")));
		param.put("path", "/ncs:devices/device");
		param.put("chunk_size", 20);
		
		JSONObject json =new JSONObject();
		json.put("id", "2");
		json.put("jsonrpc", "2.0");
		json.put("method", "get_list_keys");
		json.put("params", param);
		
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Cookie", (String) session.getAttribute("sessionid"));
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<String> entity = new HttpEntity<String>(json.toString(), headers);
		ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
		
		JSONObject outputJson = new JSONObject(responseEntity.getBody());
		
		return outputJson;
		
	}

	@Override
	public JSONObject set_value(HttpSession session, String url, String value, String deviceValue)
			throws JSONException {
	System.out.println("path :"+session.getAttribute("path"));
	System.out.println("vpnType :"+session.getAttribute("vpnType"));
		JSONObject params=new JSONObject();
		params.put("th", Integer.parseInt((String)session.getAttribute("th")));
		params.put("path", (String)session.getAttribute("path")+"{\""+session.getAttribute("vpnType")+"\"}/l2vpn:"+deviceValue);
		params.put("value", value);

		JSONObject json=new JSONObject();
		json.put("jsonrpc", "2.0");
		json.put("id", 150);
		json.put("method", "set_value");
		json.put("params", params);
		System.out.println(json.toString());
		
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Cookie", (String) session.getAttribute("sessionid"));
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<String> entity = new HttpEntity<String>(json.toString(), headers);
		ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);

		JSONObject	outputJson = new JSONObject(responseEntity.getBody());
		
		return outputJson;
	}

	@Override
	public JSONObject dryRunCommit(HttpServletRequest request, HttpSession session, String url) throws JSONException {
		
		System.out.println("dry run");
			JSONObject param2=new JSONObject();
			param2.put("outformat", "cli");
			
			JSONObject params=new JSONObject();
			params.put("th", Integer.parseInt((String)session.getAttribute("th")));
			params.put("path", "/ncs:services/commit-dry-run");
			params.put("params", param2);
			
			JSONObject json=new JSONObject();
			json.put("jsonrpc", "2.0");
			json.put("id", 12);
			json.put("method", "run_action");
			json.put("params", params);
			
			System.out.println(json.toString());
			
			RestTemplate restTemplate = new RestTemplate();
			HttpHeaders headers = new HttpHeaders();
			headers.add("Cookie", (String) session.getAttribute("sessionid"));
			headers.setContentType(MediaType.APPLICATION_JSON);

			HttpEntity<String> entity = new HttpEntity<String>(json.toString(), headers);
			ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);

			JSONObject	outputJson = new JSONObject(responseEntity.getBody());
			System.out.println("Orignal Object :"+outputJson.toString());
			return outputJson;
		
	}
	
	@Override
	public JSONObject validateCommit(HttpServletRequest request, HttpSession session, String url) throws JSONException {
		JSONObject params=new JSONObject();
		params.put("th", Integer.parseInt((String)session.getAttribute("th")));
	
		JSONObject json=new JSONObject();
		json.put("jsonrpc", "2.0");
		json.put("id", 150);
		json.put("method", "validate_commit");
		json.put("params", params);
		System.out.println(json.toString());
		
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Cookie", (String) session.getAttribute("sessionid"));
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<String> entity = new HttpEntity<String>(json.toString(), headers);
		ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);

		JSONObject	outputJson = new JSONObject(responseEntity.getBody());
		System.out.println("validate_commit  :" +outputJson.toString());
		return outputJson;
	
	}

	@Override
	public JSONObject Commit(HttpServletRequest request, HttpSession session, String url) throws JSONException {
		System.out.println("path :"+session.getAttribute("path"));
		System.out.println("vpnType :"+session.getAttribute("vpnType"));
			JSONObject params=new JSONObject();
			params.put("th", Integer.parseInt((String)session.getAttribute("th")));
			params.put("timeout", 0);
			params.put("release_locks", true);
		

			JSONObject json=new JSONObject();
			json.put("jsonrpc", "2.0");
			json.put("id", 150);
			json.put("method", "commit");
			json.put("params", params);
			System.out.println(json.toString());
			
			RestTemplate restTemplate = new RestTemplate();
			HttpHeaders headers = new HttpHeaders();
			headers.add("Cookie", (String) session.getAttribute("sessionid"));
			headers.setContentType(MediaType.APPLICATION_JSON);

			HttpEntity<String> entity = new HttpEntity<String>(json.toString(), headers);
			ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);

			JSONObject	outputJson = new JSONObject(responseEntity.getBody());
			
			return outputJson;
	}

	
}
