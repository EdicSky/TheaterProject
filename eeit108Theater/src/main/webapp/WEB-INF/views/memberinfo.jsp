<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<title>716影城 - 會員資訊</title>
<meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
	

<noscript>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>  

<script type="text/javascript">
	$(document).ready(function() {         
		$("#button1").click(function() { 
		$("#memberInfo").show(); 
		$("#memberEdit").hide();
		$("#memberChat").hide();
		});

		$("#button2").click(function() { 
		$("#memberEdit").show(); 
		$("#memberInfo").hide(); 
		$("#memberChat").hide();
		});
		
		$("#button3").click(function() { 
		$("#memberChat").show(); 
		$("#memberInfo").hide();
		$("#memberEdit").hide();
		});
	});
</script>

<style>
	.pclr{color:#ad8c80;
	}
	
	
</style>

</head>
<body class="left-sidebar is-preload">
	<div id="page-wrapper">
		<div id="header1">
			<!-- Header -->
			<jsp:include page="header.jsp" />
		</div>
		<!-- Main -->
		<div class="wrapper style1">

			<div class="container">
				<div class="row gtr-200">
					<div class="col-4 col-12-mobile" id="sidebar">
						<hr class="first" />
						
						<h3><a href="#" id="button1">會員資訊</a></h3>
						
						<p class="pclr">${LoginOK.name}您好</p>
						<div class="row gtr-50">
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/memberinfo.png" alt="" /></a>
							</div>
							<div class="col-8">
								<p>
								<h4>基本資料</h4>
								<p class="pclr" id="button2"><a href="#">個人資訊修改</a></p>
							</div>
							

							
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/record.png" alt="" /></a>
							</div>							
							<div class="col-8">
								<p>
								<h4>訂單查詢</h4>
								<p class="pclr"><a href="<c:url value='/visitorticket'/>">會員購票資訊</a></p>
							</div>
							
							<div class="col-4">
								<a href="#" class="image fit"><img src="images/frontend/support.png" alt="" /></a>
							</div>
							<div class="col-8">
								<p>
								<h4>客服中心</h4>
								<p class="pclr" id=button3><a href="#">聯繫客服</a></p>
							</div>
							
							
							
						</div>
						
					</div>
					
					
					<div class="col-8 col-12-mobile imp-mobile" id="content">
<!-- 				---------------------------------------------------------	 -->
						
					<div id="memberInfo">
					<article id="main"> 
						
						<header>
						 <h3><a href="#">◎ 個人資訊</a></h3>
						    <br>
						    		<p>會員名稱：${LoginOK.name}</p>
								    <p>註冊時間：<fmt:formatDate pattern="yyyy-MM-dd" value="${LoginOK.registerTime}" /></p>
								    
						
						</header> 
						
				<c:choose>
					 <c:when test="${empty LoginOK.memberImage}">

					<c:choose>
						<c:when test="${empty LoginOK.googleUrl}">
						<img  src="<c:url value='/images/frontend/loginicon.png' />" width="400px" ></c:when>
						<c:when test="${!empty LoginOK.googleUrl}">
						<img id="prfilePic" src="${LoginOK.googleUrl}"  width="400px"></c:when>
					</c:choose>
				
					</c:when>
				
					<c:when test="${!empty LoginOK.memberImage}">

					<img id="prfilePic" src="<c:url value='/getMemberPicture/${LoginOK.no}'/>" width="400px">
					</c:when>
				</c:choose>	
						
						<section> 
						<header>
						  <h3>關於我:</h3>
						</header>
						    <p>${LoginOK.aboutMe}</p>
						
						</section> 
						

							</article>
						</div>


<!-- 			    ---------------------------------------------------------- -->
						<div id="memberEdit" style="display:none">
							<article id="main"> 
								<header><h3><a href="#">◎ 會員資料修改</a></h3></header> 
							<section> 
								<form:form method='POST' modelAttribute="memberBean" action="memberUpdateX" enctype="multipart/form-data">							                                                                           
								${error}
								<form:input id="no" path="no" class="text" type="hidden"
									value="${LoginOK.no}" />     
							<dl>
							<dd>
								<label for="email" style="text-align:left">電子信箱：</label>
								<input id="email"  class="text"
									type="text" value="${LoginOK.email}" tabindex="2" readonly="readonly"
									autocomplete="off" maxlength="50" />
							</dl>
							<dl>
							<dd>
								<label for="name" style="text-align:left">*您的姓名：</label>
								<form:input id="name" path="name" class="text" type="text"
									value="${LoginOK.name}" tabindex="1" autocomplete="off"
									maxlength="50"  />     
							</dl>
							
							<dl>
							<dd>
<!-- 								<label for="email" style="text-align:left">電子信箱：</label> -->
								<form:input id="email" path="email" class="text"
									type="hidden" value="${LoginOK.email}" tabindex="2" readonly="readonly"
									autocomplete="off" maxlength="50" />
							</dl>
							
							<dl>
							<dd>
								<label for="phoneNum" style="text-align:left">*行動電話：</label>
								<form:input id="phoneNum" path="phoneNum" class="text"
									type="text" value="${LoginOK.phoneNum}" tabindex="2"
									autocomplete="off" maxlength="50" />
							</dl>
														
<!-- 							<dl> -->
<!-- 							<dd> -->
<!-- 								<label for="password" style="text-align:left">*密碼：</label> -->
								<form:input id="password"  path="password" class="text"
									type="hidden" value="${LoginOK.password}" tabindex="2" 
									autocomplete="off" maxlength="50" /> 
<!-- 							</dl> -->

							<dl>
							<dd>
<!-- 								<label for="memberId" style="text-align:left">*身分證字號：</label> -->
								<form:input id="memberId" path="memberId" class="text"
									type="hidden"  value="${LoginOK.memberId}" tabindex="2"
									autocomplete="off" maxlength="50" />
							</dl>

							<dl>
							<dd>
								<label for="gender" style="text-align:left">*性別：</label>
								<form:select  id="gender"   required="required" path="gender">
        	                    <form:option value="1" selected="selected">男</form:option>
					            <form:option value="2" >女</form:option>
                	            </form:select>							
							</dl>
							<dl>
							<dd>

							<label for="aboutMe" style="text-align:left">關於我：</label>
							
                             <form:input type="text" id="aboutMe" class="form-control" 
                               value="${LoginOK.aboutMe}" path="aboutMe"/> 
							
							</dl>
							
							<dl>
							<dd>
								<label for="uploadImage" style="text-align:left">上傳照片：</label>							
<%--                             	<img src="${pageContext.request.contextPath}/getMemberPicture/${LoginOK.no}"   width="250"> --%>
                     <c:choose>
                     	<c:when test="${!empty LoginOK.memberImage}">
						<img id="prfilePic" src="<c:url value='/getMemberPicture/${LoginOK.no}'/>" width="250">
						</c:when>
						<c:when test="${empty LoginOK.googleUrl}">
						<img  src="<c:url value='/images/frontend/loginicon.png' />" width="250" ></c:when>
						<c:when test="${!empty LoginOK.googleUrl}">
						<img id="prfilePic" src="${LoginOK.googleUrl}"  width="400px"></c:when>
					</c:choose>
                            	
                            	<br><form:input type="file" id="uploadImage" class="form-control" 
                                	path="uploadImage"/> 							
							</dl>									

							<dl>
							<dd>
								<a><form:button  type="submit" 
									style="font-size: 20px; width: 450px; height: 60px;">送出</form:button></a>
							</dd>
							</dl>
<!-- 								<input id="type" name="form" type='hidden' value='true' /> -->
							</form:form>						
						</section> 					
						</article>
					</div>
<!-- 			    ---------------------------------------------------------- -->
					<div id="memberChat" style="display:none">
							<article id="main"> 						
								<h3><a href="#">◎ 即時客服</a></h3>
								<br>
						    		<p>會員名稱：${LoginOK.name}</p>
								    
						   
						   
						    
						    <div id="websocketdiv">
						   
								<textarea id="area" class="form-control rounded-0" style="font-size: 20px; font-family: '微軟正黑體';
								 margin-top:10px;" readonly="readonly" rows="10" cols="50"></textarea>
								<input class="form-control rounded-0" style="font-size: 20px; font-family: '微軟正黑體';
								 margin:10px;" type="text" id="text" size=50%  />
<!-- 								<input id="sendmsg" type="button" value="送出" size=40% /> -->
								<div class="text-center col-md-12 mt-3 mb-2">			
								<button type="button" id="sendmsg" class="btn btn-success btn-block btn-rounded z-depth-1">送出</button>
							     </div>
							</div>
							
							
						
							</article>
							

						</div>


<!-- 			    ---------------------------------------------------------- -->
					</div>
				
				
 				
 				
				
			</div>

		</div>
</div>
</div>
		<!-- Footer -->
		<jsp:include page="footer.jsp" />

		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.dropotron.min.js"></script>
		<script src="assets/js/jquery.scrolly.min.js"></script>
		<script src="assets/js/jquery.scrollex.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>



	<script>
		var websocket = new WebSocket("ws://" + location.host
				+ "/eeit108Theater/websocket.do");

		websocket.onopen = function processOpen() {
		};

		websocket.onmessage = function(message) {
			var jsonData = JSON.parse(message.data);
			if (jsonData.message != null) {
				area.value += jsonData.message + "\n";
			}
		};

		websocket.onclose = function (evt) {
	        websocket.close();
	    };
	    
		websocket.onerror = function(evt) {
			websocket.close();
		};

		$(function() {
			$('#sendmsg').click(function() {
				websocket.send(text.value);
				text.value = "";
			});
		});
	</script>

</body>
</html>