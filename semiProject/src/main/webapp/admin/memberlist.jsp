<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table,tr,th,td{
	border-collapse: collapse;
	border: 1px solid black;
	
	}
	tr:hover { background-color: #F5F5F5; }
	
	#tb{
	margin-left: 34%;
	}
	
	#num{
	margin-left: 34%;
	}
	#box1{
	margin-left: 45%;
	margin-bottom: 5%;
	}
	
	#t1{
	width: 130px;
	height: 40px;
	background-color:#6495ED;
	}
	#t2{
	width: 100px;
	background-color:#6495ED;
	}
	#t3{
	width: 100px;
	background-color:#6495ED;
	}
	#t4{
	width: 140px;
	background-color:#6495ED;
	}
	#t5{
	width: 70px;
	background-color:#6495ED;
	}
	#t6{
	width: 100px;
	background-color:#6495ED;
	}
	
	
	#d1{
	height: 30px;
	text-align: center;
	}
	#d2{
	text-align: center;
	}
	#d3{
	text-align: center;
	}
	#d4{
	text-align: center;
	}
	#d5{
	text-align: center;
	}
	#d6{
	text-align: center;
	}
</style>
</head>
<body>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<table id="tb">
	<tr>
		<th id="t1">회원아이디</th>
		<th id="t2">회원성명</th>
		<th id="t3">주소</th>
		<th id="t4">전화번호</th>
		<th id="t5">회원상태</th>
		<th id="t6">가입일</th>
	</tr>
		<c:forEach var="vo" items="${list }">
	<tr>
	
	
			<td id="d1">${vo.mid }</td>
			<td id="d2">${vo.mname }</td>
			<td id="d3">${vo.maddr }</td>
			<td id="d4">${vo.mphone }</td>
			<td id="d5">${vo.mstate }</td>
			<td id="d6">${vo.regdate }</td>
	</tr>
	</c:forEach>
</table>

<!--페이징처리 -->
<div id="num">
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:choose>
			<c:when test="${i==pageNum }">
				<a href="${cp }/member/list?pageNum=${i}&keyword=${keyword}&field=${field}">
				<span style="color:red">${i }</span>
				</a>
			</c:when>
			
			<c:otherwise>
				<a href="${cp}/member/list?pageNum=${i }&keyword=${keyword}&field=${field}">
				<span style="color:black">${i }</span>
				</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>


<!-- 검색창 -->
<div id="box1"> 
	<form method="post" action="${cp }/member/list">
		<select name="field">
			<option value="mid" <c:if test="${field=='mid' }">selected</c:if>>회원아이디</option>
			<option value="mname" <c:if test="${field=='mname' }">selected</c:if>>이름</option>
			<option value="maddr" <c:if test="${field=='maddr' }">selected</c:if>>주소</option>
		</select>
		<input type="text" name="keyword" value="${keyword }">
		<input type="submit" value="검색">
		<a href="${cp }/member/list">전체목록보기</a>
	</form>
</div>

</body>
</html>