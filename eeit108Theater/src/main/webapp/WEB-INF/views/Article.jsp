<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>Article</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/jquery-ui.css" />

<noscript>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/noscript.css" />
</noscript>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous">
	
</script>
<style type="text/css">
.tb1 {
	text-align: center;
}
</style>
</head>
</head>
<body class="left-sidebar is-preload">
	<div id="page-wrapper">
		<div id="header">
			<!-- Header -->
			<jsp:include page="header.jsp" />
		</div>

		<div class="wrapper style1">
			<div class="container">
				<article id="main" class="special">
					<div class="row"
						style="width: 1300px; height: auto; border: 1px solid gray; border-radius: 25px;">
						<h3 style="font-size: 36px">${Article.title}</h3>
						<div>
							<p
								style="width: auto; height: 50px; border: 1px solid gray; border-radius: 25px; text-align: center; font-size: 20px;padding-top: 1px; padding-left: 20px; padding-right: 20px">
								發文者: ${Article.author.name} 分類: ${Article.tag} 發文時間:
								${Article.postTime}</p>
						</div>
						<br>
						<pre
							style="font-size: 30px; white-space: pre-wrap; margin-bottom: 20px">${Article.content}</pre>

					</div>
					<p>
						<c:choose>
							<c:when test="${LoginOK.no==Article.author.no}">
								<a href="<spring:url value='/edit?id=${Article.no}' />"
									class="btn btn-primary btn-lg" style="font-size: 26px">編輯</a>
							</c:when>
							<c:when test="${LoginOK.no!=Article.author.no}">

							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${empty LoginOK}">
								<a href="<spring:url value='/memberservice' />"
									class="btn btn-primary btn-lg" style="font-size: 26px">回覆</a>
							</c:when>
							<c:when test="${!empty LoginOK}">
								<a href="<spring:url value='/addReply?id=${Article.no}' />"
									class="btn btn-primary btn-lg" style="font-size: 26px">回覆</a>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${empty LoginOK}">
								<a href="<spring:url value='/memberservice' />"
									class="btn btn-primary btn-lg" style="font-size: 26px">檢舉</a>
							</c:when>
							<c:when test="${!empty LoginOK}">
								<a href="<spring:url value='/addReport?id=${Article.no}' />"
									class="btn btn-primary btn-lg" style="font-size: 26px">檢舉</a>
							</c:when>
						</c:choose>
					</p>
					<form:form method='POST' modelAttribute="LikeOrDislikeBean"
						class='form-horizontal' enctype="multipart/form-data">
						<fieldset>
							<c:choose>
								<c:when test="${empty LoginOK}">
								</c:when>
								<c:when test="${!empty LoginOK}">
									<div class="form-group">
										<form:input id="articleNoString" readonly="true"
											path="articleNoString"
											value='${LikeOrDislikeBean.articleNoString}' type='hidden'
											class='form:input-large' />
										<form:input id="member" path="member" readonly="true"
											value='${LoginOK.no}' type='hidden' class='form:input-large' />
										<button type="submit" name="button" value="like">like</button>
										<a>${Article.likeCount}</a>
										<button type="submit" name="button" value="dislike">dislike</button>
										<a>${Article.dislikeCount}</a>
									</div>
								</c:when>
							</c:choose>
							<hr class="first" />
						</fieldset>
					</form:form>
					<br>

					<c:forEach var='reply' items='${Replys}'>
						<div
							style="width: 1080px; height: auto; display: flex; flex-wrap: wrap; border: 1px solid gray; border-radius: 25px; font-size: 26px">

							<div
								style="width: 700px; height: 50px; font-size: 26px; text-align: center; margin: 25px">
								<p>${reply.author.name}回覆時間:${reply.postTime}</p>
							</div>
							<c:choose>
								<c:when test="${LoginOK.no==reply.author.no}">
									<a href="<spring:url value='/editReply?id=${reply.no}' />"
										class="btn btn-primary btn-lg"
										style="font-size: 26px; margin: 25px">編輯</a>
								</c:when>
								<c:when test="${LoginOK.no!=reply.author.no}">
									<a class="btn btn-disabled btn-lg"
										style="font-size: 26px; margin: 25px"></a>
								</c:when>
							</c:choose>
							<form:form method='POST' modelAttribute="Reply"
								class='form-horizontal' enctype="multipart/form-data">
								<fieldset>

									<c:choose>
										<c:when test="${LoginOK.no>6}">
											<c:choose>
												<c:when test="${LoginOK.no!=Article.author.no}">

												</c:when>
												<c:when test="${LoginOK.no==Article.author.no}">
													<form:input id="articleString" readonly="true"
														path="articleString"
														value='${Article.noString=Article.no}' type='hidden'
														class='form:input-large' />
													<form:input id="rnoString" readonly="true" path="rnoString"
														value='${reply.rnoString=reply.no}' type='hidden'
														class='form:input-large' />
													<div class="form-group">
														<button type="submit" name="lockbutton" value="lock"
															style="font-size: 18px; margin: 25px">封鎖</button>
													</div>
												</c:when>
											</c:choose>

										</c:when>
										<c:when test="${LoginOK.no<=6}">
											<form:input id="articleString" readonly="true"
												path="articleString" value='${Article.noString=Article.no}'
												type='hidden' class='form:input-large' />
											<form:input id="rnoString" readonly="true" path="rnoString"
												value='${reply.rnoString=reply.no}' type='hidden'
												class='form:input-large' />
											<div class="form-group">
												<button type="submit" name="lockbutton" value="lock"
													style="font-size: 18px; margin: 25px">封鎖</button>
											</div>
										</c:when>
									</c:choose>
								</fieldset>
							</form:form>

						</div>


						<div
							style="width: 1080px; height: auto; display: flex; flex-wrap: wrap; border: 1px solid gray; border-radius: 25px; font-size: 26px">
							<c:choose>
								<c:when test="${reply.available==true}">

									<pre class="title_width" style="white-space: pre-wrap;margin: 25px">${reply.content}</pre>

								</c:when>
								<c:when test="${reply.available==false}">

									<pre class="title_width" style="white-space: pre-wrap;margin: 25px">這篇回覆已經被封鎖</pre>

								</c:when>
							</c:choose>
						</div>
						<br>
					</c:forEach>
					<hr class="first" />
					<p>
						<a
							href="<spring:url value='/MoviesForum/Articles?id=${Article.movie.no}' />"
							class="btn btn-default" style="font-size: 26px"> <span
							class="glyphicon-hand-left glyphicon"></span>返回
						</a>
					</p>
				</article>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
