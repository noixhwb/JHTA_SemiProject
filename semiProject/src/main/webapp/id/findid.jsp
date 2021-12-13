<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<h1>아이디찾기</h1>
휴대폰번호입력 <input type="text" id="mphone">
<input type="submit" value="찾기" maxlength="11" onclick="findId()">
<div id="result">
</div>
</body>
</html>