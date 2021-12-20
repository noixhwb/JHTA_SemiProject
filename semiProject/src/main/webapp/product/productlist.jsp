<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.container
{
display: grid;
grid-template-columns: repeat(5, 300px);
	gap: 10px 50px;
    margin-left: 180px;
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

<c:forEach var="i" begin="0" end="${list.size() -1}">

  
  <div class="item">

  <img src="<%=request.getContextPath()%>/imagesPro/${listP[i] }" id="img"><br>
      ${list[i].pName }<br>
       <hr width =100% color="gray" align="left" size=1 id="line">
  ${list[i].pPrice }
  <a href="">리뷰</a>
 
  </div>
  </c:forEach>
</div>