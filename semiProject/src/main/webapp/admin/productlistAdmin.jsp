<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<Style>
.admin_product_list
{
width:80%;
border-collapse:separate;
position: absolute;
left:150px;
padding-top: 50px;

}
.admin_product_list th
{
padding:10px;
border-bottom: 3px solid #168;
  text-align: left;
  border-color: black; 
}
.admin_product_list td
{
 padding: 10px;
  border-bottom: 1px solid #ddd;
    border-color: silver; 
}
.admin_product_list tr:hover td {
  color: gray;
}
#addbtn
{
border:2px solid black;
border-radius:5px;
padding: 5px;
color:white;
background-color:black;
}
</Style>
<!-- 리스트 출력 -->
<c:set var="cp" value="${ pageContext.request.contextPath}"/>
<div>
<table class="admin_product_list">
<tr>
<th>제품번호</th>
<th>제품명</th>

<c:forEach var="vo" items="${list }">

<tr>
<td>${vo.pNum }</td>
<td><a href="${cp }/admin/productdetail?pnum=${vo.pNum }&page=admin">${vo.pName}</a></td>
</tr>


</c:forEach>
<tr>
<td colspan="2" style="text-align: right;"><a href="${cp }/Home?spage=/admin/productInsert.jsp" id="addbtn">제품추가</a></td>
</tr>

</table>
</div>
