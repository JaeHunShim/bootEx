<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %> 
      <%@ page import="bbs.BbsDAO" %> 
        <%@ page import="bbs.Bbs" %> 
          <%@ page import="java.util.ArrayList" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/bootStrap/css/bootstrap.min.css">
<script src="/bootStrap/js/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="/bootStrap/js/bootstrap.min.js"></script>
<script type = "text/javascript">
var searchRequest = new XMLHttpRequest();
function searchFunction(){
 searchRequest.open("post" , "./BbsSearchServlet?bbsContent=" +encodeURIComponent(document.getElementById("bbsContent").value),true);
 searchRequest.onreadystatechange = searchProcess;
 searchRequest.send(null);
}
function searchProcess(){
 var table = document.getElementById("ajaxTable");
 table.innerHTML = "";
 if(searchRequest.readyState == 4 && searchRequest.status == 200){
  var object = eval('(' + searchRequest.responseText +')');
var result = object.result;
for(var i =0; i< result.length; i++){
 var row = table.insertRow(0);
 for(var j = 0; j < result[i].length; j++){
  var cell = row.insertCell(j);
  cell.innerHTML = result[i][j].value;
}
}
}
}
window.onload = function(){
searchFunction();  
 }
 </script>
 <style type = "text/css">
a, a:hover{
color: #000000;
text-decoration : none;
}
</style>
</head>

<body>
<%
String userID = null;
if (session.getAttribute("userID") !=null){
 userID = (String) session.getAttribute("userID");
}
int pageNumber = 1;
if (request.getParameter("PageNumber") != null){
 pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}
%>
<nav class="navbar navbar-defoult">
<div class="navbar-header">
<button type="button" class= "navbar-toggle"
data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
aria-expanded="false">
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class ="navbar-brand" href="main.jsp">JSP 계시판 웹사이트</a>
</div>
<div class="navar-collapse" id ="bs-example-navbar-collapse-1">
<ul class= "nav navbar-nav">
<li ><a href="main.jsp">메인</a></li>
<li><a href="bbs.jsp">게시판</a></li>
</ul>
<%
if(userID == null){

%>
<ul class= "nav navbar-nav navbar-right">
 <li class="dropdown">
 <a href="#" class="dropdown-toggle"
 data-toggle="dropdown"role="button" aria-haspopup="true"
 aria-exparded="false">접속하기<span class="caret"></span></a>
 <ul class = "dropdown-menu">
 <li><a href="login.jsp">로그인</a></li>
 <li><a href="join.jsp">회원가입</a></li>
 </ul>
 </li>
 </ul>
 <%
         } else {
 %>
<ul class= "nav navbar-nav navbar-right">
 <li class="dropdown">
 <a href="#" class="dropdown-toggle"
 data-toggle="dropdown"role="button" aria-haspopup="true"
 aria-exparded="false">회원관리<span class="caret"></span></a>
 <ul class = "dropdown-menu">
 <li><a href="logoutAction.jsp">로그아웃</a></li>
 </ul>
 </li>
 </ul>
 <%
 }
 %>
</div>
</nav>
<div class = "container">
<div class= "form-group row pull-right">
<div class= "col-xs-8">
<input class= "form-control" id = "bbsContent" onkeyup="searchFunction()" type="text" size = "20">
</div>
<div class= "col-xs-2">
<button class = "btn btn-primary" onclick="searchFunction();"type= "button">검색</button>
</div>
</div>
<div class= "row">
<table class = "table table -striped" style= "text-align: center; border: 1px solid #dddddd">
<thead>
<tr>
<th style = "backred-color: #aaaaaa; text-align: center;">펀트</th>
<th style = "backred-color: #aaaaaa; text-align: center;">제목</th>
<th style = "backgred-color: #aaaaaa; text-align: center;">작성자</th>
<th style = "backgred-color: #aaaaaa; text-align: center;">작성일</th>
</tr>
</thead>
<tbody id= "ajaxTable">
</tbody>
<tbody>
<%
BbsDAO bbsDAO = new BbsDAO();
%>
</table>

<%
if(pageNumber != 1){
%>
<a href= "bbs.jsp?pageNumber=<%=pageNumber -1%>" class= "btn btn-success btn-arraw-Left">이전</a>">
<%
}if(bbsDAO.nextPage(pageNumber +1)){
%>
<a href= "bbs.jsp?pageNumber=<%=pageNumber +1%>" class= "btn btn-success btn-arraw-Left">다음</a>">
<%
}
%>
<a href = "write.jsp" class="btn  btn-primary puil-right">글쓰기</a>


</div>
</div>

</body>
</html>
