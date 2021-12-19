<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BeanJoin</title>
<style>

	#wrap{
		margin:0px	; padding: 0px; text-align: center;
		
		}	
	#box1{
		 width:900px; height: 50px; 
		 padding-bottom: 20px;
		 display: inline-block; 
		 
		 
		}
	#box2{
		width:800px; height: 400px; 
		padding-bottom: 20px;
		display:flex;
		justify-contents:center;
		margin: 0 auto;

	}
	table{
	}
	th{
	width:100px; height: 50px; 
	text-align:left;
	}
	td{
	width:300px;
	}
	#tb1{
	width:300px;
	}
	
	
	#mid{
	width:240px; height: 25px;
	font-size: 20px;
	}
	#mpwd{
	width:240px; height: 25px;
	font-size: 20px;
	}
	#mname{
	width:240px; height: 25px;
	font-size: 20px;
	}
	#maddr{
	width:240px; height: 25px;
	font-size: 20px;
	}
	#mphone1{
	width:50px; height: 25px;		
	font-size: 20px;	
	}
	
	#btn1 {	
			background-color: black;
			padding: 20px 23px;
			margin: 2px;
			border: none;
			color: white;
			text-align: right;
			text-decoration: none;
			font-size: 16px;
			display: inline-block;
			cursor: pointer;
	}
	
</style>
<script type="text/javascript">
		
var xhr=null;
function idCheck(){
	xhr=new XMLHttpRequest();
	xhr.onreadystatechange=success; 
	let mid=document.getElementById("mid").value;
	if(mid==""){
		document.getElementById("idcheck").innerHTML="";
		return;
	}
	xhr.open('get','${pageContext.request.contextPath}/member/idcheck.jsp?mid='+ mid,true);
	xhr.send();
}
function success(){
	if(xhr.readyState==4 && xhr.status==200){
		let xml=xhr.responseXML;
		let exist=xml.getElementsByTagName("exist")[0].textContent;
		let span=document.getElementById("idcheck");
		if(exist=='true'){
			span.innerHTML="사용중인 아이디입니다.";
		}else{
			span.innerHTML="사용가능한 아이디입니다.";
		}	
	}
}
	
	
	
	function sendIt() {
    if (f.mid.value == "") {
        alert("아이디를 입력하지 않았습니다.")
        f.mid.focus();
        return false;
    }
    for (var i = 0; i < document.f.mid.value.length; i++) {
               ch = document.f.mid.value.charAt(i)
        if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
                   alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
                   document.f.mid.focus();
                   document.f.mid.select();
                   return false;
               }
           }
    if (document.f.mid.value.indexOf(" ") >= 0) {
        alert("아이디에 공백을 사용할 수 없습니다.")
        document.f.mid.focus();
        document.f.mid.select()
        return false;
    }
	if (document.f.mid.value.length<4 || document.f.mid.value.length>12) {
	        alert("아이디를 4~12자까지 입력해주세요.")
	        document.f.mid.focus();
	        document.f.mid.select();
	        return false;
	    }
	
	if (document.f.mpwd.value == "") {
	        alert("비밀번호를 입력하지 않았습니다.")
	        document.f.mpwd.focus();
	        return false;
	    }
	
	if(document.f.mpwd.value.length<8){
        alert("비밀번호를 8자~16자 사이 입력해주십시오.")
        document.f.mpwd.focus();
        return false;
  	  }
	
	    if (f.mpwd.value == f.mid.value) {
	        alert("아이디와 비밀번호가 같습니다.")
	        document.f.mpwd.focus();
	        return false;
	    }
	if (document.f.mname.value == "") {
	        alert("이름을 입력하지 않았습니다.")
	        document.f.mname.focus();
	        return false;
	    }
	if(document.f.mname.value.length<2){
	        alert("이름을 2자 이상 입력해주십시오.")
	        document.f.mname.focus();
	        return false;
	  	  }
	if (document.f.mphone2.value == "") {
        alert("전화번호를 입력하지 않았습니다.")
        document.f.mphone2.focus();
        return false;
    }
	if (document.f.mphone3.value == "") {
        alert("전화번호를 입력하지 않았습니다.")
        document.f.mphone3.focus();
        return false;
    }
    for (var i = 0; i < document.f.mphone2.value.length; i++) {
        ch = document.f.mphone2.value.charAt(i)
        if (! (ch >= '0' && ch <= '9') ) {
            alert("연락처에 번호만 입력해주세요")
            document.f.mphone2.focus();
            document.f.mphone2.select();
            return false;
        }
    }
    for (var i = 0; i < document.f.mphone3.value.length; i++) {
        ch = document.f.mphone3.value.charAt(i)
        if (! (ch >= '0' && ch <= '9') ) {
            alert("연락처에 번호만 입력해주세요")
            document.f.mphone3.focus();
            document.f.mphone3.select();
            return false;
        }
    }
    if (document.f.mphone2.value.indexOf(" ") >= 0) {
        alert("휴대전화에 공백을 사용할 수 없습니다.")
        document.f.mphone2.focus();
        document.f.mphone2.select()
        return false;
    }
    if (document.f.mphone3.value.indexOf(" ") >= 0) {
        alert("휴대전화에 공백을 사용할 수 없습니다.")
        document.f.mphone3.focus();
        document.f.mphone3.select()
        return false;
    }
	
	if (document.f.mphone2.value.length<4 || document.f.mphone2.value.length>5) {
        alert("휴대전화 4자리를 입력해주세요")
        document.f.mphone2.focus();
        document.f.mphone2.select();
        return false;
    }
	if (document.f.mphone3.value.length<4 || document.f.mphone3.value.length>5) {
        alert("휴대전화 4자리를 입력해주세요")
        document.f.mphone3.focus();
        document.f.mphone3.select();
        return false;
    }
	
	
   		 
	} 
</script>
<body>
<div id="wrap">
	<div id="box1">
	        <h2 align="center">회원 가입</h2>     
	         &nbsp;
	        <hr width = 100% size=1 color=black>
	        <br>
	</div>
	
	<div id="box2">
	<form name="f" method="post" action="<%=request.getContextPath() %>/join" onsubmit="return sendIt();">
	     <table >
			<tr >
	            <th>아이디 </th>
	            <td><input type="text" name="mid" id="mid" maxlength="12" onkeyup="idCheck()"></td>
	            <th id="tb1"><span id="idcheck"></span></th>
	        </tr>
	        
	        <tr>
	            <th> 비밀번호</th>
	            <td><input type="password" name="mpwd" id="mpwd" maxlength="16"></td>
	            <th id="tb1"> 8자~16자 사이 입력해주세요 </th>
	        </tr >
	        
	        <tr>
	            <th> 이름 </th>
	            <td><input type="text" name="mname" id="mname" maxlength="4"></td>
	        </tr >
	        <tr>
	            <th> 주소 </th>
	            <td><input type="text" name="maddr" id="maddr" maxlength="6"></td>
	        </tr>
	        <tr>
	            <th> 연락처 </th>
	            <td>
	            	   <select name="mphone1" style="width:50px; height: 29px;">
					        <option value="010" id="mphone1">010</option>
					        <option value="011" id="mphone1">011</option>
					        <option value="016" id="mphone1">016</option>
					        <option value="017" id="mphone1">017</option>
					    </select> -
	            	<input type="text" name="mphone2" id="mphone1"maxlength="4" size="2">
	            	-
	            	<input type="text" name="mphone3" id="mphone1"maxlength="4" size="2">
	            </td >
	        </tr>
	        <tr>
	            <th>
	                <p align="right">&nbsp;</p>
	            </th>
	            <td>
	            <input type="submit" id="btn1" value="가입하기">
	            </td>
	        </tr>
	    </table>
	</form>
	</div>
</div>
</body>
</html>
