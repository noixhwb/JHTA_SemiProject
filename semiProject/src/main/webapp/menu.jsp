<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="mainmenu">
<c:choose>
<c:when test="${sessionScope.aid eq null}">

	<ul>
		<li><a href="<%=request.getContextPath()%>/product/list">best</a></li>

		<li><a href="<%=request.getContextPath()%>/product/list?ct=상의">상의</a>
			<ul class="sub">
				<li><a href="<%=request.getContextPath()%>/product/list?ct=상의&cname=니트">니트</a></li>
				<li><a href="<%=request.getContextPath()%>/product/list?ct=상의&cname=티셔츠">티셔츠</a></li>
			</ul></li>
		<li><a href="<%=request.getContextPath()%>/product/list?ct=하의">하의</a>
			<ul class="sub">
				<li><a href="<%=request.getContextPath()%>/product/list?ct=하의&cname=슬랙스">슬랙스</a></li>
				<li><a href="<%=request.getContextPath()%>/product/list?ct=하의&cname=트레이닝">트레이닝</a></li>
			</ul></li>
		<li><a href="<%=request.getContextPath()%>/product/list?ct=아우터">아우터</a>
			<ul class="sub">
				<li><a href="<%=request.getContextPath()%>/product/list?ct=아우터&cname=가디건">가디건</a></li>
				<li><a href="<%=request.getContextPath()%>/product/list?ct=아우터&cname=코트">코트</a></li>
			</ul></li>
	</ul>
</c:when>
<c:otherwise>
	<ul>
		<li><a href="<%=request.getContextPath()%>/admin/list">관리자 관리</a></li>
        <li><a href="<%=request.getContextPath()%>/member/list">사용자 관리</a></li>
        <li><a href="<%=request.getContextPath()%>/admin/order">주문관리</a></li>
		<li><a href="<%=request.getContextPath()%>/Home?spage=/admin/productInsert.jsp">상품 관리</a></li>
		<li><a href="<%=request.getContextPath()%>/admin/sales">매출 관리</a></li>
	</ul>
</c:otherwise>
</c:choose>
</div>