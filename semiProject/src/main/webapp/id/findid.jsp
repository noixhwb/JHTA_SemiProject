<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#wrap{
		margin:0px	;
		padding: 0px;
	}
#mypage_category{
		margin-left: 21px;
		margin-bottom: 70px;
	}
	
	
	#t1{
	width:600px; height: 50px;
	}
	
	#t2{
	height: 50px;
	color: black;
	}
	
	#t3{
	height: 50px;
	}
	
	#mphone{
	width: 80%; height: 30px;
	}
	#t4{
	width:180px;  height: 50px;
	}
	
	
	#btn10{
	width: 100%; height: 100%;
	cursor: pointer;
	background-color: black;
	color: white;
	border: 1px solid black;
	}
	#btn11{
	width: 400px; height: 70%;
	cursor: pointer;
	background-color: black;
	color: white;
	border: 1px solid black;
	}
	
	#box1{
	width :600px; height: 270px;
	border: 1px solid;
	margin-left: 31%;
	
	padding-top: 50px;
	padding-left: 40px;
	padding-right: 40px;
	
	background-color: #A6B8C4;
	color:white;
	border-radius: 8px;
	}
	
</style>
<script type="text/javascript">
	var xhr=null;
	function findId(){
		let mphone=document.getElementById("mphone").value;
		xhr=new XMLHttpRequest();
		xhr.onreadystatechange=getResult;
		xhr.open('get','${pageContext.request.contextPath}/findid?mphone='+ mphone,true);
		xhr.send();
	}
	function getResult(){
		if(xhr.readyState==4 && xhr.status==200){
			let xml=xhr.responseXML;
			
			let find=xml.getElementsByTagName("find")[0].firstChild.nodeValue;	
			let div=document.getElementById("result");
			if(find=='success'){
				let mid=xml.getElementsByTagName("mid")[0].firstChild.nodeValue;
				div.innerHTML="검색된 아이디 : " + mid;
			}else{
				div.innerHTML="해당되는 아이디가 없습니다.";
			}
		}
	}

</script>
</head>
<body>
<div id="wrap">
	<div id="mypage_category">
		<ul>
			<li><a href="${pageContext.request.contextPath}/Home">Home</a> > 아이디 찾기</li>
		</ul>
		<br>
	<h3>아이디찾기</h3>
	</div>
	<div id="box1">
	<table >
		<tr>
			<th colspan="3" id="t1" ><div id="result"></div></th>
		</tr>
		<tr>
			<th id="t2" >휴대폰번호입력</th>
			<td colspan="2"  id="t22" ><input type="text" id="mphone"></td>
		</tr>
		<tr>
			<th id="t3" colspan="3"><input type="submit" value="찾기" id="btn11"  maxlength="11" onclick="findId()"></th>
		</tr>
		<tr>
<th id="t4"><a  href="<%=request.getContextPath()%>/Home?spage=/member/join.jsp"><button type="button" id="btn10">회원가입</button></a> </th>
<th id="t4"><a  href="<%=request.getContextPath()%>/Home?spage=/loginForm.jsp"><button type="button" id="btn10">로그인</button></a> </th>
<th id="t4"><a  href="<%=request.getContextPath()%>/findpwdform"><button type="button" id="btn10">비밀번호찾기</button> </a></th>		
		</tr>
	</table>
	</div>	
</div>
</body>
</html>