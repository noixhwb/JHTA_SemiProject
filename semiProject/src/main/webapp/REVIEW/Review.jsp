<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>리뷰data.jsp</title>
</head>
<body>
	<%
		//데이터 가져오기
		request.setCharacterEncoding("UTF-8");
	
		String cScore = request.getParameter("cScore");
		String content = request.getParameter("review_content");
		
		//리뷰정보 DB에 저장하기
		
	%>
	평점 : <%=cScore %> <br>
	내용 : <%=content %> <br>
	
	<h3>리뷰 등록이 완료되었습니다!</h3>
</body>
</html>