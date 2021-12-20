<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.product_detail {
	width: 60%;
	border-collapse: separate;
	padding-bottom: 200px;
	position: absolute;
	left: 350px;
}

.product_detail td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
	border-color: black;
}

#detailimg {
	width: 200px;
}
 .product_detail #col
 {
 background-color: black;
 color:white;
 width: 100px;
 }

</style>
<!-- 제품상세페이지(관리자용) -->
<h1 style="text-align: center; padding-bottom: 50px;">상품상세페이지</h1>
<c:set var="cp" value="${ pageContext.request.contextPath}" />
<!-- 카테고리 -->
<div>
	<table class="product_detail">
		<!-- 카테고리 -->
		<tr>
			<td id="col">대분류</td>
			<td>카테고리</td>
			<td id="col">소분류</td>
			<td>${requestScope.vo.cName}</td>
			<!-- 제품번호 -->
		</tr>
		<tr>
			<td id="col">제품번호</td>
			<td colspan="3">${requestScope.vo.pNum}</td>
		</tr>
		<!-- 제품명 -->
		<tr>
			<td id="col">제품명</td>
			<td colspan="3">${requestScope.vo.pName}</td>
		</tr>
		<!-- 제품 내용 -->
		<tr>
			<td id="col">내용</td>
			<td colspan="3">${requestScope.vo.pContent}</td>
		</tr>
		<!-- 사이즈 개수 -->

		<c:forEach var="i" items="${list}">
			<tr>
				<td id="col">사이즈</td>
				<td>${i.proSize}</td>
				<td id="col">재고량</td>
				<td>${i.proCount}</td>
			</tr>
		</c:forEach>

		<!-- 대표이미지 -->
		<tr>
			<td id="col">대표이미지</td>
			<td colspan="3">
				<img src="${cp }/imagesPro/${img}" id="detailimg">
			</td>
		</tr>
		<!-- 이미지-->
		<tr>
			<td id="col">이미지</td>
			<td colspan="3">
				<c:forEach var="imgs" items="${imgsList}">
					<img src="${cp }/imagesPro/${imgs}" id="detailimg">
					<br>
				</c:forEach>
			</td>
		</tr>
		<tr>
		<td colspan="4" style="text-align: right;">	<input type="button" value="수정"> <input type="button" value="삭제"> <input type="button" value="목록으로"></td>
		</tr>
	</table>
	
</div>


