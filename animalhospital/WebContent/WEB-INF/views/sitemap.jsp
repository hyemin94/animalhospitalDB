<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>Insert title here</title>
<meta property=“og:title” content=“동물보호관리시스템” />
<meta property=“og:description” content=“동물보호관리시스템 페이지입니다.” />
<meta property=“og:type” content=“article” />
<meta property=“og:url” content=“https://www.animal.go.kr/front/index.do" />
<meta property=“og:image” content=“https://www.animal.go.kr/front/index.do#" /> -->
<style type="text/css">
.body1 {
	/*
	margin: 0;
	/* height: 129ex; */
	/*display: flex;
	background: linear-gradient(to right bottom, gray, white); */
	/* float: left; */
	padding: 40px;
	margin-left: 60px;
	/* margin-top: 1px; */
}

.body1 h2 {
	padding-bottom: 10px;
}

nav ul {
	list-style-type: none;
	padding: 0;
}

nav ul li {
	font-size: 17px;
	font-family: sans-serif;
	background-color: white;
	border: 2px solid black;
	letter-spacing: 0.1em;
	width: 12em;
	height: 1.5em;
	line-height: 1.5em;
	position: relative;
	overflow: hidden;
	margin: 0.5em;
	cursor: pointer;
}

nav ul li span {
	color: white;
	mix-blend-mode: difference;
}

nav ul li::before {
	content: '';
	position: absolute;
	width: 1.5em;
	height: inherit;
	background-color: black;
	border-radius: 50%;
	top: 0;
	left: -0.75em;
	transition: 0.5s ease-out;
}

nav ul li:hover::before {
	transform: scale(7);
}

form {
	padding-top: 80px;
	padding-left: 20px;
}
.t2 {
	margin-bottom: 5px;
}

.login-container {
	padding-left: 100px;
	margin-top: 5%;
	/* display: flex; */
	align-content: flex-start;
	/* float: left; */
	/* width: 300px;
	height: 300px; */
}
.row {
	
	height: 50%;
	width: 50%;
	float:left;
}

.login-logo {
	position: relative;
	margin-left: -41.5%;
}

.login-logo img {
	position: absolute;
	width: 20%;
	margin-top: 19%;
	background: #282726;
	border-radius: 4.5rem;
	padding: 5%;
}

.login-form-1 {
	padding: 8%;
	margin-top: 0px; 
	background : #282726;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
		rgba(0, 0, 0, 0.19);
	background: #282726;
}

.login-form-1 h6 {
	text-align: left;
	margin-bottom: 10px;
	padding-top: 5px;
	color: #fff;
}

.form-control {
	
}

.btnSubmit {
	font-weight: 600;
	width: 50%;
	color: #282726;
	background-color: #fff;
	border: none;
	border-radius: 1.5rem;
	padding: 2%;
}

.btnForgetPwd {
	color: #fff;
	font-weight: 600;
	text-decoration: none;
}

.btnForgetPwd:hover {
	text-decoration: none;
	color: #fff;
}

.boardcontainer {
	margin-top: 80px;

}

.board {
	margin-top: 40px;
}

#date {
	margin-bottom: 6px;
}
</style>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="/animalhospital/resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#1")
								.on(
										"click",
										function() {
											location.href = "https://www.animal.go.kr/front/index.do"
										});
						$("#2")
								.on(
										"click",
										function() {
											location.href = "http://www.kaha.or.kr/page/index.php"
										});
						$("#3").on("click", function() {
							location.href = "http://anipharm.net/"
						});
						$
								.ajax({
									url : '/animalhospital/sitemap/show',
									data : {},
									type : 'post',
									dataType : 'json',
									success : function(list) {
										$("#board").empty();
										for (var i = 0; i < list.length; i++) {
											var board = "<tr><td hidden='hidden'>"
													+ i
													+ "</td><td>"
													+ list[i].date
													+ "</td><td>"
													+ list[i].title
													+ "</td><td>"
													+ list[i].text
													+ "</td><td><button  class='del'>삭제</button></td></tr>";
											$("#board").append(board);
										}
									}
								});
						$("#calbtn")
								.on(
										"click",
										function() {
											$
													.ajax({
														url : '/animalhospital/sitemap/insert',
														data : {
															'date' : $("#date")
																	.val(),
															'title' : $(
																	"#title")
																	.val(),
															'text' : $("#text")
																	.val()
														},
														type : 'post',
														dataType : 'json',
														success : function(list) {
															$("#board").empty();
															for (var i = 0; i < list.length; i++) {
																var board = "<tr><td hidden='hidden'>"
																		+ i
																		+ "</td><td>"
																		+ list[i].date
																		+ "</td><td>"
																		+ list[i].title
																		+ "</td><td>"
																		+ list[i].text
																		+ "</td><td><button  class='del'>삭제</button></td></tr>";
																$("#board")
																		.append(
																				board);
															}
														}
													});
										});
						$("#board")
								.on(
										"click",
										$(".del"),
										function(e) {
											var seq = $(e.target).parent()
													.prev().prev().prev()
													.prev().html();
											$
													.ajax({
														url : '/animalhospital/sitemap/delete',
														data : {
															'seq' : seq
														},
														type : 'post',
														dataType : 'json',
														success : function(list) {
															$("#board").empty();
															for (var i = 0; i < list.length; i++) {
																var board = "<tr><td hidden='hidden'>"
																		+ i
																		+ "</td><td>"
																		+ list[i].date
																		+ "</td><td>"
																		+ list[i].title
																		+ "</td><td>"
																		+ list[i].text
																		+ "</td><td><button  class='del'>삭제</button></td></tr>";
																$("#board")
																		.append(
																				board);
															}
														}
													});
										});
					})
</script>
</head>
<body>

	<jsp:include page="buttons.jsp"></jsp:include>
	<jsp:include page="menu.jsp"></jsp:include>
	<%-- <div class="body2" align="center">
		<jsp:include page="login.jsp"></jsp:include>

</div> --%>
	<!-- <div class="body1" style="width:27%"> -->


	<div class="body1">
		<aside>
			<%-- <%
		if(session.getAttribute("loginid")==null){ 	
	%>
		<jsp:include page="login.jsp"></jsp:include>
		<jsp:include page="member.jsp"></jsp:include> 
	<% 
		}else{
	%>
		<jsp:include page="insertmember.jsp"></jsp:include> 
	 	<jsp:include page="logout.jsp"></jsp:include>
	<% 	
		}
	%> --%>
			
			<div class="login-container">
			<div class="t2" style="height:50px; width:500px; float:left"> <h2>일정관리</h2> </div>
			<div class="t2" style="height:50px; width:500px; float:left"> <h2>일정 리스트</h2> </div>
			
				<div class="row">
					<!-- 			<div class="col-md-6 login-form-1"> -->
					<div class="login-form-1">
							<h6>날짜선택</h6>
							<input type="date" id="date" name="date"><br> 
							
							<h6>제목</h6>
							<div class="form-group">
								<input type="text" id="title" class="form-control"
									placeholder="제목을 입력해주세요. " value="" />
							</div>
							
							<h6>내용</h6>
							<div class="form-group">
								<textarea id="text" class="form-control" rows="5" cols="25"
									placeholder="내용을 입력해주세요. " value=""></textarea>
							</div>
							<div class="form-group">
								<input type="button" id="calbtn" value="일정추가" />
							</div>
					</div>
				</div>
				
				
				<div id="addedtext" style="height:500px; width:500px; float:left">
					
					<table id="board">

			</table>
				</div>
			


			<!-- <input type="date" id="date" name="date"><br> <input
				type="text" id="title" name="title"><br>
			<textarea id="text" rows="5" cols="25"></textarea>
			<br> <input id="in" type="button" value="등록"><br> -->

			<div class="boardcontainer" style="clear:both;">

			<hr>
			<div class="board">
				<h2>외부사이트 맵</h2>
				
				<!-- <div class="urlimg">
				
					<img src="/resources/img1.png" alt="img1.png" style="width:480px;height:480px;">
				</div> -->
				<nav>
					<ul>
						<li id="1"><span>동물보호관리시스템</span></li>
						<li id="2"><span>동물보호협회</span></li>
						<li id="3"><span>동물약국협회</span></li>
					</ul>
				</nav>
			</div>
</div>
		</aside>

	</div>
	</div>
</body>
</html>
