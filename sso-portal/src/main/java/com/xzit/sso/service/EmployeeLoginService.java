package com.xzit.sso.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface EmployeeLoginService {
	
	Map<String,Object> checkEmployeeLogin(HttpServletRequest request,HttpServletResponse response,String user,String password);
	
	Map<String,Object> checkEmployeeLoginRedis(String token,HttpServletRequest request,HttpServletResponse response);
	
	Map<String,Object> outEmployeeLoginRedis(String token,HttpServletRequest request,HttpServletResponse response);

}
