<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<script src="/animalhospital/resources/jquery-3.2.1.min.js"></script>
<script >
$(document).ready(function() {
	$("#login").on("click", function() {
		location.href="/animalhospital/login"
	});
	$("#logout").on("click", function() {
		location.href="/animalhospital/logout"
	});
	$("#hos").on("click", function() {
		location.href="/animalhospital/menu/hospital"
	});
	$("#pha").on("click", function() {
		location.href="/animalhospital/menu/pharmacy"
	});
	$("#sic").on("click", function() {
		location.href="/animalhospital/menu/sick"
	});
	$("#map").on("click", function() {
		location.href="/animalhospital/menu/sitemap"
	});
})
</script>
	<style type="text/css">
	* {
	margin: 0;
	padding: 0;
	list-style-type: none;
}
body{
	background: #1E1F25;
}
ul{
	display: flex;
	width: 100%;
	height: 80vh;
	margin: auto;
	max-width: 1000px;
	justify-content: space-between;
	text-align: center;
}
li {
	padding: 1rem 2rem 1.15rem;
  text-transform: uppercase;
  cursor: pointer;
  color: #ebebeb;
	min-width: 80px;
	margin: auto;
}

li:hover {
  background-image: url('https://scottyzen.sirv.com/Images/v/button.png');
  background-size: 100% 100%;
  color: #27262c;
  animation: spring 300ms ease-out;
  text-shadow: 0 -1px 0 #ef816c;
	font-weight: bold;
}
li:active {
  transform: translateY(4px);
}

@keyframes spring {
  15% {
    -webkit-transform-origin: center center;
    -webkit-transform: scale(1.2, 1.1);
  }
  40% {
    -webkit-transform-origin: center center;
    -webkit-transform: scale(0.95, 0.95);
  }
  75% {
    -webkit-transform-origin: center center;
    -webkit-transform: scale(1.05, 1);
  }
  100% {
    -webkit-transform-origin: center center;
    -webkit-transform: scale(1, 1);
  }
}

.shameless-plug{
  position: absolute;
  bottom: 10px;
  right: 0;
  padding: 8px 20px;
  color: #ccc;
  text-decoration: none;
}
	</style>
</head>
<body>
<%if(session.getAttribute("loginid")!=null) {	
	%>
		<h1 style="color: white;text-align: center;">${sessionScope.loginid}님 환영합니다.</h1>
	<%
	}%>
<ul>
	<%if(session.getAttribute("loginid")==null) {	
	%>
		<li id="login">login/signin</li>
	<%
	}else{%>
		<li id="logout">logout</li>
	<%
	}
	%>
	<li id="hos">Hospital</li>
	<li id="pha">Pharmacy</li>
	<li id="sic">Sick</li>
	<li id="map">SiteMap</li>
</ul>
</body>
</html>
