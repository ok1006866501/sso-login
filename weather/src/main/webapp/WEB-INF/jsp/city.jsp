<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>选择城市</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<style type="text/css">
		#one{
			color:black;
			text-decoration: none;
		}
		#two{
			color:black;
			text-decoration: none;
		}
		#three{
			color:black;
			text-decoration: none;
		}
		#four{
			color:black;
			text-decoration: none;
		}
	</style>
	<script type="text/javascript" >
		$(function(){
			$.post("${pageContext.request.contextPath}/weatherinfo/province",function(data){
				var $province = $("#provinceSelect");
				for(var i = 0;i < data.length;i++){
					$province.append("<option value='"+data[i].areaid+"' >"+data[i].areaname+"</option>");
				}
				$("#citySelect").append("<option value='101010100'>北京</option>");
			});	
		});
		
		function switchProvince(province){
			var $citySelect = $("#citySelect");
			$citySelect.empty();
			if(province.value == 110000){//北京
				$citySelect.append("<option value='101010100'>北京</option>");
				return false;
			}else if(province.value == 120000){//天津
				$citySelect.append("<option value='101030100'>天津</option>");
				return false;
			}else if(province.value == 310000){//上海
				$citySelect.append("<option value='101020100'>上海</option>");
				return false;
			}else if(province.value == 500000){//重庆
				$citySelect.append("<option value='101040100'>重庆</option>");
				return false;
			}
			var id = province.value;
			$.post("${pageContext.request.contextPath}/weatherinfo/city",{provinceId:id},function(data){
				var $city = $("#citySelect");
				for(var i = 0;i < data.length;i++){
					$city.append("<option value='"+data[i].weathercode+"' >"+data[i].areaname+"</option>");
				}
			});	
		}
		
		function sure(cityA){
			var provinceSelect = document.getElementById("provinceSelect");
			var options = provinceSelect.options;
			var city = cityA.innerHTML;
			for(var i = 0;i < options.length;i++){
				if(options[i].innerHTML === city){
					options[i].selected = "selected";
					switchProvince(provinceSelect);
					return false;
				}
			}
		}
		
		function switchOk(){
			var citySelect = document.getElementById("citySelect");
			var cityId = citySelect.value;
			window.opener.weatherInfo(cityId);
			window.close();
		}
		
	</script>
</head>
<body style="background-color:#3399FF" >

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
	<div style="width:400px;margin-left:170px;" >
		<span style="font-size:20px;color:white;" >热门城市:</span>
		<span style="font-size:20px;" >
			<a id="one" href="javascript:void(0)" onclick="sure(this);" >北京</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a id="two" href="javascript:void(0);" onclick="sure(this);" >天津</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a id="three" href="javascript:void(0);" onclick="sure(this);" >上海</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a id="four" href="javascript:void(0);" onclick="sure(this);" >重庆</a>
		</span>
	</div>
	<div style="width:600px;margin-left:120px;margin-top:20px;" >
		<select id="provinceSelect" onchange="switchProvince(this);" style="width:200px;float:left;" class="form-control">
		</select>
		<select id="citySelect" style="width:200px;float:left;" class="form-control">
		</select>
	</div>
	<div>
		<button type="button" onclick="switchOk();" class="btn btn-success">确定</button>
	</div>
</body>
</html>