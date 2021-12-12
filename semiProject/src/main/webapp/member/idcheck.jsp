<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="db.JdbcUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	String mid=request.getParameter("mid");
	boolean exist=false;
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try{
		con=JdbcUtil.getCon();
		String sql="select * from member_s where mid=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,mid);
		rs=pstmt.executeQuery();
		if(rs.next()){
			exist=true;
		}
	}catch(SQLException s){
		s.printStackTrace();
	}finally{
		JdbcUtil.close(con, pstmt, rs);
	}
	// xml로 응답하기
	response.setContentType("text/xml;charset=utf-8");
	PrintWriter pw=response.getWriter();
	pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
	pw.print("<result>");
	pw.print("<exist>"+ exist + "</exist>");
	pw.print("</result>");
%>

