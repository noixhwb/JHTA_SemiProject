<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.container {
	display: grid;
	grid-template-columns: repeat(4, 300px);
	gap: 10px 50px;
	margin-left: 180px;
	padding-bottom: 30px
}

#img {
	width: 300px;
	height: 400px;
}

#line {
	margin-bottom: 10px;
	margin-top: 10px;
}
.page
{
padding-bottom: 100px;
text-align: center;
}

</style>

<div class="container">
	<c:set var="cp" value="${ pageContext.request.contextPath}" />
	<c:choose>
		<c:when test="${list.size()!=0}">
			<c:forEach var="i" begin="0" end="${list.size()-1}">


				<div class="item">

					<a href="<%=request.getContextPath()%>/admin/productdetail?pnum=${list[i].pnum }&page=product"> <img src="<%=request.getContextPath()%>/imagesPro/${listP[i] }" id="img"></a><br> ${list[i].pname }<br>
					<hr width=100% color="gray" align="left" size=1 id="line">
					${list[i].pprice } <a href="">리뷰</a>

				</div>

			</c:forEach>
		</c:when>
		<c:otherwise>
상품이 0개있습니다.

</c:otherwise>

	</c:choose>

</div>
<div class="page">
     <a href="${cp }/product/list?pageNum=${pageNum-1}">&lt;&lt;</a>
   
   <c:forEach var="i" begin="${startPage}" end="${endPage }">
      <c:choose>
         <c:when test="${pageNum==i }">
            <a href="${cp }/product/list?pageNum=${i}"><span style="color:red">${i }</span></a>
         </c:when>
         <c:otherwise>
            <a href="${cp }//product/list?pageNum=${i}"><span style="color:gray">${i }</span></a>
         </c:otherwise>
      </c:choose> 
   </c:forEach>
     <a href="${cp }/product/list?pageNum=${pageNum+1}">&gt;&gt;</a>
</div>
<!-- 페이징 처리 -->

