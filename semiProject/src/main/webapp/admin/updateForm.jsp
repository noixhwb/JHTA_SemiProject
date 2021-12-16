<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="cp" value="${ pageContext.request.contextPath}"/>
<h1>관리자 정보 수정</h1>
<form method="post" action="${ pageContext.request.contextPath}/admin/update">
<table border="1" width="400">


<tr bgcolor="black" align ="center">
	<p><td colspan = "2" span style="color:white">관리자 정보수정</td></p>
    </tr>
<tr>
<!-- 아이디 검사 -->
<td>아이디</td>
<td><input type="text" name="aid" id="id" value="${requestScope.vo.aId }">
<input type="button" value="아이디중복체크" onclick="idchkopen()">
<input type="hidden"  name="id" value="${requestScope.vo.aId }">
</td>
</tr>
<tr>
<td>비밀번호</td>
<td><input type="text" name="apwd" value="${requestScope.vo.aPwd }"></td>
</tr>
<tr>
<td>레벨</td>
<td><input type="text" name="alevel" value="${requestScope.vo.alevel }">
<!-- 셀렉트로 구현예정 -->
<select>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
</select>
</td>
</tr>
<tr>
<td>생성일</td>
<td><input type="text" value="${requestScope.vo.regdate }"></td>
</tr>
</table>
<input type="submit" value="수정">
<input type="button" value="취소">
</form>
<script type="text/javascript">
//아이디문자열 체크,숫자체크
function idcheck1()
{
	let id = document.getElementById("id").value;
	if(!id){
		alert("아이디를 입력하지 않았습니다.")
		return false;
	}else if((id<"0" || id>"9")&&(id<"A" || id>"Z")&&(id<"a" || id>"z"))
		{
		alert("한글 및 특수문자는 아이디로 사용하실수 없습니다.")
		return false;
	}
}

function idchkopen()
{   let id = document.getElementById("id").value;
	window.name= "parentForm";
	window.open("<%=request.getContextPath()%>/admin/idchk.jsp?aid=id","1","width=500,height=300,resizable=no,scrollbars=no");
	}
</script>