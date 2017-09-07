<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Realtimes</title>
		<!-- Bootstrap CSS CDN -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<!-- Our Custom CSS -->
		<link rel="stylesheet" href="css/realtimes.css">
		<link rel="stylesheet" href="jqcloud/jqcloud.min.css">
	</head>
	<body>
		<div class="wrapper">
            <!-- Sidebar Holder -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <!-- <h3>Realtimes</h3> -->
                    <a href="index.jsp"><img id="realtimes-logo" src="img/realtimes.png"></a>
                </div>

                <ul class="list-unstyled components">
                		<c:choose>
						<c:when test="${sessionScope.login!=null}">
							<li style="text-align:center;"> login as : ${sessionScope.login} </li>
						<ul class="list-unstyled CTAs">
		                    <li><a href="index.jsp" class="logout_button">로그아웃</a></li>
		                </ul>
						</c:when>
						<c:otherwise>
						<ul class="list-unstyled CTAs">
		                    <li><a href="#" data-toggle="modal" data-target="#login-modal">로그인</a></li>
		                </ul>
						</c:otherwise>
					</c:choose>
                    <li>
                        <a href="recommend.jsp">맞춤 뉴스</a>
                    </li>
                    <li>
                        <a href="general.jsp">일반 뉴스</a>
                    </li>
                    <li>
                        <a href="issue.jsp">이슈 모음</a>
                    </li>
                    <li>
                        <a href="#settingsSubmenu" data-toggle="collapse" aria-expanded="false">설정</a>
                        <ul class="collapse list-unstyled" id="settingsSubmenu">
                            <li><a href="#">채널 관리</a></li>
                            <li><a href="#">테마 설정</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">공지사항</a>
                    </li>
                </ul>
            </nav>

            <!-- Page Content Holder -->
            <div id="content">

                <nav class="navbar navbar-default">
                    <div class="container-fluid">

                        <div class="navbar-header">
                            <button type="button" id="sidebarCollapse" class="navbar-btn">
                                <span></span>
                                <span></span>
                                <span></span>
                            </button>
                        </div>

                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="recommend.jsp">맞춤 뉴스</a></li>
                                <li><a href="general.jsp">일반 뉴스</a></li>
                                <li><a href="issue.jsp">이슈 모음</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
				<div class="index_content row">
					<div class="col-md-6">
						<h3>워드 클라우드</h3>
						<div id="word_cloud"></div>
					</div>
					<div class="col-md-6">
						<h3>오늘의 이슈</h3>
						
						<ol class="breadcrumb">
						  <li>분석 대상 뉴스 1091 건</li>
						  <li>뉴스 토픽 150 개</li>
						</ol>
						
						<ul class="index_issue_group list-group">
						  <li class="list-group-item">Dapibus ac facilisis in  <span class="label label-danger">76</span></li>
						  <li class="list-group-item">Cras justo odio  <span class="label label-danger">42</span></li>
						  <li class="list-group-item">Morbi leo risus  <span class="label label-warning">35</span></li>
						  <li class="list-group-item">Porta ac consectetur ac  <span class="label label-warning">30</span></li>
						  <li class="list-group-item">Vestibulum at eros  <span class="label label-default">26</span></li>
						  <li class="list-group-item">Dapibus ac facilisis in  <span class="label label-default">25</span></li>
						  <li class="list-group-item">Cras justo odio  <span class="label label-primary">21</span></li>
						  <li class="list-group-item">Morbi leo risus  <span class="label label-primary">11</span></li>
						</ul>
					</div>
				</div>
                <div class="line"></div>
            </div>
        </div>
        
        <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	  		<div class="modal-dialog">
				<div class="loginmodal-container">
					<h1>Login to Realtimes</h1><br>
				  <form action="member" method="post">
					<input type="text" name="user" placeholder="아이디">
					<input type="password" name="pass" placeholder="비밀번호">
					<!-- <input type="submit" name="login" class="login loginmodal-submit" value="로그인"> -->
					<input name="login" class="login loginmodal-submit login_button" value="로그인">
					<!-- <input type="hidden" name="command" value="login"> -->
				  </form>
					
				  <div class="login-help">
					<a href="#">Register</a> - <a href="#">Forgot Password</a>
				  </div>
				</div>
			</div>
		  </div>
        
        
        <!-- jQuery CDN -->
         <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
         <!-- Bootstrap Js CDN -->
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
         <script src="jqcloud/jqcloud.min.js"></script>

         <script type="text/javascript">
			$(document).ready(function () {				
				// sidebar
				$('#sidebarCollapse').on('click', function () {
					$('#sidebar').toggleClass('active');
					$(this).toggleClass('active');
				});
				// login
				$('.login_button').on('click', function() {
					$.ajax({
						url: "member",
						data: {
							user: $("input[name=user]").val(),
							pass: $("input[name=pass]").val(),
							command: "login"
						},
						method: "post",
						dataType: "json",
						success: function(result) {
							$('#login-modal').modal('hide');
							if (result.result == 0) {
								location.reload();
							} else {
								alert(result.content);	
							}
						}
					})
				});
				// logout
				$('.logout_button').on('click', function() {
					$.ajax({
						url: "member",
						data: {
							command: "logout"
						},
						method: "post",
						dataType: "json"
					})
				});
 
				var words = [
					{text: "Lorem", weight: 13},
					{text: "Ipsum", weight: 10.5},
					{text: "Dolor", weight: 9.4},
					{text: "Sit", weight: 8},
					{text: "Amet", weight: 6.2},
					{text: "Consectetur", weight: 5},
					{text: "Adipiscing", weight: 5},
					{text: "Lorem", weight: 13},
					{text: "Ipsum", weight: 10.5},
					{text: "Dolor", weight: 9.4},
					{text: "Sit", weight: 8},
					{text: "Amet", weight: 6.2},
					{text: "Consectetur", weight: 5},
					{text: "Adipiscing", weight: 5},
					{text: "Lorem", weight: 13},
					{text: "Ipsum", weight: 10.5},
					{text: "Dolor", weight: 9.4},
					{text: "Sit", weight: 8},
					{text: "Amet", weight: 6.2},
					{text: "Consectetur", weight: 5},
					{text: "Adipiscing", weight: 5},
					{text: "Lorem", weight: 13},
					{text: "Ipsum", weight: 10.5},
					{text: "Dolor", weight: 9.4},
					{text: "Sit", weight: 8},
					{text: "Amet", weight: 6.2},
					{text: "Consectetur", weight: 5},
					{text: "Adipiscing", weight: 5},
				];
				
				$('#word_cloud').jQCloud(words, {
				      width: 500,
				      height: 400
				 });
			});
         </script>
	</body>
</html>