<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.updateform {
	position: absolute;
	left: 39%;
	top: 30%
}
</style>
<c:set var="cp" value="${ pageContext.request.contextPath}" />
<h1 style="text-align: center; padding-top: 50px;">관리자 정보 수정</h1>
<div class="updateform">
	<form method="post" action="${ pageContext.request.contextPath}/admin/update">
		<table border="1" width="400">


			<tr bgcolor="black" align="center">
				<td colspan="2" style="color: white">
					<p>관리자 정보수정</p>
				</td>
			</tr>
			<tr>
				<!-- 아이디 검사 -->
				<td>아이디</td>
				<td>
					<input type="text" name="aid" id="id" value="${requestScope.vo.aId }" onkeyup="idcheck1()"><input type="button" value="아이디중복체크" onclick="idCheck()"> <input type="hidden" name="id" value="${requestScope.vo.aId }">
				<br> <span id="idchk" style="color:red;font-size:10px;"></span> 
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="text" name="apwd" id="pwd" value="${requestScope.vo.aPwd }" onkeyup="pwdcheck1()">
				    	<br> <span id="pwdchk" style="color:red;font-size:10px;"></span> 
				</td>
			</tr>
			<tr>
				<td>레벨</td>
				<td>
					<input type="number" name="alevel" min="1" max="3" value="${requestScope.vo.alevel }">
				</td>
			</tr>
			<tr>
				<td>생성일</td>
				<td>
					<input type="text" value="${requestScope.vo.regdate }" disabled="disabled">
				</td>
			</tr>
		</table>
		<input type="submit" value="수정"> <input type="button" value="취소">
	</form>
</div>
<script type="text/javascript">
//아이디문자열 체크,숫자체크
function idcheck1()
{
	let id = document.getElementById("id").value;
	let idchk = document.getElementById("idchk");
	if(id.length==0){
		idchk.innerHTML="아이디를 입력하세요";
		return false;
	}else if((id<"0" || id>"9")&&(id<"A" || id>"Z")&&(id<"a" || id>"z"))
		{
		idchk.innerHTML="한글 및 특수문자,공백은 아이디에 사용하실 수 없습니다";
		return false;
	}else
		{
		idchk.innerHTML="";
		}
}
function pwdcheck1()
{
	let pwd = document.getElementById("pwd").value;
	let pwdchk = document.getElementById("pwdchk");
	if(pwd.length==0){
		pwdchk.innerHTML="비밀번호를 입력하세요";
		return false;
	}else if((pwd<"0" || pwd>"9")&&(pwd<"A" || pwd>"Z")&&(pwd<"a" || pwd>"z"))
		{
		pwdchk.innerHTML="한글 및 특수문자,공백은 비밀번호에 사용하실 수 없습니다";
		return false;
	}else
		{
		pwdchk.innerHTML="";
		}
}

function idCheck() {
	xhr=new XMLHttpRequest();
	let id = document.getElementById("id").value;
	xhr.onreadystatechange =success;
	xhr.open('get','${pageContext.request.contextPath}/admin/idchk?aid='+id,true);
	xhr.send();
}
 function success() {
    if(xhr.readyState==4 && xhr.status==200)
    {
        let xml=xhr.responseXML
        let exist= xml.getElementsByTagName("exist")[0].textContent;
        let idchk = document.getElementById("idchk");
        if(exist=='true')
        {
        	idchk.innerHTML="사용중인 아이디가 있습니다.";
        	
        }else
        {
        	idchk.innerHTML="사용가능한 아이디입니다.";
        }
    }
}
</script>