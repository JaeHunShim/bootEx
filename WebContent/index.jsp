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
	var request = new XMLHttpRequest();
	function searchFunction(){
		request.open("Post","./UserSearchServlet?userName="+encodeURIComponent(document.getElementById("userName").value),true);
		
		request.onreadystatechange = searchProcess;
		request.send(null);
	}
	function searchProcess(){
		var table = document.getElementById("ajaxTable");
		table.innerHTML="";
		if(request.readyState == 4 && request.status ==200){
			var object = eval('('+request.responseText+')');
			var result = object.result;
			
			for(var i = 0;  i<result.length; i++){
				
				var row  = table.insertRow(0);
				for(var j=0; j<result[i].length; j++){
					var cell = row.insertCell(j);
					cell.innerHTML = result[i][j].value;
				}
			}
		}
	}
</script>
</head>
<body>
	<div class="container">
		<div class="form-group row pull-right">
			<div class="col-xs-8">
				<input class="form-control" id="userName" type="text" size=20 onkeyup="searchFunction()">
			</div>
			<div class="col-xs-2">
				<button class="btn btn-primary" type="button" onclick ="searchFunction();">Search</button>
			</div>
		</div>
		<table class="table" style="text-align:center; border:1px solid #dddddd">
			<thead>
				<tr>
					<th>이름</th>
					<th>나이</th>
					<th>성별</th>
					<th>아이디</th>
				</tr>
			</thead>
			<tbody id="ajaxTable">

			</tbody>
		</table>
	</div>
</body>
</html>