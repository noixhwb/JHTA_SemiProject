<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#loginform
{
   position:relative;
	left:40%;
}
#loginform ul>li {
	float: left;
	margin: 10px;
	display: block;
	
}

#loginform .btn {
	width: 200px;
	height: 45px;
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 2.5px;
	font-weight: 500;
	color: #000;
	background-color: white;
	border: none;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
	cursor: pointer;
	outline: none;
}

#loginform .btn:hover {
	transform: translateY(-7px);
}
#inputform
{
 background-color: #E4E4E4;
 position:absolute;
 top:50px;
 text-align:center;

 
}
#inputform input
{

}
#userlogin {
	display: block;
	margin:50px;
}

#adminlogin {
	display: none;
		margin:50px;
}

/* 	유저로그인 수정 부분 */
	h3 {
		text-align: left;
		margin-bottom: 20px;
		}
		
		
	#tt1{
	width: 250px; height: 20px;
	}
	.tag1{
	width: 100%; height: 100%;
	}
	#loginbt{
	width: 120px; height: 70px;
	}
	#loginbt1{
	width: 90%; height: 100%;
	background-color: black;
	border: 1px solid black;
	color: white;
	cursor: pointer;
	}
	#y{
	height: 20px;
	}
	#y1{
	height: 40px;
	}
	#tt12{
	height: 40px;
	}
	#btn10{
	width: 100%; height: 100%;
	background-color: black;
	color: white;
	border: 1px solid black;
	font-size: 7px;
	cursor: pointer;
	}
	
	/* 	관리자로그인 수정 부분 */
	
	
</style>

<%String errMsg=(String)request.getAttribute("errMsg");
  if(errMsg==null)
  {
	  errMsg="";
  }
%>
<c:choose>
	<c:when test="${ms1 != null }">
		<script type="text/javascript">
			alert('아이디 또는 비밀번호가 잘못되었습니다.');
		</script>
	</c:when>
	
	<c:when test="${ms2 != null }">
		<script type="text/javascript">
			alert('이미 탈퇴한 계정입니다.');
		</script>
	</c:when>
</c:choose>



<div id="loginform">
	<ul>
		<li><input type="button" value="회원로그인" id="btn1" class="btn" onclick="userclickEvent()"></li>
		<li><input type="button" value="관리자로그인" id="btn2" class="btn" onclick="adminclickEvent()"></li>

	</ul>

<div id="inputform">
	<div id="userlogin">
		<form method="post" action="<%=request.getContextPath()%>/admin/login">
		    <h3 >유저로그인</h3>
		<table>
		<tr>
			<th colspan="2" id="tt1"><input type="text" name="mid" class="tag1" placeholder="아이디" onfocus="this.placeholder=''" onblur="this.placeholder='아이디'"><br> </th>	
			<td rowspan="2" id="loginbt"><input type="submit" id="loginbt1" value="로그인"><td>
		</tr>
		
		<tr>	
			<th colspan="2" id="tt1" ><input type="password" name="mpwd" class="tag1" placeholder="비밀번호" onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호'" ></th>
		</tr>	
		
		<tr>
			<th id="y"></th>
		</tr>
		
		<tr>
			<th id="tt12"><a  href="<%=request.getContextPath()%>/Home?spage=/member/join.jsp"><button type="button" id="btn10">회원가입</button></a> </th>
			<th id="tt12"><a  href="<%=request.getContextPath()%>/findidform"><button type="button" id="btn10">아이디찾기</button>   </a></th>
			<th id="tt12"><a  href="<%=request.getContextPath()%>/findpwdform"><button type="button" id="btn10">비밀번호찾기</button> </a></th>
		</tr>
		</table>
		</form>
				
	</div>
	<div id="adminlogin">
		<form method="post" action="<%=request.getContextPath()%>/admin/login">
		<h3>관리자로그인</h3>
		<table>
			<tr>
				<th colspan="2" id="tt1"><input type="text" name="aid" class="tag1" placeholder="아이디" onfocus="this.placeholder=''" onblur="this.placeholder='아이디'" id="aid"></th> 
				<td rowspan="2" id="loginbt"> <input type="submit" id="loginbt1" value="로그인" onclick="check()"></td>
			</tr>
			
			<tr>
				<th colspan="2" id="tt1" ><input type="password" name="apwd" class="tag1" placeholder="비밀번호" onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호'" id="apwd"></th>
			</tr>
		
		
        	<tr>
        	<td colspan="2" style="text-align: center;"><span style="color:red;font-size:10px" id="failaid"><%=errMsg %></span></td>
        	</tr>
        
		</table>
		</form>
		
	</div>

</div>

</div>

<script type="text/javascript">
	var btn1 = document.getElementById("btn1");
	var btn2 = document.getElementById("btn2");

	var div1 = document.getElementById("userlogin");
	var div2 = document.getElementById("adminlogin");
	var btn1 = document.getElementById("btn1");
	var btn2 = document.getElementById("btn2");
	function userclickEvent() {
		div1.style.display = "block";
		div2.style.display = "none";
		btn1.style.backgroundColor="#E4E4E4";
		btn2.style.backgroundColor="white";

	};
	function adminclickEvent() {
		div1.style.display = "none";
		div2.style.display = "block";
		btn2.style.backgroundColor="#E4E4E4";
		btn1.style.backgroundColor="white";
	

	};
	window.onload=function()
	{
		let fail = document.getElementById("failaid").innerText;
		if(fail!=""){
			adminclickEvent();
		}
		else
			{
			userclickEvent();
			}
	}
 
</script>