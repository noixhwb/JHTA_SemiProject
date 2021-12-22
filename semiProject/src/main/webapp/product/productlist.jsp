<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.container
{
display: grid;
grid-template-columns: repeat(4, 300px);
	gap: 10px 50px;
    margin-left: 180px;
    padding-bottom: 200px
}
#img
{
width: 300px;
height: 400px;
}
#line
{
margin-bottom :10px;
margin-top:10px;
}
</style>

<div class="container">
<c:choose>
<c:when test="${list.size()!=0}">
<c:forEach var="i" begin="0" end="${list.size()-1}">

  
  <div class="item">

  <a href="<%=request.getContextPath()%>/admin/productdetail?pnum=${list[i].pnum }&page=product">
  <img src="<%=request.getContextPath()%>/imagesPro/${listP[i] }" id="img"></a><br>
      ${list[i].pname }<br>
       <hr width =100% color="gray" align="left" size=1 id="line">
  ${list[i].pprice }
  <a href="">리뷰</a>
 
  </div>
  </c:forEach>
</c:when>
<c:otherwise>
상품이 0개있습니다.

</c:otherwise>

</c:choose>

</div>
