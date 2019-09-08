package com.bjsxt.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.bjsxt.mapper.DataMapper;
import com.bjsxt.pojo.Area;
import com.bjsxt.pojo.CityInfo;
import com.bjsxt.service.DataService;
import com.bjsxt.utils.HttpClientUtil;
import com.bjsxt.utils.JsonUtils;

@Service
public class DataServiceImpl implements DataService {

	@Resource
	private DataMapper dataMapper;
	
	@Value("${weather.info.url}")
	private String url;
	
	@Override
	public void initData() {
		File file = new File("D:/city.txt");
		Long fileLength = file.length();
		byte[] bys = new byte[fileLength.intValue()];
		try {
			FileInputStream in = new FileInputStream(file);
			in.read(bys);
			in.close();
			String city = new String(bys,"UTF-8");
			List<CityInfo> list = JsonUtils.jsonToList(city,CityInfo.class);
			List<Area> listArea = dataMapper.selAllCity();
			for(CityInfo cityInfo:list) {
				for(Area area:listArea) {
					if(area.getAreaname().equals(cityInfo.getCity_name()) || (cityInfo.getCity_name()+"市").equals(area.getAreaname())) {
						area.setWeathercode(cityInfo.getCity_code());
						dataMapper.updOneCityWeatherCode(area);
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public String getWeatherInfo(Integer cityId) {	
		return HttpClientUtil.doGet(url+cityId);
	}

	@Override
	public List<Area> getProvinceInfo() {
		return dataMapper.selProvinceInfo();
	}

	@Override
	public List<Area> getCityByFatherId(Integer provinceId) {
		return dataMapper.selProviceChilrenInfo(provinceId);
	}

	@Override
	public Area getAreaOne(String cityName) {
		Area area = new Area();
		area.setImageurl("null");
		List<Area> list = dataMapper.selAreaLikeByName(cityName);
		if(list != null && list.size() > 0) {
			area = list.get(0);
		}
		return area;
	}

}
