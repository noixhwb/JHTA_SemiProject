<%@page import="test.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 table,tr,th,td{
 	border:1px solid black;
 	margin-left: 12%;
 }
 th {
 	text-align: left;
 	color:white;
 	background-color: black;
 	
 }
 td {
 	text-align: left;
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

</script>
</head>
<body>

<%
	MemberVo vo=new MemberVo();
 int a=vo.getMstate();
%>
<form method="post" action="<%=request.getContextPath() %>/member/update10">
			<input type="hidden" name="mid" value="${vo.mid }">
	<table>	
		<tr>
			<th>회원아이디</th>
			<td>${vo.mid }</td>
			<td colspan="2" rowspan="3"></td>
		</tr>
		<tr>
			<th>회원등급</th>
			<td><select name="mstate" id=state >
				<option value="0" ${vo.mstate == '0' ? 'selected="selected"' :'' }>탈퇴회원</option>
                <option value="1" ${vo.mstate == '1' ? 'selected="selected"' :'' } >일반회원</option>
                <option value="2" ${vo.mstate == '2' ? 'selected="selected"' :'' }>VIP</option>
                <option value="3" ${vo.mstate == '3' ? 'selected="selected"' :'' }>VVIP</option>
			</select>
			</td>
		</tr>
		<tr>
			<th>가입일</th>
			<td>${vo.regdate }</td>
		</tr>
		<tr>
			<th>회원이름</th>
			<td><input type="text" name="mname" value="${vo.mname }" maxlength="4" id="name" size="10" readonly>
				<input type="button" value="수정" onclick="aa()"></td>
			<th>전화번호</th>
			<td><input type="text" name="mphone" value="${vo.mphone }" maxlength="11" id="phone"  readonly>
				<input type="button" value="수정" onclick="bb()"></td>
		</tr>
		<tr>
			<th>지역</th>
			<td><input type="text" name="maddr" value="${vo.maddr }" maxlength="6" id="addr"  readonly>
				<input type="button" value="수정" onclick="cc()"></td>
			<th>회원비밀번호</th>
			<td><input type="text" name="mpwd" value="${vo.mpwd }" maxlength="16" id="pwd"  readonly>
				<input type="button" value="수정" onclick="dd()"></td>
		</tr>
		<tr>
		<td colspan="4" style="text-align: right;">	<input type="submit" value="확인"> </td>
		</tr>
	</table>
</form>
</body>
</html>