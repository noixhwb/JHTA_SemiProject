package test.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.MemberDao;

@WebServlet("/findid")
public class FindIDController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mphone=req.getParameter("mphone");
		System.out.println("mphone: "+ mphone);
		String mid=null;
			
			MemberDao dao=new MemberDao();
			mid=dao.idselect(mphone);
		System.out.println("mid : "+mid);
		
		//응답을 xml로 하기
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		pw.print("<result>");
		if(mid==null) {
			pw.print("<find>fail</find>");
		}else {
			pw.print("<find>success</find>");
			pw.print("<mid>"+ mid +"</mid>");
		}
		pw.print("</result>");
		//http://localhost:8081/ajax01/findid?email=test@test.com
	}
}