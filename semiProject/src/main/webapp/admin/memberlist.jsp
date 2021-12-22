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
	tr:hover { background-color: #bebebe; }
	
	#tb{
	margin-left: 30%;
	}
	
	#num{
	margin-left: 30%;
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
	#t7{
	background-color:#6495ED;
	}
	
	td{ text-align: center; height: 30px;}
	#d0{
	color: red;
	}
	#d111{
	background-color: #FF8200;
	}
	#d1111{
	background-color: #57E9E1;
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
		<th id="t7">정보수정</th>
	</tr>
		<c:forEach var="vo" items="${list }">
	<tr>
		<c:choose>
			
			<c:when test="${vo.mstate =='0' }">
			<td id="d0">${vo.mid }</td>
			<td id="d0">${vo.mname }</td>
			<td id="d0">${vo.maddr }</td>
			<td id="d0">${vo.mphone }</td>
			<td id="d0">탈퇴회원</td>
			<td id="d0">${vo.regdate }</td>
			<td id="d0"><a href="<%=request.getContextPath()%>/member/update10?mid=${vo.mid }">수정</a></td>
			</c:when>
			
			
			<c:when test="${vo.mstate =='1' }">
			<td id="d11">${vo.mid }</td>
			<td id="d11">${vo.mname }</td>
			<td id="d11">${vo.maddr }</td>
			<td id="d11">${vo.mphone }</td>
			<td id="d11">일반회원</td>
			<td id="d11">${vo.regdate }</td>
			<td id="d11"><a href="<%=request.getContextPath()%>/member/update10?mid=${vo.mid }">수정</a></td>
			</c:when>
			
			
			<c:when test="${vo.mstate =='2' }">
			<td id="d111">${vo.mid }</td>
			<td id="d111">${vo.mname }</td>
			<td id="d111">${vo.maddr }</td>
			<td id="d111">${vo.mphone }</td>
			<td id="d111">VIP</td>
			<td id="d111">${vo.regdate }</td>
			<td id="d111"><a href="<%=request.getContextPath()%>/member/update10?mid=${vo.mid }">수정</a></td>
			</c:when>
			
			
			<c:when test="${vo.mstate =='3' }">
			<td id="d1111">${vo.mid }</td>
			<td id="d1111">${vo.mname }</td>
			<td id="d1111">${vo.maddr }</td>
			<td id="d1111">${vo.mphone }</td>
			<td id="d1111">VVIP</td>
			<td id="d1111">${vo.regdate }</td>
			<td id="d1111"><a href="<%=request.getContextPath()%>/member/update10?mid=${vo.mid }">수정</a></td>
			</c:when>
			
			<c:otherwise></c:otherwise>
		</c:choose>
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