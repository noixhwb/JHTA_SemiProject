<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" action="${ pageContext.request.contextPath}/admin/add">
아이디<input type="text" name="aid"><br>
비밀번호<input type="password" name="apwd"><br>
권한<input type="text" name="alevel"><br>

<input type="submit" value="추가">
</form>