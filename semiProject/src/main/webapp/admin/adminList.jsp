<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

.admintable
{
margin:50px;
  border-collapse: collapse;
width: 40%;
position: absolute;
left: 28%;
text-align: center;

}
.admintable th
{
background-color: black;
height:30px;
color:white;
border-left:1px solid white;
}
.admintable td
{
border-bottom:1px solid black;
height:30px;

}
.admintable #m:hover
{
background-color: #E4E4E4;

}
</style>
<div id="adminlist">
<c:set var="cp" value="${ pageContext.request.contextPath}"/>
<c:choose>
 <c:when test="${requestScope.errMsg!=null}">
 <h1>${requestScope.errMsg}</h1>
 </c:when>
 <c:otherwise>
 <h1 style="text-align: center;">관리자 목록</h1>
<!-- 상단 checkBox -->

<!-- 리스트 -->
 <div>

 <table class="admintable"  >
   <tr>
     <th width="50px">check</th>
  <th>아이디</th>
    <th>생성일</th>  
        <th>수정</th>  
            <th>삭제</th>  
  </tr>
  <form method="post" action="${ pageContext.request.contextPath}/admin/delete">
  <c:forEach var="vo" items="${list }">
     <tr id="m">
        <td style="text-align:center;"><input type="checkbox" name="chk"value="select" onchange="create(this)"></td>
        <td>${vo.aId }<input type="hidden" value="${vo.aId }" id="sel"></td>
          <td>${vo.regdate }</td>
                  <td><a href="<%=request.getContextPath()%>/admin/update?aid=${vo.aId }">수정</a></td>
              <td><a href="<%=request.getContextPath()%>/admin/delete?aid=${vo.aId }">삭제</a></td>
            </tr>
  </c:forEach>

  <tr>  
  <td colspan="5" style="padding:25px;">전체선택<input type="checkbox" id="chkAll" onclick="checkAll(this)"value="전체선택">
  <input type="submit" value="선택삭제">
  <!-- 클릭 시 관리자 추가 창뜸 -->
   <a href="${cp }/admin/add" style="border:1px solid black;">관리자추가
   <br>
   </a>
  </td>
  </tr>
  </form>
  
 </table>

 </div>
 </c:otherwise>
</c:choose>
<!-- 페이징 처리 -->
<div style="text-align: center;margin:500px ;">
   <c:if test="${startPage>10 }">
     <a href="${cp }/admin/list?pageNum=${startPage-1}">이전페이지</a>
   </c:if>
   <c:forEach var="i" begin="${startPage }" end="${endPage }">
      <c:choose>
         <c:when test="${pageNum==i }">
            <a href="${cp }/admin/list?pageNum=${i}"><span style="color:red">${i }</span></a>
         </c:when>
         <c:otherwise>
            <a href="${cp }/admin/list?pageNum=${i}"><span style="color:gray">${i }</span></a>
         </c:otherwise>
      </c:choose> 
   </c:forEach>
   <c:if test="${endPage<pageCount}">
     <a href="${cp }/admin/list?pageNum=${endPage+1}">다음페이지</a>
   </c:if>
</div>
</div>


 <!-- 전체선택 기능구현(오류해결중) -->
 <script type="text/javascript">

function checkAll(e) {
	if (e.checked == true) {
		for(var i=0 ; i<document.getElementsByName("chk").length ; i++) {
			document.getElementsByName("chk")[i].checked = true;
		}
		
	}
	if (e.checked == false) {
		for(var i=0 ; i<document.getElementsByName("chk").length ; i++) {
			document.getElementsByName("chk")[i].checked = false;
		}
	}	
}
function create(e)
{
	let a=document.getElementsByName("sel");
	if (e.checked == true) {
		let aid=document.createElement("input");
		aid.setAttribute("type", "text");
		aid.setAttribute("value", a);
		aid.setAttribute("name", "aid");
		e.appendChild(aid);
	}

	
}


</script>