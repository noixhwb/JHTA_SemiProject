<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.Productcontainer {
	display: grid;
	grid-template-areas: "  a    b    c   "
		"  detail    detail    detail   ";
	grid-template-columns: 80px 700px 1fr;
	grid-column-gap: 20px;
	grid-row-gap: 50px;
	margin-left: 150px;
		margin-right: 150px;
			margin-top: 20px;
	grid-template-rows: 800px 1fr;
	padding-bottom: 200px;
}

#sideimg {
	grid-area: a;
}

#mainimg {
	grid-area: b;
}

#product_text {
	grid-area: c;

	padding-left:50px;
}

#product_detail {
	grid-area: detail;
	text-align: center;
}

#detailimg {
	witdh: 80px;
	height: 80px;
}
#product_text .buybut
{
background-color: black;
color:white;
width: 250px;
height: 65px;
margin-top: 50px;
}
#product_text .cartbut
{
background-color: white;
width: 150px;
height: 65px;
margin-top: 50px;
}
#line{
margin-top: 50px;
margin-bottom: 20px;
}
</style>
<c:set var="cp" value="${ pageContext.request.contextPath}" />
<div class="Productcontainer">

	<div class="blank" id="sideimg">
		<img src="${cp }/imagesPro/${img}" id="detailimg">
		<c:forEach var="imgs" items="${imgsList}">
			<img src="${cp }/imagesPro/${imgs}" id="detailimg">
			<br>
		</c:forEach>
	</div>

	<div class="blank" id="mainimg">
		<img src="${cp }/imagesPro/${img}">
	</div>

	<div class="blank" id="product_text">
	<div style="font:80px; "><h1>${vo.pName }</h1></div>
	<div >${vo.pPrice }</div>
	 <hr width =100% color="gray" align="left" size=1 id="line">
	<div>배송비</div>
	<div>사이즈</div>
	 <hr width =100% color="gray" align="left" size=1 id="line">
	<div>TOTAL</div>
	<div>
	<input type="button" value="구매하기" class="buybut">
	<input type="button" value="장바구니" class="cartbut">
	</div>
	</div>

	<div class="blank" id="product_detail">
	<div><input type="button" value="제품상세"> <input type="button" value="리뷰"></div>
	<div>${vo.pContent }<br>
		<c:forEach var="imgs" items="${imgsList}">
			<img src="${cp }/imagesPro/${imgs}" style="width:700px; ">
			<br>
		</c:forEach>
	
	</div>
	
	</div>
</div>