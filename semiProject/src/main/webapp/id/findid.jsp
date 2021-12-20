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
		margin-left: 30px;
		margin-bottom: 70px;
	}
#wrap #box1{
		 
		 text-align: center;
		 display: inline-block; 
		 padding-bottom: 20px;
		 margin-left: 31%;
	}
	
	.btn1 {
			
			background-color: black;
			padding: 15px 120px;
			margin: 2px;
			border: none;
			color: white;
			text-align: right;
			font-size: 16px;
			display: inline-block;
			cursor: pointer;
			margin-left: 35%;
		}
		
	
	#tb1{
	 width:200px; height: 100px;
	 font-size: 13px;
	}
	#tb2{
	width:250px; height: 100px;
	text-align: left;
	}
	#box2{
	border: 1px solid black; border-collapse: collapse;
	width:530px; height: 100px;
	text-align: center;
	margin-left: 35%;
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
				div.innerHTML="검색된 아이디:" + mid;
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
	<div id="box2"><div id="result"></div></div>
	<div id="box1">
	<table >
		<tr>
			<th id="tb1">휴대폰번호입력</th>
			<th id="tb2"><input type="text" id="mphone"></th>
			
		</tr>
	</table>
	<input type="submit" value="찾기" maxlength="11" class="btn1" onclick="findId()">
	</div>
</div>
</body>
</html>