<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="mainmenu">
<c:choose>
<c:when test="${sessionScope.aid eq null}">

	<ul>
		<li><a href="<%=request.getContextPath()%>/Home?spage=/product/list">best</a></li>

		<li><a href="">상의</a>
			<ul class="sub">
				<li><a href="">니트</a></li>
				<li><a href="">티셔츠</a></li>
			</ul></li>
		<li><a href="">하의</a>
			<ul class="sub">
				<li><a href="">슬랙스</a></li>
				<li><a href="">트레이닝</a></li>
			</ul></li>
		<li><a href="">아우터</a>
			<ul class="sub">
				<li><a href="">가디건</a></li>
				<li><a href="">코트</a></li>
			</ul></li>
	</ul>
</c:when>
<c:otherwise>
	<ul>
		<li><a href="<%=request.getContextPath()%>/admin/list">관리자 관리</a></li>
        <li><a href="">사용자 관리</a></li>
        <li><a href="">주문관리</a></li>
		<li><a href="<%=request.getContextPath()%>/Home?spage=/admin/productInsert.jsp">상품 관리</a></li>
	</ul>
</c:otherwise>
</c:choose>
</div>