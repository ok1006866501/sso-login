package com.xzit.sso.service.impl;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.stereotype.Service;

import com.xzit.sso.pojo.Employee;
import com.xzit.sso.repository.EmployeeRepository;
import com.xzit.sso.service.EmployeeLoginService;
import com.xzit.sso.utils.CookieUtils;

@Service
public class EmployeeLoginServiceImpl implements EmployeeLoginService {
	
	@Value("${employee.login.cookie.key}")
	private String employeeLoginSuccessCookieKey;
	@Resource
	private RedisTemplate redisTemplate;
	@Resource
	private EmployeeRepository employeeRepository;

	@Override
	public Map<String,Object> checkEmployeeLogin(HttpServletRequest request,HttpServletResponse response,String user, String password) {
		Employee emp = employeeRepository.findByEmpUsernameAndEmpPassword(user, password);
		Map<String,Object> map = new HashMap<>();
		if(emp != null) {
			String redisKey = UUID.randomUUID().toString();
			CookieUtils.setCookie(request, response, employeeLoginSuccessCookieKey,redisKey,60 * 30);
			Jackson2JsonRedisSerializer<Employee> ser = new Jackson2JsonRedisSerializer<Employee>(Employee.class);
			redisTemplate.setDefaultSerializer(ser);
			redisTemplate.opsForValue().set(redisKey,emp);
			map.put("status",200);
			map.put("emp",emp);
		}else {
			map.put("status",404);			
		}
		return map;
	}

	@Override
	public Map<String,Object> checkEmployeeLoginRedis(String token,HttpServletRequest request,HttpServletResponse response) {
		Jackson2JsonRedisSerializer<Employee> ser = new Jackson2JsonRedisSerializer<Employee>(Employee.class);
		redisTemplate.setDefaultSerializer(ser);
		Employee emp = (Employee) redisTemplate.opsForValue().get(token);
		Map<String,Object> map = new HashMap<>();
		if(emp != null) { 
			CookieUtils.setCookie(request, response, employeeLoginSuccessCookieKey,token,60 * 30);
			map.put("status",200);
			map.put("emp",emp);
		}else {
			map.put("status",404);
		}
		return map;
	}

	@Override
	public Map<String, Object> outEmployeeLoginRedis(String token, HttpServletRequest request,
			HttpServletResponse response) {
		Jackson2JsonRedisSerializer<Employee> ser = new Jackson2JsonRedisSerializer<Employee>(Employee.class);
		redisTemplate.setDefaultSerializer(ser);
		redisTemplate.delete(token);
		CookieUtils.deleteCookie(request, response, employeeLoginSuccessCookieKey);
		Employee emp = (Employee) redisTemplate.opsForValue().get(token);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status",200);
		return map;
	}
	
	

}
