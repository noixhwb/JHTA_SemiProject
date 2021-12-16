<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
	#wrap #mypage_category li{
		list-style:none; display: inline-block;
	}
	#wrap #box1 li{
		list-style:none; display: inline-block;
	}
	#wrap #box1 img{
		width:50px; height: 50px; 
	}
	#wrap #box1{
		 width:500px; text-align: center;display: inline-block; padding-bottom: 20px;
	}
	#wrap{
		margin:0px	; padding: 0px; text-align: center;
		

	
	}
	#mypage_category{
	
	}
	#wrap #title #box2{
		 text-align: center; width:500px; height:200px;
	}
	#wrap #title{
		padding-bottom: 20px;
	}
	
	#wrap #box3{
		 width:500px; text-align: center; height:200px;
		display: inline-block; border: 1px thin black;
	}
	#wrap #box3 li{
		list-style:none; display: inline-block; 
	}
</style>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>

<%
	String mid=(String)session.getAttribute("mid");
	String mpwd=(String)session.getAttribute("mpwd");
	String mname=(String)session.getAttribute("mname");
	String maddr=(String)session.getAttribute("maddr");
	String mphone=(String)session.getAttribute("mphone");
	int mstate=(int)session.getAttribute("mstate");
	
	String a="";
	if(mstate == 1){
		a="일반회원";
	}else if(mstate == 0){
		a="탈퇴회원";
	}
%>

<script type="text/javascript">


</script>



<div id="wrap">
	<div id="mypage_category">
		<ul>
			<li><a href="${cp}/Home">home</a>></li>
			<li><a href="${cp}/myshop/index">마이페이지</a>></li>
			<li><strong>회원정보수정</strong></li>
		</ul>
	</div>
	<div id ="box1">
		<ul>
			<li><a href="${cp}/myshop/orderList"><img src="${cp}/images/order.png"><br>주문조회</a></li>
			<li><a href="${cp}/member/update"><img src="${cp}/images/member.png"><br>회원정보수정</a></li>
			<li><a href=""><img src="${cp}/images/shopping.png"><br>장바구니</a></li>
			<li><a href=""><img src="${cp}/images/board.png"><br>리뷰관리</a></li>
		</ul>
	</div>
	<div id="title">
		<h4>회원정보수정</h4>
		
	
		<span id ="box2">
			<img src="${cp}/images/member.png">
			저희쇼핑몰을 이용해주셔서 감사합니다. <%=mname %> 님은 [<%=a %>] 회원이십니다.
		</span>
	</div>
	
	
	
	<div id="box3">
		<table border="1" width="500">
			<tr>
				<th>아이디</th>
				<th><%=mid %></th>
			</tr>
			<tr>
				<th>비밀번호</th>
				<th><input type="password" name="mpwd" id="mpwd" maxlength="12" > </th>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<th><input type="password" name="mpwd" id="mpwd" maxlength="12" > </th>
			</tr>
			<tr>
				<th>이름</th>
				<th><%=mname %></th>
			</tr>
			<tr>
				<th>주소</th>
				<th><input type="text" name="maddr" id="maddr"></th>
			</tr>
			<tr>
				<th>휴대전화</th>
				            <td>
            	   <select name="mphone1">
				        <option value="010">010</option>
				        <option value="011">011</option>
				        <option value="016">016</option>
				        <option value="017">017</option>
				    </select> -
            	<input type="text" name="mphone2" id="mphone1"maxlength="4" size="2">
            	-
            	<input type="text" name="mphone3" id="mphone1"maxlength="4" size="2">
            </td>
			</tr>
		   <tr>
	            <th>
	                <p align="right">&nbsp;</p>
	            </th>
	           	<td>
		            <input type="submit" value="회원정보수정">
		            <input type="reset" value="취소">
	            </td>
       		</tr>
		</table>	

		
	</div>
	
	
</div>	