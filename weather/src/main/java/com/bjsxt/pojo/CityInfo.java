package com.bjsxt.pojo;

public class CityInfo {
	    
	private String id;
	private String pid;
	private String city_code;
	private String city_name;
	private String post_code;
	private String area_code;
	private String ctime;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getCity_code() {
		return city_code;
	}
	public void setCity_code(String city_code) {
		this.city_code = city_code;
	}
	public String getCity_name() {
		return city_name;
	}
	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}
	public String getPost_code() {
		return post_code;
	}
	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}
	public String getArea_code() {
		return area_code;
	}
	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}
	public String getCtime() {
		return ctime;
	}
	public void setCtime(String ctime) {
		this.ctime = ctime;
	}
	@Override
	public String toString() {
		return "CityInfo [id=" + id + ", pid=" + pid + ", city_code=" + city_code + ", city_name=" + city_name
				+ ", post_code=" + post_code + ", area_code=" + area_code + ", ctime=" + ctime + "]";
	}
	
	
	
	
}
