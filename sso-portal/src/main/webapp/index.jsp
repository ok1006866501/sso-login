<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>公司内部后台管理系统</title>
		<link href="/asserts/css/bootstrap.min.css" rel="stylesheet">
		<link href="/asserts/css/signin.css" rel="stylesheet">
		<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript">
		$(function(){
			var url = "${requestScope.redirect}";
			$("#submitInput").click(function(){
				var userName = $("#userName").val();
				var password = $("#password").val();
				if(userName === "" || password === ""){
					alert("登录名或密码不能为空");
					return false;
				}
				$.post("${pageContext.request.contextPath}/login",{userName:userName,password:password},function(data){
					if(data.status == 200){
						if(url != "" && url != null){
							window.location.href= url;
						}else{
							window.location.href= "http://localhost:8060/success.jsp";
						}
					}else{
						alert("用户名或密码错误!");
					}
				});
			});
			
		});
		
	</script>
	</head>

	<body class="text-center">
		<form class="form-signin" action="dashboard.html">
			<img class="mb-4" src="asserts/img/bootstrap-solid.svg" alt="" width="72" height="72">
			<h1 class="h3 mb-3 font-weight-normal">请登录</h1>
			<label class="sr-only">登录名</label>
			<input type="text" id="userName" name="userName" class="form-control" placeholder="登录" />
			<label class="sr-only">密码</label>
			<input type="password" id="password" name="password" class="form-control" placeholder="密码" />
			<div class="checkbox mb-3">
				<label>
        </label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" id="submitInput" type="button">登录</button>
			<p class="mt-5 mb-3 text-muted">© 2017-2018</p>
			<a class="btn btn-sm">中文</a>
			<a class="btn btn-sm">English</a>
		</form>

	</body>

</html>