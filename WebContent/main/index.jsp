<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
.carousel-inner img {
	width: 100%;
	height: 100%;
}
#menubar2 .navbar-nav li{
	margin-left:50px;
	margin-right:50px;
}
.dropdown:hover>.dropdown-menu {
  display: block;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/boot/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/MDB-Free/css/mdb.min.css">
<script src="/resources/boot/js/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="/resources/boot/js/bootstrap.min.js"></script>
<script src="/resources/MDB-Free/js/mdb.min.js"></script>
<script>
	$(document).ready(function(){
		$('.dropdown-item').hover(function(){
			$(this).addClass('active');
		},function(){
			$(this).removeClass('active');
		});
	});
</script>
<title>이루펜션</title>
</head>
<body>
<div class="container-fulid">
<!--  top navbar start-->
	<div class="navbar navbar-expand-sm bg-dark navbar-dark">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menubar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="menubar">
		<ul class="navbar-nav ml-auto">
			<li class="navbar-item">
				<a class="nav-link" href="#">Home</a>
			</li>
			<li class="navbar-item">
				<a class="nav-link" href="#">Contact Us</a>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle text-primary" data-toggle="dropdown" href="#">Menu</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Join</a>
					<a class="dropdown-item" href="#">Login</a>
				</div>
			</li>
		</ul>
		</div>
	</div>
	<!-- top navbar end -->
	<!-- second navabr start -->
	<div class="navbar navbar-expand-md navbar-dark" style="position:absolute; z-index:10; width:100%; box-shadow: none; ">
		<a class="navbar-brand" href="#">
			<img class="rounded" src="/resources/img/main/logo.png" alt="iru-logo" style="width:137; height:101;">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menubar2" aria-controls="menubar2">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-center" id="menubar2">
		<ul class="navbar-nav">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle text-primary" data-toggle="dropdown" href="#">이루펜션</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">인사말</a>
					<a class="dropdown-item" href="#">오시는 길</a>
				</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle text-primary" data-toggle="dropdown" href="#">객실안내</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">데이지</a>
					<a class="dropdown-item" href="#">릴리</a>
					<a class="dropdown-item" href="#">아이비</a>
					<a class="dropdown-item" href="#">마가렛</a>
				</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle text-primary" data-toggle="dropdown" href="#">예약안내</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">예약종합안내</a>
					<a class="dropdown-item" href="#">실시간예약</a>
				</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle text-primary" data-toggle="dropdown" href="#">주변 관광지</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">대천 해수욕장</a>
					<a class="dropdown-item" href="#">무창포 해수욕장</a>
					<a class="dropdown-item" href="#">어촌 마을체험</a>
					<a class="dropdown-item" href="#">무창포 타워</a>
					<a class="dropdown-item" href="#">바닷길 축제</a>
					<a class="dropdown-item" href="#">대하 전어축제</a>
				</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle text-primary" data-toggle="dropdown" href="#">커뮤니티</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">공지사항</a>
					<a class="dropdown-item" href="#">질문과 답변</a>
				</div>
			</li>
		</ul>
		</div>
	</div>
	<!-- second navbar end -->
	<!-- carousel start -->
	<div id="main_slide" class="carousel slide" data-ride="carousel" data-pause="hovor">
		<ul class="carousel-indicators">
			<li data-target="#main_slide" data-slide-to="0" class="active">
			<li data-target="#main_slide" data-slide-to="1" >
			<li data-target="#main_slide" data-slide-to="2" >
			<li data-target="#main_slide" data-slide-to="3" >
			<li data-target="#main_slide" data-slide-to="4" >
			
		</ul>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/resources/img/main/main_img.jpg">
				<div class="carousel-caption">
					<p class="animated bounce infinite text-dark">이루패션신비의 바닷길과 추억을 무창포 이루펜션에서 만나보실 수 있습니다.
					 <br />고품격의 여유로움속으로 당신을 초대합니다.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/resources/img/main/main_img1.jpg">
				<div class="carousel-caption">
					<p class="animated bounce infinite text-dark">이루패션신비의 바닷길과 추억을 무창포 이루펜션에서 만나보실 수 있습니다.
					 <br />고품격의 여유로움속으로 당신을 초대합니다.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/resources/img/main/main_img2.jpg">
				<div class="carousel-caption">
					<p class="animated bounce infinite text-dark">이루패션신비의 바닷길과 추억을 무창포 이루펜션에서 만나보실 수 있습니다. 
					<br />고품격의 여유로움속으로 당신을 초대합니다.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/resources/img/main/main_img3.jpg">
				<div class="carousel-caption">
					<p class="animated bounce infinite text-dark">이루패션신비의 바닷길과 추억을 무창포 이루펜션에서 만나보실 수 있습니다. 
					<br />고품격의 여유로움속으로 당신을 초대합니다.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/resources/img/main/main_img4.jpg">
				<div class="carousel-caption">
					<p class="animated bounce infinite text-dark">이루패션신비의 바닷길과 추억을 무창포 이루펜션에서 만나보실 수 있습니다.
					<br />고품격의 여유로움속으로 당신을 초대합니다.</p>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#main-slide" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true" style="width:30px; height:40px;"></span>
		</a>
		<a class="carousel-control-next" href="#main-slide" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true" style="width:30px; height:40px;"></span>
		</a>
	</div>
	<!-- carousel end -->
</div>
</body>
</html>