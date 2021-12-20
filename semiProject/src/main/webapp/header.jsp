<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--관리자인지 검사해서 보여주는 메뉴 페이지에 차이를 줌 --%>
<c:choose>
<c:when test="${sessionScope.aid eq null && sessionScope.mid eq null}">
<div id="headerMenu">
	<ul>
		<li><a href="">NEW</a></li>
		<li><a href="">BEST</a></li>
		<li><a href="">SALE</a></li>
		<li><a href="">COMMUNITY</a></li>
	</ul>
</div>
<div id="siteName">
	<h1>SEMI PROJECT</h1>
</div>
<div id="headerLoginMenu">
	<ul>
		<li><a href="cart"><img src="<%=request.getContextPath()%>/images/3.png" width="25" height="25"></a></li>
		<li><a href="<%=request.getContextPath()%>/Home?spage=loginForm.jsp">Login</a></li>
		<li><a href="<%=request.getContextPath()%>/Home?spage=/myshop/index">마이페이지</a></li>
		<li><a href="<%=request.getContextPath()%>/Home?spage=/member/join.jsp">회원가입</a></li>
	</ul>
</div>
</c:when>


<c:when test="${sessionScope.mid ne null && sessionScope.aid eq null }">
<div id="headerMenu">
	<ul>
		<li><a href="">NEW</a></li>
		<li><a href="">BEST</a></li>
		<li><a href="">SALE</a></li>
		<li><a href="">COMMUNITY</a></li>
	</ul>
</div>
<div id="siteName">
	<h1>SEMI PROJECT</h1>
</div>
<div id="headerLoginMenu">
	<ul>
		<li><a href="cart"><img src="<%=request.getContextPath()%>/images/3.png" width="25" height="25"></a></li>

		<li><a href="<%=request.getContextPath()%>/Home?spage=/myshop/index">마이페이지</a></li>
		<li><a href="<%=request.getContextPath()%>/Home?spage=/member/update">회원정보수정</a></li>
		<li><a href="<%=request.getContextPath()%>/logout">Logout</a></li>
	</ul>
</div>
</c:when>



<c:otherwise>
<div id="headerMenu">
	<ul>
		<li><a href="">NEW</a></li>
		<li><a href="">BEST</a></li>
		<li><a href="">SALE</a></li>
		<li><a href="">COMMUNITY</a></li>
	</ul>
</div>
<div id="siteName">
	<h1>SEMI PROJECT</h1>
</div>
<div id="headerLoginMenu">
	<ul>
		<li><a href="<%=request.getContextPath()%>/logout">Logout</a></li>
		<li><a href="">관리자페이지</a></li>

	</ul>
</div>

</c:otherwise>
</c:choose>
