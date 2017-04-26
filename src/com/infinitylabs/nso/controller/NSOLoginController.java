package com.infinitylabs.nso.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.infinitylabs.nso.model.LoginBean;
import com.infinitylabs.nso.serviceImpl.LoginServiceImpl;

@Controller
public class NSOLoginController {
	public final String url = "http://192.168.0.113:8080/jsonrpc";//Login through NSO url using login Password and username.
	final static Logger logger = Logger.getLogger(NSOLoginController.class);

	@Autowired
	LoginServiceImpl loginService;
	
	@RequestMapping("/loginPage")
	public ModelAndView loginPage() {
		LoginBean loginBean = new LoginBean();
		return new ModelAndView("login", "loginBean", loginBean);
	}
	@RequestMapping("/catalogue")
	public ModelAndView getcataloguePage() {
		ModelAndView model = new ModelAndView();
		model.setViewName("catalogue");
		return model;
	}
	//This is check for GIT
	//home
	@RequestMapping("/Popup")
	public ModelAndView getPopup() {
		ModelAndView model = new ModelAndView();
		model.setViewName("Popup");
		return model;
	}
	@RequestMapping("/home")
	public ModelAndView goHome() {
		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		return model;
	}


	@RequestMapping("/login")
	public ModelAndView getLogin(@ModelAttribute("loginBean") LoginBean loginBean, HttpServletRequest request) {
		logger.info("User name :" + loginBean.getUsername());
		HttpSession session = request.getSession(true);
		ModelAndView modelAndView = new ModelAndView();
		try {
			JSONObject loginJson = loginService.getLogin(loginBean, url, session);
			if (loginJson.has("result")) {
				JSONObject transObj = loginService.getTransactionId(url, session);
				if (transObj.has("result")) {
					JSONArray transJsonObj = transObj.getJSONObject("result").getJSONArray("trans");
					if (transJsonObj.length() == 0) {
						JSONObject newTransObj = loginService.getNewTransactionId(url, session);
						if (newTransObj.has("result")) {
							session.setAttribute("th", newTransObj.getJSONObject("result").getString("th"));
							logger.info("Transaction handler :" + session.getAttribute("th"));
						}

					} else {
						session.setAttribute("th", transJsonObj.getJSONObject(0).getString("th"));
						session.setAttribute("db", transJsonObj.getJSONObject(0).getString("db"));
					}
				}
				session.setAttribute("user", request.getParameter("username"));

				modelAndView.setViewName("index");
			} else if (loginJson.has("error")) {
				session.invalidate();
				modelAndView.setViewName("login");
				modelAndView.addObject("loginBean", new LoginBean());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
	}

	@RequestMapping("/logout")
	public ModelAndView getLogout(HttpServletRequest request) {
		LoginBean loginBean=new LoginBean();
		HttpSession session = request.getSession(true);
		ModelAndView model = new ModelAndView();
		try {
			JSONObject logoutJson = loginService.getLogout(url, session);
			if (logoutJson.has("result")) {
				session.invalidate();
				model.setViewName("login");
				model.addObject("loginBean", loginBean);

			} else if (logoutJson.has("error")) {
				model.setViewName("error");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
}
