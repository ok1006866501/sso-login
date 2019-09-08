<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>天气</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<style type="text/css">
		#showDiv {
			width: 100%;
			height: 480px;
			background-color: #3399FF;
		}
		#city{
			position:relative;
			top:30px;
			left:120px;
			width:500px;
			height:125px;
		}
		#cityPhoto{
			float:left;
			height:89px;
			width:121px;
			border-radius:10px;
			background-image:url(http://localhost:80/images/beijing.gif);
			background-size:121px 89px;
			position:relative;
			top:15px;
		}
		#cityText{
			float:right;
			height:125px;
			width:375px;
			
		}
		#cityTextTable{
			height:125px;
			width:375px;
		}
		#cityA{
			color:white;
			text-decoration: none;
		}
		#showWeather{
			height:160px;
			width:500px;
			position:relative;
			left:104px;
			top:36px;
		}
		#showWeatherTable{
			height:160px;
			width:500px;
		}
		#showPM{
			height:70px;
			width:500px;
			position:relative;
			top:40px;
			left:104px;
		}
		#showPMTable{
			height:70px;
			width:500px;
		}
	</style>
	<script type="text/javascript" >
	
		function getTime(){
	        var date = new Date();
	        var day = date.getDate();
	        var month = date.getMonth() + 1;
	        var year = date.getFullYear();
	        return year+"年"+month+"月"+day+"日";
	    }
	
	    function dayDate(){
	        var dayDate = new Date().getDay();
	        var strTime;
	        switch(dayDate){
	            case 0:{
	                strTime = "星期天";
	                break;
	            }
	            case 1:{
	                strTime = "星期一";
	                break;
	            }
	            case 2:{
	                strTime = "星期二";
	                break;
	            }
	            case 3:{
	                strTime = "星期三";
	                break;
	            }
	            case 4:{
	                strTime = "星期四";
	                break;
	            }
	            case 5:{
	                strTime = "星期五";
	                break;
	            }
	            case 6:{
	                strTime = "星期六";
	                break;
	            }
	        }
	        return strTime;
	    }
		<%--
			http://t.weather.sojson.com/api/weather/city/101010100
			http://wthrcdn.etouch.cn/weather_mini?city=天津
		--%>
		
		function editBigPicture(weatherInfo){//修改天气显示图片 以及天气显示比如晴|多云
			var $weatherPictures = $("#weatherPictures");
			$("#nowTheWeather").html(weatherInfo);
			if(weatherInfo === "晴"){
				$weatherPictures[0].src = "${pageContext.request.contextPath}/images/qingtian.png";
			}else if(weatherInfo === "多云"){
				$weatherPictures[0].src = "${pageContext.request.contextPath}/images/duoyun.png";
			}else if(weatherInfo === "阴"){
				$weatherPictures[0].src = "${pageContext.request.contextPath}/images/yintian.png";
			}else if(weatherInfo === "小雨"){
				$weatherPictures[0].src = "${pageContext.request.contextPath}/images/xiaoyu.png";
			}else if(weatherInfo === "中雨"){
				$weatherPictures[0].src = "${pageContext.request.contextPath}/images/zhongyudaoxiaoyu.png";
			}else if(weatherInfo === "大雨"){
				$weatherPictures[0].src = "${pageContext.request.contextPath}/images/zhongyudaobaoyu.png";
			}else if(weatherInfo === "中雨到暴雨"){
				$weatherPictures[0].src = "${pageContext.request.contextPath}/images/zhongyudaobaoyu.png";
			}else if(weatherInfo === "暴雨"){
				$weatherPictures[0].src = "${pageContext.request.contextPath}/images/zhongyudaobaoyu.png";
			}else if(weatherInfo === "雷阵雨"){
				$weatherPictures[0].src = "${pageContext.request.contextPath}/images/leizhenyu.png";
			}else if(weatherInfo === "小到中雨"){
				$weatherPictures[0].src = "${pageContext.request.contextPath}/images/zhongyudaoxiaoyu.png";
			}else if(weatherInfo === "中到小雨"){
				$weatherPictures[0].src = "${pageContext.request.contextPath}/images/zhongyudaoxiaoyu.png";
			}else if(weatherInfo === "大雨到暴雨"){
				$weatherPictures[0].src = "${pageContext.request.contextPath}/images/dayudaobaoyu.png";
			}else if(weatherInfo === "中雨到暴雨"){
				$weatherPictures[0].src = "${pageContext.request.contextPath}/images/dayudaobaoyu.png";
			}else if(weatherInfo === "小雨到暴雨"){
				$weatherPictures[0].src = "${pageContext.request.contextPath}/images/dayudaobaoyu.png";
			}else if(weatherInfo === "霾转多云"){
				$weatherPictures[0].src = "${pageContext.request.contextPath}/images/wuzhuanduoyun.png";
			}else if(weatherInfo === "霾"){
				$weatherPictures[0].src = "${pageContext.request.contextPath}/images/wuzhuanduoyun.png";
			}else if(weatherInfo === "阴转雨"){
				$weatherPictures[0].src = "${pageContext.request.contextPath}/images/yintian.png";
			}else{
				$weatherPictures[0].src = "${pageContext.request.contextPath}/images/qingtian.png";
			}
		}
		
		function editTemperature(temperatureHigh,temperatureLow,temperature){//修改大温度
			var high = temperatureHigh.split("高温 ")[1].split("℃")[0];
			var low = temperatureLow.split("低温 ")[1].split("℃")[0];
			$("#temperatureSpan").html(temperature);
			editTemperatureBetween(high,low);
		}
		
		function editTemperatureBetween(high,low){//修改温度什么到什么之间
			$("#startTemperatureSpan").html(low);
			$("#endTemperatureSpan").html(high);
		}
		
		function editQualitySpanAndPm25(quality,pm25){//空气质量
			var $qualityDiv = $("#qualityDiv");
			$("#qualitySpan").html(quality);
			$("#pm25Span").html(Math.ceil(pm25));
			if(quality === "优"){//background-color:#FFBB17
				$("#qualitySpanStyle").css("font-size","23px");
				$qualityDiv.css("background-color","#79B800");
			}else if(quality === "良"){
				$("#qualitySpanStyle").css("font-size","23px");
				$qualityDiv.css("background-color","#FFBB17");
			}else{
				if(quality.length > 3){
					$("#qualitySpanStyle").css("font-size","17px");
				}
				$qualityDiv.css("background-color","#F72D21");
			}
		}
		
		function editSunriseAndSunset(sunrise,sunset){//日出时间 日落时间
			$("#sunriseSpan").html(sunrise);
			$("#sunsetSpan").html(sunset);
		}
		
		function editCity(currentCity){//修改当前城市 以及城市图片
			if(currentCity.split("市")[0].length > 3){
				$("#currentCity").css("font-size","28px");
			}else{
				$("#currentCity").css("font-size","35px");
			}
			var cityName = currentCity.split("市")[0];
			$("#currentCity").html("<b>"+cityName+"</b>");//当前城市
			$.post("${pageContext.request.contextPath}/weatherinfo/cityphoto",{cityName:cityName},function(data){
				if(data.imageurl != "null"){
					$("#cityPhoto").css("background-image","url(http://localhost:80/images/"+data.imageurl+")");
				}
			});
		}
		
		var weather;
		$(function(){
			$("#tdTime").html("<span style='color:white;position:relative;left:23px;font-size:18px;' >"+getTime()+"</span>");
			$("#tdDay").html("<span style='color:white;font-size:18px;position:relative;left:62px;'>"+dayDate()+"</span>");
			weatherInfo("101010100");
		});
		
		function weatherInfo(cityId){
			$.post("${pageContext.request.contextPath}/weatherinfo/"+cityId,function(data){
				eval("temp="+data);
				weather = temp;
				var weatherInfo = weather.data.forecast[0].type;//天气 晴等
				var temperature = weather.data.wendu;//获取到温度
				var temperatureHigh = weather.data.forecast[0].high;//最高温 数据格式:高温 35℃
				var temperatureLow = weather.data.forecast[0].low;//最低温
				var currentCity = weather.cityInfo.city;//当前城市
				var humidity = weather.data.shidu;//湿度
				var windDirection = weather.data.forecast[0].fx;//风向
				var level = weather.data.forecast[0].fl;//风向的级别
				var quality = weather.data.quality;//空气质量
				var pm25 = weather.data.pm25;//pm2.5
				var sunrise = weather.data.forecast[0].sunrise;//日出
				var sunset = weather.data.forecast[0].sunset;//日落
				editBigPicture(weatherInfo);//修改显示天气图片 以及天气显示比如晴|多云
				editTemperature(temperatureHigh,temperatureLow,temperature);//修改大温度
				editCity(currentCity);//修改当前城市 以及城市图片
				$("#humidity").html(humidity);//湿度
				$("#windDirectionAndLevel").html(windDirection+level);//风向和级别
				editQualitySpanAndPm25(quality,pm25);//空气质量和pm2.5
				editSunriseAndSunset(sunrise,sunset);//日出日落
				editAWeekTime(weather.data.forecast,currentCity);//修改一周 星期 日期 以及 一周报 15天天气 30天天气 前缀城市
				editWeatherPhto(weather.data.forecast);//修改一周 天气情况和照片 显示
				editAWeekTemperature(weather.data.forecast);//一周高温低温
			});
		}
		
		function editAWeekTemperature(forecast){//一周高温低温
			for(var i = 0;i < (forecast.length - 1);i++){
				var high = weather.data.forecast[i].high;
				var low = weather.data.forecast[i].low;
				var wind = weather.data.forecast[i].fx;
				if(wind.length > 4){
					wind = "无持续";
				}
				if(i == 0){
					$("#oneHigh").html(high.split("℃")[0].split("温")[1]+"°");
					$("#oneLow").html(low.split("℃")[0].split("温")[1]+"°");
					$("#oneWind").html(wind);
				}else if(i == 1){
					$("#twoHigh").html(high.split("℃")[0].split("温")[1]+"°");
					$("#twoLow").html(low.split("℃")[0].split("温")[1]+"°");
					$("#twoWind").html(wind);
				}else if(i == 2){
					$("#threeHigh").html(high.split("℃")[0].split("温")[1]+"°");
					$("#threeLow").html(low.split("℃")[0].split("温")[1]+"°");
					$("#threeWind").html(wind);
				}else if(i == 3){
					$("#fourHigh").html(high.split("℃")[0].split("温")[1]+"°");
					$("#fourLow").html(low.split("℃")[0].split("温")[1]+"°");
					$("#fourWind").html(wind);
				}else if(i == 4){
					$("#fiveHigh").html(high.split("℃")[0].split("温")[1]+"°");
					$("#fiveLow").html(low.split("℃")[0].split("温")[1]+"°");
					$("#fiveWind").html(wind);
				}else if(i == 5){
					$("#sixHigh").html(high.split("℃")[0].split("温")[1]+"°");
					$("#sixLow").html(low.split("℃")[0].split("温")[1]+"°");
					$("#sixWind").html(wind);
				}else if(i == 6){	
					$("#sevenHigh").html(high.split("℃")[0].split("温")[1]+"°");
					$("#sevenLow").html(low.split("℃")[0].split("温")[1]+"°");
					$("#sevenWind").html(wind);
				}
			}
		}
		
		function editWeatherPhto(forecast){//修改一周 天气情况和照片显示 1
			for(var i = 0;i < (forecast.length - 1);i++){
				var weatherInfo = weather.data.forecast[i].type
				if(weatherInfo === "晴"){
					editWeatherPhto2(i,"qingtian.png",weatherInfo);
				}else if(weatherInfo === "多云"){
					editWeatherPhto2(i,"duoyun.png",weatherInfo);
				}else if(weatherInfo === "阴"){
					editWeatherPhto2(i,"yintian.png",weatherInfo);
				}else if(weatherInfo === "小雨"){
					editWeatherPhto2(i,"xiaoyu.png",weatherInfo);
				}else if(weatherInfo === "中雨"){
					editWeatherPhto2(i,"zhongyudaoxiaoyu.png",weatherInfo);
				}else if(weatherInfo === "大雨"){
					editWeatherPhto2(i,"zhongyudaobaoyu.png",weatherInfo);
				}else if(weatherInfo === "中雨到暴雨"){
					editWeatherPhto2(i,"zhongyudaobaoyu.png",weatherInfo);
				}else if(weatherInfo === "暴雨"){
					editWeatherPhto2(i,"zhongyudaobaoyu.png",weatherInfo);
				}else if(weatherInfo === "雷阵雨"){
					editWeatherPhto2(i,"leizhenyu.png",weatherInfo);
				}else if(weatherInfo === "小到中雨"){
					editWeatherPhto2(i,"zhongyudaoxiaoyu.png",weatherInfo);
				}else if(weatherInfo === "中到小雨"){
					editWeatherPhto2(i,"zhongyudaoxiaoyu.png",weatherInfo);
				}else if(weatherInfo === "大雨到暴雨"){
					editWeatherPhto2(i,"dayudaobaoyu.png",weatherInfo);
				}else if(weatherInfo === "中雨到暴雨"){
					editWeatherPhto2(i,"dayudaobaoyu.png",weatherInfo);
				}else if(weatherInfo === "小雨到暴雨"){
					editWeatherPhto2(i,"dayudaobaoyu.png",weatherInfo);
				}else if(weatherInfo === "霾转多云"){
					editWeatherPhto2(i,"wuzhuanduoyun.png",weatherInfo);
				}else if(weatherInfo === "霾"){
					editWeatherPhto2(i,"wuzhuanduoyun.png",weatherInfo);
				}else if(weatherInfo === "阴转雨"){
					editWeatherPhto2(i,"yintian.png",weatherInfo);
				}else{
					editWeatherPhto2(i,"qingtian.png",weatherInfo);
				}
			}
		}
		
		function editWeatherPhto2(i,weatherPhoto,weatherInfo){//修改一周 天气情况和照片显示 2
			if(i == 0){
				var $oneWeatherSpan = $("#oneWeatherSpan");
				$("#oneImg")[0].src = "${pageContext.request.contextPath}/images/"+weatherPhoto;
				if(weatherInfo.length == 1){
					$oneWeatherSpan.css("font-size","20px");
					$oneWeatherSpan.css("top","105px");
					$oneWeatherSpan.css("right","31px");
					$oneWeatherSpan.html(weatherInfo);
				}else if(weatherInfo.length == 2){
					$oneWeatherSpan.css("font-size","18px");
					$oneWeatherSpan.css("right","37px");
					$oneWeatherSpan.html(weatherInfo);
				}else if(weatherInfo.length == 3){
					$oneWeatherSpan.css("font-size","16px");
					$oneWeatherSpan.css("right","42px");
					$oneWeatherSpan.html(weatherInfo);
				}else if(weatherInfo.length == 4){
					var temp = weatherInfo.split("");
					$oneWeatherSpan.css("font-size","16px");
					$oneWeatherSpan.css("right","42px");
					$oneWeatherSpan.html(temp[1]+temp[2]+temp[3]);
				}else if(weatherInfo.length == 5){
					var temp = weatherInfo.split("");
					$oneWeatherSpan.css("font-size","16px");
					$oneWeatherSpan.css("right","42px");
					$oneWeatherSpan.html(temp[2]+temp[3]+temp[4]);
				}
			}else if(i == 1){
				var $twoWeatherSpan = $("#twoWeatherSpan");
				$("#twoImg")[0].src = "${pageContext.request.contextPath}/images/"+weatherPhoto;
				if(weatherInfo.length == 1){
					$twoWeatherSpan.css("font-size","20px");
					$twoWeatherSpan.css("top","105px");
					$twoWeatherSpan.css("right","31px");
					$twoWeatherSpan.html(weatherInfo);
				}else if(weatherInfo.length == 2){
					$twoWeatherSpan.css("font-size","18px");
					$twoWeatherSpan.css("right","37px");
					$twoWeatherSpan.html(weatherInfo);
				}else if(weatherInfo.length == 3){
					$twoWeatherSpan.css("font-size","16px");
					$twoWeatherSpan.css("right","42px");
					$twoWeatherSpan.html(weatherInfo);
				}else if(weatherInfo.length == 4){
					var temp = weatherInfo.split("");
					$twoWeatherSpan.css("font-size","16px");
					$twoWeatherSpan.css("right","42px");
					$twoWeatherSpan.html(temp[1]+temp[2]+temp[3]);
				}else if(weatherInfo.length == 5){
					var temp = weatherInfo.split("");
					$twoWeatherSpan.css("font-size","16px");
					$twoWeatherSpan.css("right","42px");
					$twoWeatherSpan.html(temp[2]+temp[3]+temp[4]);
				}
			}else if(i == 2){
				var $threeWeatherSpan = $("#threeWeatherSpan");
				$("#threeImg")[0].src = "${pageContext.request.contextPath}/images/"+weatherPhoto;
				if(weatherInfo.length == 1){
					$threeWeatherSpan.css("font-size","20px");
					$threeWeatherSpan.css("top","105px");
					$threeWeatherSpan.css("right","31px");
					$threeWeatherSpan.html(weatherInfo);
				}else if(weatherInfo.length == 2){
					$threeWeatherSpan.css("font-size","18px");
					$threeWeatherSpan.css("right","37px");
					$threeWeatherSpan.html(weatherInfo);
				}else if(weatherInfo.length == 3){
					$threeWeatherSpan.css("font-size","16px");
					$threeWeatherSpan.css("right","42px");
					$threeWeatherSpan.html(weatherInfo);
				}else if(weatherInfo.length == 4){
					var temp = weatherInfo.split("");
					$threeWeatherSpan.css("font-size","16px");
					$threeWeatherSpan.css("right","42px");
					$threeWeatherSpan.html(temp[1]+temp[2]+temp[3]);
				}else if(weatherInfo.length == 5){
					var temp = weatherInfo.split("");
					$threeWeatherSpan.css("font-size","16px");
					$threeWeatherSpan.css("right","42px");
					$threeWeatherSpan.html(temp[2]+temp[3]+temp[4]);
				}
			}else if(i == 3){
				var $fourWeatherSpan = $("#fourWeatherSpan");
				$("#fourImg")[0].src = "${pageContext.request.contextPath}/images/"+weatherPhoto;
				if(weatherInfo.length == 1){
					$fourWeatherSpan.css("font-size","20px");
					$fourWeatherSpan.css("top","105px");
					$fourWeatherSpan.css("right","31px");
					$fourWeatherSpan.html(weatherInfo);
				}else if(weatherInfo.length == 2){
					$fourWeatherSpan.css("font-size","18px");
					$fourWeatherSpan.css("right","37px");
					$fourWeatherSpan.html(weatherInfo);
				}else if(weatherInfo.length == 3){
					$fourWeatherSpan.css("font-size","16px");
					$fourWeatherSpan.css("right","42px");
					$fourWeatherSpan.html(weatherInfo);
				}else if(weatherInfo.length == 4){
					var temp = weatherInfo.split("");
					$fourWeatherSpan.css("font-size","16px");
					$fourWeatherSpan.css("right","42px");
					$fourWeatherSpan.html(temp[1]+temp[2]+temp[3]);
				}else if(weatherInfo.length == 5){
					var temp = weatherInfo.split("");
					$fourWeatherSpan.css("font-size","16px");
					$fourWeatherSpan.css("right","42px");
					$fourWeatherSpan.html(temp[2]+temp[3]+temp[4]);
				}
			}else if(i == 4){
				var $fiveWeatherSpan = $("#fiveWeatherSpan");
				$("#fiveImg")[0].src = "${pageContext.request.contextPath}/images/"+weatherPhoto;
				if(weatherInfo.length == 1){
					$fiveWeatherSpan.css("font-size","20px");
					$fiveWeatherSpan.css("top","105px");
					$fiveWeatherSpan.css("right","31px");
					$fiveWeatherSpan.html(weatherInfo);
				}else if(weatherInfo.length == 2){
					$fiveWeatherSpan.css("font-size","18px");
					$fiveWeatherSpan.css("right","37px");
					$fiveWeatherSpan.html(weatherInfo);
				}else if(weatherInfo.length == 3){
					$fiveWeatherSpan.css("font-size","16px");
					$fiveWeatherSpan.css("right","42px");
					$fiveWeatherSpan.html(weatherInfo);
				}else if(weatherInfo.length == 4){
					var temp = weatherInfo.split("");
					$fiveWeatherSpan.css("font-size","16px");
					$fiveWeatherSpan.css("right","42px");
					$fiveWeatherSpan.html(temp[1]+temp[2]+temp[3]);
				}else if(weatherInfo.length == 5){
					var temp = weatherInfo.split("");
					$fiveWeatherSpan.css("font-size","16px");
					$fiveWeatherSpan.css("right","42px");
					$fiveWeatherSpan.html(temp[2]+temp[3]+temp[4]);
				}
			}else if(i == 5){
				var $sixWeatherSpan = $("#sixWeatherSpan");
				$("#sixImg")[0].src = "${pageContext.request.contextPath}/images/"+weatherPhoto;
				if(weatherInfo.length == 1){
					$sixWeatherSpan.css("font-size","20px");
					$sixWeatherSpan.css("top","105px");
					$sixWeatherSpan.css("right","31px");
					$sixWeatherSpan.html(weatherInfo);
				}else if(weatherInfo.length == 2){
					$sixWeatherSpan.css("font-size","18px");
					$sixWeatherSpan.css("right","37px");
					$sixWeatherSpan.html(weatherInfo);
				}else if(weatherInfo.length == 3){
					$sixWeatherSpan.css("font-size","16px");
					$sixWeatherSpan.css("right","42px");
					$sixWeatherSpan.html(weatherInfo);
				}else if(weatherInfo.length == 4){
					var temp = weatherInfo.split("");
					$sixWeatherSpan.css("font-size","16px");
					$sixWeatherSpan.css("right","42px");
					$sixWeatherSpan.html(temp[1]+temp[2]+temp[3]);
				}else if(weatherInfo.length == 5){
					var temp = weatherInfo.split("");
					$sixWeatherSpan.css("font-size","16px");
					$sixWeatherSpan.css("right","42px");
					$sixWeatherSpan.html(temp[2]+temp[3]+temp[4]);
				}
			}else if(i == 6){
				var $sevenWeatherSpan = $("#sevenWeatherSpan");
				$("#sevenImg")[0].src = "${pageContext.request.contextPath}/images/"+weatherPhoto;
				if(weatherInfo.length == 1){
					$sevenWeatherSpan.css("font-size","20px");
					$sevenWeatherSpan.css("top","105px");
					$sevenWeatherSpan.css("right","31px");
					$sevenWeatherSpan.html(weatherInfo);
				}else if(weatherInfo.length == 2){
					$sevenWeatherSpan.css("font-size","18px");
					$sevenWeatherSpan.css("right","37px");
					$sevenWeatherSpan.html(weatherInfo);
				}else if(weatherInfo.length == 3){
					$sevenWeatherSpan.css("font-size","16px");
					$sevenWeatherSpan.css("right","42px");
					$sevenWeatherSpan.html(weatherInfo);
				}else if(weatherInfo.length == 4){
					var temp = weatherInfo.split("");
					$sevenWeatherSpan.css("font-size","16px");
					$sevenWeatherSpan.css("right","42px");
					$sevenWeatherSpan.html(temp[1]+temp[2]+temp[3]);
				}else if(weatherInfo.length == 5){
					var temp = weatherInfo.split("");
					$sevenWeatherSpan.css("font-size","16px");
					$sevenWeatherSpan.css("right","42px");
					$sevenWeatherSpan.html(temp[2]+temp[3]+temp[4]);
				}
			}
		}
		
		function editAWeekTime(forecast,currentCity){//修改一周 星期 日期 以及 一周报 15天天气 30天天气 前缀城市
			$("#oneDateSpan").html(forecast[0].ymd.split("-")[1]+"月"+forecast[0].ymd.split("-")[2]+"日");
			$("#oneWeekSpan").html(forecast[0].week);
			$("#twoDateSpan").html(forecast[1].ymd.split("-")[1]+"月"+forecast[1].ymd.split("-")[2]+"日");
			$("#twoWeekSpan").html(forecast[1].week);
			$("#threeDateSpan").html(forecast[2].ymd.split("-")[1]+"月"+forecast[2].ymd.split("-")[2]+"日");
			$("#threeWeekSpan").html(forecast[2].week);
			$("#fourDateSpan").html(forecast[3].ymd.split("-")[1]+"月"+forecast[3].ymd.split("-")[2]+"日");
			$("#fourWeekSpan").html(forecast[3].week);
			$("#fiveDateSpan").html(forecast[4].ymd.split("-")[1]+"月"+forecast[4].ymd.split("-")[2]+"日");
			$("#fiveWeekSpan").html(forecast[4].week);
			$("#sixDateSpan").html(forecast[5].ymd.split("-")[1]+"月"+forecast[5].ymd.split("-")[2]+"日");
			$("#sixWeekSpan").html(forecast[5].week);
			$("#sevenDateSpan").html(forecast[6].ymd.split("-")[1]+"月"+forecast[6].ymd.split("-")[2]+"日");
			$("#sevenWeekSpan").html(forecast[6].week);
			if(currentCity.split("市")[0].length > 3 || currentCity.split("市")[0].length == 3){//22 17
				//$("#days15").css("font-size","15px");
				//$("#days30").css("font-size","15px");
				$("#days15").css("left","8px");
				$("#days30").css("left","8px");
				$("#days15To").css("left","3px");
				$("#days30To").css("left","3px");
				$("#weeklyNewspaperSpan").css("font-size","19.5px");
				$("#weeklyNewspaperSpanTo").css("font-size","19.5px");
			}else{
				$("#days15").css("left","25px");
				$("#days30").css("left","25px");
				$("#days15To").css("left","21px");
				$("#days30To").css("left","21px");
				$("#weeklyNewspaperSpan").css("font-size","22px");
				$("#weeklyNewspaperSpanTo").css("font-size","22px");
			}
			$("#days15").html(currentCity.split("市")[0]);
			$("#days30").html(currentCity.split("市")[0]);
			$("#weeklyNewspaperSpan").html(currentCity.split("市")[0]);
		}
		
		function switchingCities(){
			window.open("${pageContext.request.contextPath}/weatherinfo/switchCity",'_blank','height=100,width=600,top=200,left=400,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
		}
		
		function changeSytle(div,span,span2){
			$("#"+div).css("background-color","white");
			$("#"+span).css("color","#3399FF");
			$("#"+span2).css("color","#3399FF");
		}
		
		function changeSytle2(div,span,span2){
			$("#"+div).css("background-color","#51A8FF");
			$("#"+span).css("color","white");
			$("#"+span2).css("color","white");
		}
		
	</script>
</head>
<body>

    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
	<div id="showDiv">
		<div style="height:350px;width:410px;float:left;" >
			<div id="city" >
				<div id="cityPhoto" ></div>
				<div id="cityText" >
					<table id="cityTextTable" >
						<tr style="height:62.5px;" >
							<td id="currentCity" style="width:125px;color:white;font-size:35px;text-align:center;" ></td>
							<td style="width:125px;color:white;" ><span style="position:relative;top:10px;" ><a id="cityA" href="javascript:switchingCities();" >[切换城市]</a></span></td>
							<td style="width:125px;" ></td>
						</tr>
						<tr style="height:62.5px;" >
							<td id="tdTime" ></td>
							<td id="tdDay" ></td>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
			<div id="showWeather" >
				<table id="showWeatherTable">
					<tr style="height:130px;" >
						<td style="width:146px;" ><img id="weatherPictures" width="135px" height="120px" src="" /></td>
						<td style="width:186px;" >
							<span id="temperatureSpan" style="font-size:95px;color:white;position:relative;left:10px;" ></span>
							<span style="font-size:30px;color:white;position:relative;left:10px;bottom:50px;" >℃</span>
						</td>
						<td style="width:166px;" >
							<span id="nowTheWeather" style="font-size:35px;color:white;position:relative;bottom:10px;" ></span></br>
							<span style="font-size:20px;color:white;position:relative;top:5px;" ><span id="startTemperatureSpan" ></span> ~ <span id="endTemperatureSpan" ></span>℃</span>
						</td>
					</tr>
					<tr style="height:30px;" >
						<td style="text-align:center;color:white;" >湿度：<span id="humidity" ></span></td>
						<td colspan="2" >
							<span style="color:white;" >风向：<span id="windDirectionAndLevel" ></span></span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="color:white;" >紫外线：正常</span>
						</td>
					</tr>
				</table>
			</div>
			<div id="showPM" >
				<table id="showPMTable">
					<tr style="height:35px;" >
						<td style="width:166px;" rowspan="2" >
							<div id="qualityDiv" style="height:50px;width:160px;margin-left:3px;border-radius:7px;text-align:center;" >
								<span id="qualitySpanStyle" style="font-size:25px;position:relative;top:10px;color:white;" >空气质量：<span id="qualitySpan" ></span></span>
							</div>
						</td>
						<td style="width:166px;" rowspan="2" >
							<div style="width:130px;height:50px;border-radius:7px;border-style:solid;border-width:1px;border-color:white;position:relative;left:20px;text-align:center;" >
								<span style="font-size:22px;color:white;position:relative;top:10px;">PM：<span id="pm25Span" ></span></span>
							</div>
						</td>
						<td style="width:166px;color:white;font-size:18px;" >日出：<span id="sunriseSpan" ></span></td>
					</tr>
					<tr style="height:35px;" >
						<td style="color:white;font-size:18px;" >日落：<span id="sunsetSpan" ></span></td>
					</tr>
				</table>
			</div>
		</div>
		<div style="width:940px;height:380px;float:right;" >
			<div style="height:40px;width:200px;position:relative;left:110px;top:42.5px;" >
				<b><span id="weeklyNewspaperSpan" style="font-size:22px;color:white;" ></span>
				<span id="weeklyNewspaperSpanTo" style="font-size:22px;color:white;" >天气预报一周</span></b>
			</div>
			<a href="javascript:void(0);" style="text-decoration: none;" onmouseover="changeSytle('days15Div','days15','days15To');" onmouseout="changeSytle2('days15Div','days15','days15To');" >
				<div id="days15Div" style="height:40px;width:150px;background-color:#51A8FF;border-radius:7px;position:relative;left:410px;float:left;" >
					<span id="days15" style="font-size:17px;color:white;position:relative;top:9px;left:25px;" ></span>
					<span id="days15To" style="font-size:17px;color:white;position:relative;top:9px;left:21px;" >15天天气</span>
				</div>
			</a>
			<a href="javascript:void(0);" style="text-decoration: none;" onmouseover="changeSytle('days30Div','days30','days30To');" onmouseout="changeSytle2('days30Div','days30','days30To');"  >
				<div id="days30Div" style="height:40px;width:150px;background-color:#51A8FF;border-radius:7px;position:relative;left:570px;" >
					<span id="days30" style="font-size:17px;color:white;position:relative;left:25px;bottom:31px;" ></span>
					<span id="days30To" style="font-size:17px;color:white;position:relative;left:21px;bottom:31px;" >30天天气</span>
				</div>
			</a>
			<div style="height:330px;width:800.5px;background-color:#51A8FF;border-radius:8px;margin-left:92px;margin-top:18px;" >
				<div style="width:114px;height:330px;float:left;" >
					<span id="oneDateSpan" style="font-size:13.5px;color:white;position:relative;top:19px;left:16px;" ></span>
					<span id="oneWeekSpan" style="font-size:13.5px;color:white;position:relative;top:40px;right:36px;" ></span>
					<img id="oneImg" src="" width="60px;" height="60px;" style="position:relative;top:52px;left:16px;" />
					<b><span id="oneWeatherSpan" style="font-size:20px;color:white;position:relative;top:105px;right:31px;" ></span></b>
					<span id="oneHigh" style="font-size:21px;color:#ECF51C;position:relative;top:100px;left:29px;" ></span>
					<span id="oneLow" style="font-size:21px;color:#ECF51C;position:relative;top:166px;right:7px;" ></span>
					<span id="oneWind" style="font-size:13.5px;color:white;position:relative;top:205px;right:43px;" ></span>
				</div>
				<div style="width:114px;height:330px;float:left;" >
					<span id="twoDateSpan" style="font-size:13.5px;color:white;position:relative;top:19px;left:16px;" ></span>
					<span id="twoWeekSpan" style="font-size:13.5px;color:white;position:relative;top:40px;right:36px;" ></span>
					<img id="twoImg" src="" width="60px;" height="60px;" style="position:relative;top:52px;left:16px;" />
					<b><span id="twoWeatherSpan" style="font-size:20px;color:white;position:relative;top:105px;right:31px;" ></span></b>
					<span id="twoHigh" style="font-size:21px;color:#ECF51C;position:relative;top:100px;left:29px;" ></span>
					<span id="twoLow" style="font-size:21px;color:#ECF51C;position:relative;top:166px;right:7px;" ></span>
					<span id="twoWind" style="font-size:13.5px;color:white;position:relative;top:205px;right:43px;" ></span>
				</div>
				<div style="width:114px;height:330px;float:left;" >
					<span id="threeDateSpan" style="font-size:13.5px;color:white;position:relative;top:19px;left:16px;" ></span>
					<span id="threeWeekSpan" style="font-size:13.5px;color:white;position:relative;top:40px;right:36px;" ></span>
					<img id="threeImg" src="" width="60px;" height="60px;" style="position:relative;top:52px;left:16px;" />
					<b><span id="threeWeatherSpan" style="font-size:20px;color:white;position:relative;top:105px;right:31px;" ></span></b>
					<span id="threeHigh" style="font-size:21px;color:#ECF51C;position:relative;top:100px;left:29px;" ></span>
					<span id="threeLow" style="font-size:21px;color:#ECF51C;position:relative;top:166px;right:7px;" ></span>
					<span id="threeWind" style="font-size:13.5px;color:white;position:relative;top:205px;right:43px;" ></span>
				</div>
				<div style="width:114px;height:330px;float:left;" >
					<span id="fourDateSpan" style="font-size:13.5px;color:white;position:relative;top:19px;left:16px;" ></span>
					<span id="fourWeekSpan" style="font-size:13.5px;color:white;position:relative;top:40px;right:36px;" ></span>
					<img id="fourImg" src="" width="60px;" height="60px;" style="position:relative;top:52px;left:16px;" />
					<b><span id="fourWeatherSpan" style="font-size:20px;color:white;position:relative;top:105px;right:31px;" ></span></b>
					<span id="fourHigh" style="font-size:21px;color:#ECF51C;position:relative;top:100px;left:29px;" ></span>
					<span id="fourLow" style="font-size:21px;color:#ECF51C;position:relative;top:166px;right:7px;" ></span>
					<span id="fourWind" style="font-size:13.5px;color:white;position:relative;top:205px;right:43px;" ></span>
				</div>
				<div style="width:114px;height:330px;float:left;" >
					<span id="fiveDateSpan" style="font-size:13.5px;color:white;position:relative;top:19px;left:16px;" ></span>
					<span id="fiveWeekSpan" style="font-size:13.5px;color:white;position:relative;top:40px;right:36px;" ></span>
					<img id="fiveImg" src="" width="60px;" height="60px;" style="position:relative;top:52px;left:16px;" />
					<b><span id="fiveWeatherSpan" style="font-size:20px;color:white;position:relative;top:105px;right:31px;" ></span></b>
					<span id="fiveHigh" style="font-size:21px;color:#ECF51C;position:relative;top:100px;left:29px;" ></span>
					<span id="fiveLow" style="font-size:21px;color:#ECF51C;position:relative;top:166px;right:7px;" ></span>
					<span id="fiveWind" style="font-size:13.5px;color:white;position:relative;top:205px;right:43px;" ></span>
				</div>
				<div style="width:114px;height:330px;float:left;" >
					<span id="sixDateSpan" style="font-size:13.5px;color:white;position:relative;top:19px;left:16px;" ></span>
					<span id="sixWeekSpan" style="font-size:13.5px;color:white;position:relative;top:40px;right:36px;" ></span>
					<img id="sixImg" src="" width="60px;" height="60px;" style="position:relative;top:52px;left:16px;" />
					<b><span id="sixWeatherSpan" style="font-size:20px;color:white;position:relative;top:105px;right:31px;" ></span></b>
					<span id="sixHigh" style="font-size:21px;color:#ECF51C;position:relative;top:100px;left:29px;" ></span>
					<span id="sixLow" style="font-size:21px;color:#ECF51C;position:relative;top:166px;right:7px;" ></span>
					<span id="sixWind" style="font-size:13.5px;color:white;position:relative;top:205px;right:43px;" ></span>
				</div>
				<div style="width:114px;height:330px;float:left;" >
					<span id="sevenDateSpan" style="font-size:13.5px;color:white;position:relative;top:19px;left:16px;" ></span>
					<span id="sevenWeekSpan" style="font-size:13.5px;color:white;position:relative;top:40px;right:36px;" ></span>
					<img id="sevenImg" src="" width="60px;" height="60px;" style="position:relative;top:52px;left:16px;" />
					<b><span id="sevenWeatherSpan" style="font-size:20px;color:white;position:relative;top:105px;right:31px;" ></span></b>
					<span id="sevenHigh" style="font-size:21px;color:#ECF51C;position:relative;top:100px;left:29px;" ></span>
					<span id="sevenLow" style="font-size:21px;color:#ECF51C;position:relative;top:166px;right:7px;" ></span>
					<span id="sevenWind" style="font-size:13.5px;color:white;position:relative;top:205px;right:43px;" ></span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>