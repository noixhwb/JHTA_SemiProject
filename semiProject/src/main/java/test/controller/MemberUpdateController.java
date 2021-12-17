package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.dao.MemberDao;
import test.vo.MemberVo;
@WebServlet("/member/update")
public class MemberUpdateController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session= req.getSession();
		
		String mid=(String)session.getAttribute("mid");
		
		MemberDao dao=new MemberDao();
		MemberVo vo = dao.select(mid);
		
		session.setAttribute("mpwd", vo.getMpwd());
		session.setAttribute("mname", vo.getMname());
		session.setAttribute("maddr", vo.getMaddr());
		session.setAttribute("mphone", vo.getMphone());
		session.setAttribute("mstate", vo.getMstate());
		
		req.getRequestDispatcher("/Home?spage=/member/update.jsp").forward(req, resp);
	}
}
