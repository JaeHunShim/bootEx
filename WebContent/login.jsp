<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/bootStrap/css/bootstrap.min.css">
<script src="/bootStrap/js/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="/bootStrap/js/bootstrap.min.js"></script>
<title>JSP 계시판 웹사이트</title>
<% String userID = (String)session.getAttribute("userID"); 
	System.out.println(userID);
	String userChar = (String)session.getAttribute("userChar");
	System.out.println("jsp session" + userChar);
%>
</head>
<body>
<nav class="navbar navbar-defoult">
<div class="navbar-header">
<button type="button" class= "navbar-toggle"
data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
aria-expanded="false">
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class ="navar-brand" href="main.jsp">JSP 계시판 웹사이트</a>
</div>
<div class="navar-collapse" id ="bs-example-navbar-collapse-1">
<ul class= "nav navbar-nav">
<li><a href="main.jsp">메인</a></li>
<li><a href="bbs.jsp">게시판</a></li>
</ul>
<ul class= "nav navbar-nav navbar-right">
<li class="dropdown">
<a href="#" class="dropdown-toggle"
data-toggle="dropdown"role="button" aria-haspopup="true"
aria-exparded="false">접속하기<span class="caret"></span></a>
<ul class = "dropdown-menu">
<li class="active"><a href="login.jsp">로그인</a></li>
<li><a href="join.jsp">회원가입</a></li>

</ul>
</li>
</ul>
</div>
</nav>
<div class="container"></div>
<div class="col-lg-4"></div>
<div class="col-lg-4"></div>
<div class="jumbotron" style="padding-top: 20px;">
<form method= "post" action="loginAction.jsp">
<h3 style="text-align: center;">로그인 화면</h3>
<div class = "form-group">
<input type="text" class= "form-control" placeholder="아이디" name="userID"maxlength="20">
</div>
<div class = "form-group">
<input type="password" class= "form-control" placeholder="비밀번호" name="userPassword"maxlength="20">
</div><input type="submit" class="btn btn-primary form-control" value="로그인">
</form>
</div>
<div class="col-lg-4"></div>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
