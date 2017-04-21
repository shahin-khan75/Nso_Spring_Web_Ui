package com.infinitylabs.nso.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.infinitylabs.nso.serviceImpl.DataServiceImpl;

@Controller
public class NSODataServiceController {
	public final String url = "http://192.168.0.113:8080/jsonrpc";
	final static Logger logger = Logger.getLogger(NSODataServiceController.class);

	@Autowired
	DataServiceImpl dataService;

	@RequestMapping("/servicesInstance")
	public ModelAndView getServicesInstance(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		System.out.println("Data Service :" + session.getAttribute("sessionid"));
		ModelAndView model = new ModelAndView();
		try {
			JSONObject outputjson = dataService.getVPNPath(session, url);
			List<String> serviceInstance;
			if (outputjson.has("result")) {
				JSONObject status = outputjson.getJSONObject("result").getJSONObject("service_points");
				logger.info("Service json :" + status.toString());
				serviceInstance = new ArrayList<String>();
				Iterator<String> serviceIterator = status.keys();
				JSONArray jsonArray = new JSONArray();

				while (serviceIterator.hasNext()) {
					String key = (String) serviceIterator.next();
					jsonArray.put(status.get(key));
					serviceInstance.add((String) status.get(key));
					logger.info("key we get the value of Services " + status.get(key));
				}

				model.setViewName("services_instance");
				model.addObject("servicesInstance", serviceInstance);
			} else if (outputjson.has("error")) {
				model.setViewName("error");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}

	@RequestMapping(value = "/getService")
	public ModelAndView getService(@RequestParam("path") String path, @RequestParam("vpn") String vpnType,
			HttpServletRequest request) {
		System.out.println("Path on GetService Method :" + path + "---------" + vpnType);
		HttpSession session = request.getSession(false);

		// these two attribute is used for further use
		session.setAttribute("path", path);
		session.setAttribute("vpnType", vpnType);

		ModelAndView model = new ModelAndView();
		try {
			dataService.getQueryHeaderId(path, session, url, vpnType);// to get
																		// the
																		// value
			// of QH...
			JSONObject jsonObj = dataService.getExistVpnName(request, session, url);

			if (jsonObj.has("result")) {
				JSONArray jsonArray = jsonObj.getJSONObject("result").getJSONArray("results");
				List<String> existVPNs = new ArrayList<String>();
				JSONArray array;
				System.out.println("Length :" + jsonArray.length());

				if (jsonArray.length() != 0) {
					for (int i = 0; i < jsonArray.length(); i++) {
						array = jsonArray.getJSONArray(i);
						existVPNs.add(array.getString(0));
						System.out.println("JOB :" + array.toString());
					}
				}
				model.setViewName("add-services");
				model.addObject("existVPNs", existVPNs);
			} else if (jsonObj.has("error")) {
				model.setViewName("error");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}

	@RequestMapping(value = "/l2VpnService", method = RequestMethod.GET)
	public ModelAndView getL2VpnService(@RequestParam("path") String path, @RequestParam("vpn") String vpnType,
			HttpServletRequest request) {
		System.out.println("Path on l2VpnService Method :" + path);
		HttpSession session = request.getSession(false);
		ModelAndView model = new ModelAndView();

		// these two attribute is used for further use
		session.setAttribute("path", path);
		session.setAttribute("vpnType", vpnType);

		try {
			dataService.getQueryHeaderId(path, session, url, vpnType);// to get
																		// the
																		// value
			JSONObject jsonObj = dataService.getExistVpnName(request, session, url);

			if (jsonObj.has("result")) {
				JSONArray jsonArray = jsonObj.getJSONObject("result").getJSONArray("results");
				List<String> existVPNs = new ArrayList<String>();
				JSONArray array;
				System.out.println("Length :" + jsonArray.length());

				if (jsonArray.length() != 0) {
					for (int i = 0; i < jsonArray.length(); i++) {
						array = jsonArray.getJSONArray(i);
						existVPNs.add(array.getString(0));
						System.out.println("l2VpnService array :" + array.toString());
					}
				}
				model.setViewName("add-services");
				model.addObject("existVPNs", existVPNs);
			} else if (jsonObj.has("error")) {
				model.setViewName("error");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}

	@RequestMapping("/l2VpnProvision")
	public ModelAndView getL2Provision(HttpServletRequest request) {
		ModelAndView model = null;
		try {
			HttpSession session = request.getSession(false);
			logger.info("value:" + session.getAttribute("cookieValue"));
			JSONObject outputjson = dataService.getVPNPath(session, url);
			List<String> device;

			if (outputjson.has("result")) {
				JSONObject status = outputjson.getJSONObject("result").getJSONObject("service_points");
				logger.info("Service json :" + status.toString());
				device = new ArrayList<String>();

				Iterator<String> serviceIterator = status.keys();
				JSONArray jsonArray = new JSONArray();

				while (serviceIterator.hasNext()) {
					String key = (String) serviceIterator.next();
					jsonArray.put(status.get(key));
					device.add((String) status.get(key));
					logger.info("key we get the value of Services " + status.get(key));
				}
				model = new ModelAndView();
				model.setViewName("VPN_ProvisionL2");
				model.addObject("device", device);

			} else if (outputjson.has("error")) {
				model = new ModelAndView();
				model.setViewName("error");
			}
		} catch (Exception e) {
			logger.error("Exception occur :", e);
			// e.printStackTrace();
		}
		return model;
	}

	@RequestMapping("/addService")
	public ModelAndView SetServices(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		ModelAndView model = null;
		try {
			JSONObject createServiceJson = dataService.createService(request, session, url);
			if (createServiceJson.has("result")) {
				String path = (String) session.getAttribute("path");
				String vpnType = (String) session.getAttribute("vpnType");
				dataService.getQueryHeaderId(path, session, url, vpnType);
				JSONObject exitVPNJson = dataService.getExistVpnName(request, session, url);
				System.out.println("outputJson :" + exitVPNJson.toString());
				JSONArray jsonArray = exitVPNJson.getJSONObject("result").getJSONArray("results");
				JSONArray array;
				System.out.println("Length :" + jsonArray.length());
				List<String> existVPNs = new ArrayList<>();
				if (jsonArray.length() != 0) {
					for (int i = 0; i < jsonArray.length(); i++) {
						array = jsonArray.getJSONArray(i);
						existVPNs.add(array.getString(0));
						System.out.println("JOB :" + existVPNs.toString());
					}
				}
				model = new ModelAndView();
				model.setViewName("add-services");
				model.addObject("existVPNs", existVPNs);
			} else {
				model = new ModelAndView();
				model.setViewName("error");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}

	@RequestMapping("/viewService")
	public ModelAndView viewService(HttpServletRequest request) {
		ModelAndView model = null;
		HttpSession session = request.getSession(false);
		String vpnName = request.getParameter("vpnName");
		System.out.println("VpnName in viewService :" + vpnName);
		try {
			JSONObject outputJson = dataService.getSavedDeviceList(request, session, url);

			JSONArray jsonArray = outputJson.getJSONObject("result").getJSONArray("keys");
			List<String> devices = new ArrayList<>();
			JSONArray array;
			if (jsonArray.length() != 0) {
				for (int i = 0; i < jsonArray.length(); i++) {
					array = jsonArray.getJSONArray(i);
					devices.add(array.getString(0));
				}
			}
			model = new ModelAndView();
			model.setViewName("service-innerpage");
			model.addObject("devices", devices);
			model.addObject("vpnName", vpnName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}

	@RequestMapping(value = "/setValuebyAjax", method = RequestMethod.POST)
	public @ResponseBody String setModelData(@RequestParam("value") String value,
			@RequestParam("deviceType") String deviceType, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		System.out.println(value + "---" + deviceType);
		String returnText = null;
		try {
			JSONObject outputJson = dataService.set_value(session, url, value, deviceType);
			System.out.println("ajax json :" + outputJson.toString());
			if (outputJson.has("result")) {
				returnText = "success";
			} else {
				returnText = "error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// write(response,model);
		return returnText;
	}

	@RequestMapping(value = "/dryRunCommit")
	public @ResponseBody String dryRunCommit(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		String json_Str = null;
		try {
			JSONObject outputJson = dataService.dryRunCommit(request, session, url);
			logger.info("DryRunCommit Json  :" + outputJson.toString());

			if (outputJson.has("result")) {
				JSONArray jsonArray = outputJson.getJSONArray("result");
				System.out.println("JSON A :" + jsonArray.length());

				for (int i = 0; i < jsonArray.length(); i++) {
					System.out.println(jsonArray.getJSONObject(i).getString("value"));
					json_Str = jsonArray.getJSONObject(i).getString("value");
				}
			} else if (outputJson.has("error")) {
				// json_Str
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return json_Str;
	}

	@RequestMapping("/commitVPN")
	public ModelAndView CommitVPN(HttpServletRequest request) {
		ModelAndView model = null;
		HttpSession session = request.getSession(false);
		try {
			JSONObject validateCommit = dataService.validateCommit(request, session, url);
			System.out.println("validate commit on controller : " + validateCommit.toString());
			if (validateCommit.has("result")) {
				JSONObject outputJson = dataService.Commit(request, session, url);
				System.out.println("commit on controller : " + outputJson.toString());
				if (outputJson.has("result")) {
					model = new ModelAndView();
					model.setViewName("success");
					// model.addObject("devices", devices);
				} else {
					model = new ModelAndView();
					model.setViewName("error");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
}
