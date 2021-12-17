<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String pName=request.getParameter("pName");
String pContent=request.getParameter("pContent");
String cName=request.getParameter("cName");
String pPrice=request.getParameter("pPrice");
String snum=request.getParameter("num");
int num=0;
if(pName==null)
{
	pName="";
	pContent="";
	cName="";
	pPrice="";
}
if(snum!=null)
{
	num=Integer.parseInt(snum);
}

%>
<form method="post" action="productInsert.jsp">
<h1>제품 등록</h1>
<!-- 카테고리 -->
<select name="selectCg">
	<option value="1">상의</option>
	<option value="2">하의</option>
	<option value="3">아우터</option>
</select><br>
<!-- 상세 -->
<div>
<select name="cName">
	<option value="니트">니트</option>
	<option value="티셔츠">티셔츠</option>
</select>
</div>
<!-- 제품명 -->

제품명:<input type="text" name="pName" value="<%=pName%>"><br>
<!-- 제품가격 -->
제품가격<input type="text" name="pPrice" value="<%=pPrice%>"><br>
<!-- 제품상세 -->
제품상세내용<textarea rows="10" cols="50" name="pContent"><%=pContent%></textarea><br>
<input type="number" name="num" value="<%=snum%>">
<input type="submit" value="확인">
</form>
<form method="post" action="${ pageContext.request.contextPath}/admin/productInsert" enctype="multipart/form-data">
<!-- 상세이미지 -->
<input type="hidden" name="pName" value="<%=pName%>">
<input type="hidden" name="pPrice" value="<%=pPrice%>">
<input type="hidden" name="pContent" value="<%=pContent%>">
<input type="hidden" name="cName" value="<%=cName%>">


<%
for (int i = 1; i <= num; i++) {
%>
첨부파일<%=i%><input type="text"><input type="file" name="file<%=i%>">
<br>
<%
}
%>
<!-- 썸네일이미지 -->

대표이미지<input type="file" name="file"><br>

  <input type="submit" value="전송">
</form>

<!-- 제품사이즈 종류 -->

