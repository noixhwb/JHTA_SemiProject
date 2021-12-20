<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<Style>
.admin_product_list
{
width:80%;
border-collapse:separate;


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
</Style>
<!-- 리스트 출력 -->
<c:set var="cp" value="${ pageContext.request.contextPath}"/>
<table class="admin_product_list">
<tr>
<th>제품번호</th>
<th>제품명</th>

<c:forEach var="vo" items="${list }">

<tr>
<td>${vo.pNum }</td>
<td><a href="${cp }/admin/productdetail?pnum=${vo.pNum }">${vo.pName }</a></td>

</tr>

</c:forEach>



</table>