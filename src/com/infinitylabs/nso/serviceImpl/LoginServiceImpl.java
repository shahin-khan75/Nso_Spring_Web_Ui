package com.infinitylabs.nso.serviceImpl;

import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.infinitylabs.nso.model.LoginBean;
import com.infinitylabs.nso.service.LoginService;

@Component
public class LoginServiceImpl implements LoginService {
	public JSONObject getLogin(LoginBean loginBean, String url, HttpSession session) throws JSONException {
		JSONObject params = new JSONObject();
		params.put("user", loginBean.getUsername());
		params.put("passwd", loginBean.getPassword());
		
		JSONObject loginJson = new JSONObject();
		loginJson.put("id", "1");
		loginJson.put("jsonrpc", "2.0");
		loginJson.put("method", "login");
		loginJson.put("params", params);
		System.out.println(loginJson.toString());
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> entity = new HttpEntity<String>(loginJson.toString(), headers);
		ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
		System.out.println("BODY :" + responseEntity.getBody());
		System.out.println("Headers : " + responseEntity.getHeaders());
		JSONObject jsonBody = new JSONObject(responseEntity.getBody());

		if (jsonBody.has("result")) {
			String[] cookie = responseEntity.getHeaders().get("Set-Cookie").get(0).split(";");
			for (int i = 0; i < cookie.length; i++) {
				if (cookie[i].contains("sessionid")) {
					session.setAttribute("sessionid", cookie[i]);
					System.out.println(cookie[i]);
				}
			}
		}

		return jsonBody;
	}

	public JSONObject getTransactionId(String url, HttpSession session) throws JSONException {
		ResponseEntity<String> responseEntity = null;
		JSONObject jsonBody = null;
		System.out.println("JSDJKJDKSJ :SS " + session.getAttribute("sessionid"));

		JSONObject transJson = new JSONObject();
		transJson.put("id", "2");
		transJson.put("jsonrpc", "2.0");
		transJson.put("method", "get_trans");

		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Cookie", (String) session.getAttribute("sessionid"));
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<String> entity = new HttpEntity<String>(transJson.toString(), headers);
		responseEntity = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
		System.out.println("BODY :" + responseEntity.getBody());
		jsonBody = new JSONObject(responseEntity.getBody());

		return jsonBody;
	}

	public JSONObject getNewTransactionId(String url, HttpSession session) throws JSONException {
		ResponseEntity<String> responseEntity = null;
		JSONObject jsonBody = null;
		System.out.println("JSDJKJDKSJ :SS " + session.getAttribute("sessionid"));

		JSONObject params = new JSONObject();
		params.put("db", "running");
		params.put("conf_mode", "private");
		params.put("mode", "read_write");

		JSONObject newTransJson = new JSONObject();
		newTransJson.put("id", "2");
		newTransJson.put("jsonrpc", "2.0");
		newTransJson.put("method", "new_trans");
		newTransJson.put("params", params);

		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Cookie", (String) session.getAttribute("sessionid"));
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<String> entity = new HttpEntity<String>(newTransJson.toString(), headers);
		responseEntity = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
		System.out.println("BODY :" + responseEntity.getBody());
		jsonBody = new JSONObject(responseEntity.getBody());

		return jsonBody;
	}

	public JSONObject getLogout(String url, HttpSession session) throws JSONException {
		ResponseEntity<String> responseEntity = null;
		JSONObject jsonBody = null;
		System.out.println("LogOut Method : " + session.getAttribute("sessionid"));

		JSONObject newTransJson = new JSONObject();
		newTransJson.put("id", "2");
		newTransJson.put("jsonrpc", "2.0");
		newTransJson.put("method", "logout");

		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Cookie", (String) session.getAttribute("sessionid"));
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<String> entity = new HttpEntity<String>(newTransJson.toString(), headers);
		responseEntity = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
		System.out.println("BODY :" + responseEntity.getBody());
		jsonBody = new JSONObject(responseEntity.getBody());

		return jsonBody;
	}

}
