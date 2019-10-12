package com.xzit.sso.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.converter.json.MappingJacksonValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xzit.sso.pojo.Employee;
import com.xzit.sso.service.EmployeeLoginService;

@Controller
public class EmployeeLoginController {

	@Resource
	private EmployeeLoginService employeeLoginServiceImpl;
	
	@RequestMapping("/index")
	public String jumpLoginPage(@RequestHeader("Referer") String url,HttpServletRequest request) {
		if(url != null && !url.equals("http://localhost:8060/index.jsp") ) {
			request.setAttribute("redirect",url);
		}
		return "forward:/index.jsp";
	}
	
	@RequestMapping("/login")
	@ResponseBody
	public Map<String,Object> checkLogin(String userName,String password,HttpServletRequest request,HttpServletResponse response) {
		return employeeLoginServiceImpl.checkEmployeeLogin(request,response,userName, password);
	}
	
	@RequestMapping("/checkLogin/{token}")
	@ResponseBody
	public MappingJacksonValue checkLoginRedis(@PathVariable String token,String callback,HttpServletRequest request,HttpServletResponse response) {
		MappingJacksonValue mappingJacksonValue = new MappingJacksonValue(employeeLoginServiceImpl.checkEmployeeLoginRedis(token,request,response));
		mappingJacksonValue.setJsonpFunction(callback);
		return mappingJacksonValue;
	}
	
	@RequestMapping("/outLogin/{token}")
	@ResponseBody
	public MappingJacksonValue outLogin(@PathVariable String token,String callback,HttpServletRequest request,HttpServletResponse resposne) {
		MappingJacksonValue mappingJacksonValue = new MappingJacksonValue(employeeLoginServiceImpl.outEmployeeLoginRedis(token,request,resposne));
		mappingJacksonValue.setJsonpFunction(callback);
		return mappingJacksonValue;
	}
}
