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
<div>
<input type="checkbox">전체
<input type="checkbox">관리자명
<!-- 클릭 시 관리자 추가 창뜸 -->
<a href="${cp }/admin/add">관리자추가</a>

</div>
<!-- 리스트 -->
 <div>
 <form name="check">
 <input type="button" value="전체선택" onclick="checkAll()">
  <input type="button" value="전체삭제" onclick=><br>
 <table class="admintable"  >
   <tr>
     <th width="50px">check</th>
  <th>아이디</th>
    <th>생성일</th>  
        <th>수정</th>  
            <th>삭제</th>  
  </tr>
  <c:forEach var="vo" items="${list }">
     <tr>
        <td style="text-align:center;"><input type="checkbox" name="chk" ></td>
        <td>${vo.aId }</td>
          <td>${vo.regdate }</td>
                  <td><a href="<%=request.getContextPath()%>/admin/update?aid=${vo.aId }">수정</a></td>
              <td><a href="<%=request.getContextPath()%>/admin/delete?aid=${vo.aId }">삭제</a></td>
            </tr>
  </c:forEach>
  
 </table>
 </form>
 </div>
 
 <!-- 페이징 처리 -->
<div style="text-align: center;">
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
 </c:otherwise>
</c:choose>
</div>

 <!-- 전체선택 기능구현(오류해결중) -->
 <script type="text/javascript">

function checkAll() {
	let chk=document.getElementsByName("chk");

	for(var i=0;i=document.check.length;i++)
		{
		if(document.check.elements[i].checked !=true)
			{
			document.check.elements[i].checked=true;
			}
		
		}
	
}


</script>