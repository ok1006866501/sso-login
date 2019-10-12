<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
	<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="/js/jquery.cookie.js" ></script>
</head>
<script type="text/javascript">
	var loginKey = $.cookie("TT_TOKEN");
	function outLogin(){
		$.ajax({
			url:"http://localhost:8060/outLogin/"+loginKey,
			dataType:"jsonp",
			type:"GET",
			success:function(data){
				if(data.status == 200){
					$("#showDiv").empty().append("<a href='http://localhost:8060/index' >登录</a>");
				}
			}
		});
	}
	$(function(){
		if(loginKey != null){
			$.ajax({
				url:"http://localhost:8060/checkLogin/"+loginKey,
				dataType:"jsonp",
				type:"GET",
				success:function(data){
					if(data.status == 200){
						$("#showDiv").empty().append(data.emp.empName+" 欢迎您登录<a href='javascript:outLogin();' >退出登录</a>");
					}else{
						$("#showDiv").empty().append("<a href='http://localhost:8060/index' >登录</a>");
					}
				}
			});
		}
	});
</script>
<body>
	<div id="showDiv" ><a href='http://localhost:8060/index' >登录</a></div>
</body>
</html>