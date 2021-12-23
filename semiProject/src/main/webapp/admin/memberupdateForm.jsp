<%@page import="test.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.tablebox td{
	padding: 10px;

    
    border-color: black;
	}
	
	.tablebox #tt{
	 background-color: black;
	 color:white;
	 width: 100px;
	 
     border-color: black;
	}
	#btn1{
	border-radius: 2px;
	background-color: #969696;
	color : black;
	padding: 2px 3px;
	}
 
</style>
<script type="text/javascript">
	var a=0;
	var b=0;
	var c=0;
	var d=0;
	function aa() {
		a++;
		if(a%2==1){
	        document.getElementById('name').readOnly = false;
	     }else{
	         document.getElementById('name').readOnly = true;
	     }
	}
	function bb() {
		b++;
		if(b%2==1){
	        document.getElementById('phone').readOnly = false;
	     }else{
	         document.getElementById('phone').readOnly = true;
	     }
	}
	function cc() {
		c++;
		if(c%2==1){
	        document.getElementById('addr').readOnly = false;
	     }else{
	         document.getElementById('addr').readOnly = true;
	     }
	}
	function dd() {
		d++;
		if(d%2==1){
	        document.getElementById('pwd').readOnly = false;
	     }else{
	         document.getElementById('pwd').readOnly = true;
	     }
	}

	
	//유효성검사
	function update() {
		
		if(f.mpwd.value ==""){
            alert("비밀번호를 입력하지 않았습니다.")
            f.mpwd.focus();
            return false;
        }
		if (document.f.mpwd.value.indexOf(" ") >= 0) {
            alert("비밀번호에 공백을 사용할 수 없습니다.")
            document.f.mpwd.focus();
            document.f.mpwd.select()
            return false;
        }
		if(document.f.mpwd.value.length<8){
            alert("비밀번호를 8자~16자 사이 입력해주십시오.")
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
		 
		
		 
		 if (document.f.mphone.value == "") {
	            alert("전화번호를 입력하지 않았습니다.")
	            document.f.mphone.focus();
	            return false;
	        }
		 for (var i = 0; i < document.f.mphone.value.length; i++) {
             ch = document.f.mphone.value.charAt(i)
             if (! (ch >= '0' && ch <= '9') ) {
                 alert("연락처에 번호만 입력해주세요")
                 document.f.mphone.focus();
                 document.f.mphone.select();
                 return false;
             }
         }
		   if (document.f.mphone.value.indexOf(" ") >= 0) {
               alert("휴대전화에 공백을 사용할 수 없습니다.")
               document.f.mphone.focus();
               document.f.mphone.select()
               return false;
           }
		   if (document.f.mphone.value.length < 11) {
               alert("휴대전화 11자리를 입력해주세요")
               document.f.mphone.focus();
               document.f.mphone.select();
               return false;
           }
		 
		   if (document.f.maddr.value == "") {
               alert("주소를 입력하지 않았습니다.")
               document.f.maddr.focus();
               return false;
           }
		 
		
	}
</script>
</head>
<body>


<form method="post" action="<%=request.getContextPath() %>/member/update10"
	name="f" onsubmit="return update();">
			<input type="hidden" name="mid" value="${vo.mid }">
	<table class="tablebox">	
		<tr>
			<th id="tt">회원아이디</th>
			<td>${vo.mid }</td>
			<td colspan="2" rowspan="3">	
				<c:choose>
				    <c:when test="${requestScope.rr=='ok' }">
				        <h1 align="center">요청작업 성공!</h1>
				    </c:when>
				    <c:when test="${requestScope.rr=='no' }">
				        <h1 align="center">요청작업 실패!</h1>
				    </c:when>
				    <c:otherwise>
				        
				    </c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th id="tt">회원등급</th>
			<td><select name="mstate" id=state >
				<option value="0" ${vo.mstate == '0' ? 'selected="selected"' :'' }>탈퇴회원</option>
                <option value="1" ${vo.mstate == '1' ? 'selected="selected"' :'' } >일반회원</option>
                <option value="2" ${vo.mstate == '2' ? 'selected="selected"' :'' }>VIP</option>
                <option value="3" ${vo.mstate == '3' ? 'selected="selected"' :'' }>VVIP</option>
			</select>
			</td>
		</tr>
		<tr>
			<th id="tt">가입일</th>
			<td>${vo.regdate }</td>
		</tr>
		<tr>
			<th id="tt">회원이름</th>
			<td><input type="text" name="mname" value="${vo.mname }" maxlength="4" id="name"  readonly>
				<input type="button" value="수정" id="btn1" onclick="aa()"></td>
			<th id="tt">전화번호</th>
			<td><input type="text" name="mphone" value="${vo.mphone }" maxlength="11" id="phone"  readonly>
				<input type="button" value="수정" id="btn1" onclick="bb()"></td>
		</tr>
		<tr>
			<th id="tt">지역</th>
			<td><input type="text" name="maddr" value="${vo.maddr }" maxlength="6" id="addr"  readonly>
				<input type="button" value="수정" id="btn1" onclick="cc()"></td>
			<th id="tt">회원비밀번호</th>
			<td><input type="text" name="mpwd" value="${vo.mpwd }" maxlength="16" id="pwd"  readonly>
				<input type="button" value="수정" id="btn1" onclick="dd()"></td>
		</tr>
		<tr>
		<td colspan="4" style="text-align: right;">	<input type="submit" value="확인"> </td>
		</tr>
	</table>
</form>
</body>
</html>