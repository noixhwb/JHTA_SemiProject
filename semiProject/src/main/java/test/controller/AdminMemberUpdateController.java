package test.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.MemberDao;
import test.vo.MemberVo;
@WebServlet("/member/update10")
public class AdminMemberUpdateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mid=req.getParameter("mid");
		MemberDao dao=new MemberDao();
		MemberVo vo=dao.adminselect(mid);
		
		if(vo==null) {
			req.setAttribute("rr", "no");
			req.getRequestDispatcher("/Home?spage=/admin/memberresult.jsp").forward(req, resp);
		}else {
			req.setAttribute("vo", vo);
			req.getRequestDispatcher("/Home?spage=/admin/memberupdateForm.jsp").forward(req, resp);
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String mid=req.getParameter("mid");
		String mpwd=req.getParameter("mpwd");
		String mname=req.getParameter("mname");
		String maddr=req.getParameter("maddr");
		String mphone=req.getParameter("mphone");
		int mstate=Integer.parseInt(req.getParameter("mstate"));
		
		MemberDao dao=new MemberDao();
		MemberVo vo=new MemberVo(mid,mpwd,mname,maddr,mphone,mstate,null); 
		
		int n = dao.adminupdate(vo);
		
		if(n>0) {
			req.setAttribute("rr", "ok");
		}else {
			req.setAttribute("rr", "no");
		}
		req.getRequestDispatcher("/Home?spage=/admin/memberresult.jsp").forward(req, resp);
	}
}