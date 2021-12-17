<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	String[] mphone1 = request.getParameterValues("mphone1");
%>
<c:choose>
	<c:when test="${requestScope.result=='success' }">
		<h1>회원가입 완료</h1><br>
		<h2>회원가입이 완료 되었습니다.</h2>
		
	<table style="width:40%">
		<tr>
			<th colspan="3" align="left">저희 쇼핑몰을 이용해 주셔서 감사합니다.</th>	
		</tr>
		<tr>
			<td rowspan="3"><img src="images/1000.png"></td>
			<td align="left">아이디</td>		
			<td align="left">${param.mid }</td>
		</tr>
		<tr>
			<td>이름</td>		
			<td>${param.mname }</td>
		</tr>
      	<tr>
			<td>휴대폰</td>		
			<td>${param.mphone1}-${param.mphone2}-${param.mphone3}</td>
		</tr>
	</table>
	
	</c:when>
	<c:otherwise>
		<h1>회원가입 실패</h1><br><br>
		<h2>다시 회원가입을 진행해 주세요.</h2>
		
		
	</c:otherwise>
</c:choose>
<a href="<%=request.getContextPath()%>/Home">메인페이지로 돌아가기</a>
</body>
</html>