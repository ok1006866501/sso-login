package com.bjsxt.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjsxt.pojo.Area;
import com.bjsxt.service.DataService;

@Controller
public class DataController {

	@Resource
	private DataService dataServiceImpl;
	//
	@RequestMapping("weatherinfo/cityphoto")
	@ResponseBody
	public Area getCity(String cityName) {//获取当前城市(主要为了当前城市照片显示)
		return dataServiceImpl.getAreaOne(cityName);
	}
	
	@RequestMapping("weatherinfo/city")
	@ResponseBody
	public List<Area> getCityInfo(Integer provinceId){//获取所有城市
		return dataServiceImpl.getCityByFatherId(provinceId);
	}
	
	@RequestMapping("weatherinfo/province")
	@ResponseBody
	public List<Area> getProvinceAllInfo(){//获取所有省份
		return dataServiceImpl.getProvinceInfo();
	}
	
	@RequestMapping("weatherinfo/switchCity")
	public String switchCity() {//跳转选择城市页面
		return "city";
	}
	
	@RequestMapping(value="weatherinfo/{cityId}",produces="text/html;charset=utf-8")
	@ResponseBody
	public String getTodayWeatherinfo(@PathVariable Integer cityId) {//获取到天气信息
		return dataServiceImpl.getWeatherInfo(cityId);
	}
	
	@RequestMapping(value="init",produces="text/html;charset=utf-8")
	@ResponseBody
	public String initData() {//
		long startTime = System.currentTimeMillis();
		dataServiceImpl.initData();
		long endTime = System.currentTimeMillis();
		return (endTime - startTime) / 100 + "秒";
	}
	
}
