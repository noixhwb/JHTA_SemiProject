<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/common.css">
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="${requestScope.header }" />
		</div>
		<div id="footer">
			<jsp:include page="${requestScope.footer}" />
		</div>
	</div>
</body>
</html>