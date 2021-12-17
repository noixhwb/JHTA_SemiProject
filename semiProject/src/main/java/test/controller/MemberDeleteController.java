package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.MemberDao;
@WebServlet("/member/delete")
public class MemberDeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mid =req.getParameter("mid");
			
		MemberDao dao=new MemberDao();
		int n=dao.delete(mid);
		
		if(n > 0) {
			System.out.println("탈퇴성공");
			
			req.getSession().invalidate();
			resp.sendRedirect(req.getContextPath()+"/Home");
		}else {
			System.out.println("회원탈퇴오류발생");
			
		}
			
	}
}
