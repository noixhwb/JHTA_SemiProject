package test.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.MemberDao;
@WebServlet("/findpwd")
public class FindPwdController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mid=req.getParameter("mid");
		String mphone=req.getParameter("mphone");
		
		System.out.println(mid);
		System.out.println(mphone);
		
		String mpwd=null;
			
			MemberDao dao=new MemberDao();
			mpwd=dao.pwdselect(mid,mphone);
		System.out.println("mpwd : "+mpwd);
		
		//응답을 xml로 하기
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		pw.print("<result>");
		if(mid==null) {
			pw.print("<find>fail</find>");
		}else {
			pw.print("<find>success</find>");
			pw.print("<mpwd>"+ mpwd +"</mpwd>");
		}
		pw.print("</result>");
	
	}
}

