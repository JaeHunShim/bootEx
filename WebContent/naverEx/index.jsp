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
<title>Insert title here</title>
<script>
var searchRequest = new XMLHttpRequest();
var registerRequest = new XMLHttpRequest();
function searchFunction(){
	searchRequest.open("post" , "./UserSearchServlet?userChar=" +encodeURIComponent(document.getElementById("userChar").value),true);
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
function registerFunction(){ 
	registerRequest.open("post" , "./UserRegisterServlet?userChar=" +encodeURIComponent(document.getElementById("registerChar").value) +
			    "&userID="  +encodeURIComponent(document.getElementById("registerID").value) +
			    "&userGender="  + encodeURIComponent($('input[name=registerGender]:checked').val()) +
			    "&userEmail="  +encodeURIComponent(document.getElementById("registerEmail").value)
			     
			    ,true);
	registerRequest.onreadystatechange = registerProcess; 
	registerRequest.send(null);
	
}
function registerProcess(){
	if(registerRequest.readyState == 4 && registerRequest.status == 200){
		var result = registerRequest.responseText;
		if(result !=1){
			alert("등록에 실패했습니다.");
		}
		else{
			var userChar = document.getElementById("userChar");
			var registerChar = document.getElementById(" registerChar");
			var registerId = document.getElementById("registerId");
			var registerEmail = document.getElementById("registerEmail");
		userChar.value = "";
		registerChar.value = "";
		registerId.value = "";
		registerEmail.value = "";
		searchFuncition();
		}
	}
	
}
	window.onload = function(){
searchFunction();		
	}
</script>
</head>
<body>
	<div class = "container">
<div class= "form-group row pull-right">
<div class= "col-xs-8">
<input class= "form-control" id = "userChar" onkeyup="searchFunction()" type="text" size = "20">
</div>
<div class= "col-xs-2">
<button class = "btn btn-primary" onclick="searchFunction();"type= "button">검색</button>
</div>
</div>
<table class = "table" style="text-align: center; border: 1px solid #dddddd">
<thead>
<tr>
<th style= "background-color: #fafafa; text-align:center;">별명</th>
<th style= "background-color: #fafafa; text-align:center;">아이디</th>
<th style= "background-color: #fafafa; text-align:center;">성별</th>
<th style= "background-color: #fafafa; text-align:center;">이메일</th>
</tr>
</thead>
<tbody id= "ajaxTable">
</tbody>
</table>
</div>
<div class= "container">
<table class= "table" style = "text-align: center; border : 1px solid #dddddd">
<thead>
<tr>
<th colspan="2" style= "background-color: #fafafa; text-align:center;">회원등록 양식</th>
</tr>
</thead>
<tbody>
<tr>
<td style="background-color : #fafafa; text-align:center;"><h5>별명</h5></td>
<td><input class="form-cantrol" type="text" id="registerChar" size="20"></td>
</tr>
<tr>
<td style="background-color : #fafafa; text-align:center;"><h5>아이디</h5></td>
<td><input class="form-cantrol" type="text" id="registerID" size="20"></td>
</tr>
<tr>
<td style="background-color : #fafafa; text-align:center;"><h5>성별</h5></td>
<td>
<div class="form-group" style="text-align: center; margin : 0 auto;">
<div class= "btn-group" data-toggle="buttons">
<label class="btn btn-primary active">
<input type= "radio" name="registerGender" autocomplete="off" value="남자" checked>남자
</label>
<label class="btn btn-primary">
<input type= "radio" name="registerGender" autocomplete="off" value="여자" >여자
</label>
</div>
</div>
</td>
</tr>
<tr>
<td style="background-color : #fafafa; text-align:center;"><h5>이메일</h5></td>
<td><input class="form-cantrol" type="text" id="registerEmail" size="20"></td>
</tr>
<tr>
<td colspan= "2"><button class= "btn btn-primary pull-right" onclick= "registerFunction();" type = "button">등록</button ></td>
</tr>
</tbody>
</table>
</div>  
</body>
</html>