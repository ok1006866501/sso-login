package com.bjsxt.service;

import java.util.List;

import com.bjsxt.pojo.Area;

public interface DataService {

	void initData();
	
	String getWeatherInfo(Integer cityId);//通过城市id获取 到城市的天气信息
	
	List<Area> getProvinceInfo();//所有省份信息
	
	List<Area> getCityByFatherId(Integer provinceId);//获取该省份所有城市
	
	Area getAreaOne(String cityName);//获取当前城市(主要为了当前城市照片显示)
}
