package com.bjsxt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bjsxt.pojo.Area;

public interface DataMapper {

	@Select("select * from area")
	List<Area> selAllCity();
	
	@Update("update area set weathercode=#{area.weathercode} where areaid=#{area.areaid}")
	int updOneCityWeatherCode(@Param("area") Area area);
	
	@Select("select * from area where arealevel = ${1}")
	List<Area> selProvinceInfo();//所有省份信息
	
	@Select("select * from area where parentid=#{provinceId}")
	List<Area> selProviceChilrenInfo(Integer provinceId);//获取该省份所有城市
	
	@Select("select * from area where areaname like '%${cityName}%'")
	List<Area> selAreaLikeByName(@Param("cityName")String cityName);//通过名字模糊查询城市
}
