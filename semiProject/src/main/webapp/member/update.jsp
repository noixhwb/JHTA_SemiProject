<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>

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
	#wrap #box4{
		width:500px; text-align: center; height:500px;
	}
	
	#wrap #box3{
			z-index: 50;
		 width:500px; text-align: center; height:200px;
		display: inline-block; border: 1px thin black;
		position: static;
	}
		.btn {
			
			background-color: black;
			padding: 15px 25px;
			margin: 2px;
			border: none;
			color: white;
			text-align: right;
			text-decoration: none;
			font-size: 16px;
			display: inline-block;
			cursor: pointer;
		}
		div.b1{
			position: relative;
			left : 0px;
			bottom : -120px;
		}
		.btn1 {
			border: 2px solid black;
			background-color: #ffffff;
			padding: 15px 25px;
			margin: 2px;
			color: black;
			text-align: right;
			text-decoration: none;
			font-size: 16px;
			display: inline-block;
			cursor: pointer;
		}
		th,td{
			text-align: left;
			padding: 10px;
			font-weight: 700;
			border-bottom: 1px solid #D9DDE2;
		}
		#tb{
		border-bottom:#ffffff;
		font-style: italic;
		color:#DE0341;
		}
		#ipp{
		height:20px;
        font-size:12px;
        
		}
		#ipa{
		height:20px;
		width:100px;
        font-size:12px;
		}
		#ipn{
		height:20px;
		width:80px;
        font-size:12px;
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
	}else if(mstate == 2){
		a="VIP";
	}else if(mstate == 3){
		a="VVIP";
	}
	else{
		a="탈퇴회원";
	}
	
	String mphone1 = mphone.substring(0, 3);
	String mphone2 = mphone.substring(3, 7);
	String mphone3 = mphone.substring(7, 11);
	
	System.out.println(mphone1 + mphone2 + mphone3);
	
%>

<script type="text/javascript">

	/* 회원탈퇴시 실행되는 메소드 */
	function by() {
		
		var res = confirm("회원탈퇴시 제품 환불이 불가능합니다");
		
		if(res){
			alert("탈퇴처리되었습니다. 그동안 이용해주셔서 감사합니다.");
			
			location.href="<%=request.getContextPath() %>/member/delete?mid=<%=mid%>";	
			
		}else{
		}
		
	}
	

	
	/* 정보수정 유효성검사 */
	function gogo() {
		
		if(f.mpwd.value ==""){
			alert("비밀번호를 입력하지 않았습니다.")
			f.mpwd.focus();
			return false;
		}
		if(f.mpwd1.value ==""){
			alert("비밀번호를 입력하지 않았습니다.")
			f.mpwd1.focus();
			return false;
		}
		
		
	    if (document.f.mpwd.value.indexOf(" ") >= 0) {
	        alert("비밀번호에 공백을 사용할 수 없습니다.")
	        document.f.mpwd.focus();
	        document.f.mpwd.select()
	        return false;
	    }
	    if (document.f.mpwd1.value.indexOf(" ") >= 0) {
	        alert("비밀번호에 공백을 사용할 수 없습니다.")
	        document.f.mpwd1.focus();
	        document.f.mpwd1.select()
	        return false;
	    }
		
		
	    if(document.f.mpwd.value.length<8){
	        alert("비밀번호를 8자~16자 사이 입력해주십시오.")
	        document.f.mpwd.focus();
	        return false;
	  	  }
	    if(document.f.mpwd1.value.length<8){
	        alert("비밀번호를 8자~16자 사이 입력해주십시오.")
	        document.f.mpwd1.focus();
	        return false;
	  	  }
	    
	    if (f.mpwd.value != f.mpwd1.value) {
	        alert("비밀번호가 일치하지 않습니다")
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
			if (document.f.maddr.value == "") {
		        alert("주소를 입력하지 않았습니다.")
		        document.f.maddr.focus();
		        return false;
		    }
		}
	
	
	
	
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
			<li><a href="${cp}/review"><img src="${cp}/images/board.png"><br>리뷰관리</a></li>
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
	<form action="<%=request.getContextPath() %>/member/updateOk" method="post" name="f"
	onsubmit="return gogo();">
		<input type="hidden" name="mid" value="<%=mid %>" >
		<input type="hidden" name="mstate" value="<%=mstate %>" >
		
		<table  width="600">
			<tr>
				<th>아이디</th>
				<td> <h4><%=mid %></h4> </td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="mpwd" id="ipp" maxlength="12" value="<%=mpwd %>"> </td>
				<td id="tb">8자~16자 사이 입력해주세요</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="mpwd1" id="ipp" maxlength="12" value="<%=mpwd %>" > </td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="mname" id="ipn"value="<%=mname %>" readonly><br></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="maddr" id="ipa" value="<%=maddr %>" maxlength="6"></td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td>
            	   <select name="mphone1" id="ipp">
				        <option value="010">010</option>
				        <option value="011">011</option>
				        <option value="016">016</option>
				        <option value="017">017</option>
				    </select> -
            	<input type="text" name="mphone2" id="ipp"maxlength="4" size="2" value="<%=mphone2 %>">
            	-
            	<input type="text" name="mphone3" id="ipp"maxlength="4" size="2" value="<%=mphone3 %>">
           		</td>
			</tr>
		   	<tr>
	            <th>
	                <p align="right">&nbsp;</p>
	            </th>
	            <td>
		            <input type="submit" value="회원정보수정" class="btn">
		        </td>
			</tr>
		
		</table>	
	</form>
	
	</div>
	
	<div class="b1" align="right"><input type="button" value="회원탈퇴" class="btn1" onclick="by()"></div>
	
	<div id="box4"></div>
	
	
</div>	