package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.MemberDao;
import test.vo.MemberVo;
@WebServlet("/join")
public class JoinController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath() + "/member/join.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		String mid=req.getParameter("mid");
		String mpwd=req.getParameter("mpwd");
		String mname=req.getParameter("mname");
		String maddr=req.getParameter("maddr");
		String mphone=req.getParameter("mphone");
		
		String mphone1=req.getParameter("mphone1");
		String mphone2=req.getParameter("mphone2");
		String mphone3=req.getParameter("mphone3");
		
		mphone=mphone1+mphone2+mphone3;
		MemberVo vo=new MemberVo(mid, mpwd, mname, maddr, mphone,1,null);
		MemberDao dao=new MemberDao();
		int n=dao.insert(vo);
		
		// 결과응답하기
		if(n>0) {
			req.setAttribute("result","success");
			

		}else {
			req.setAttribute("result","fail");
		}
		req.getRequestDispatcher("/Home?spage=/member/result.jsp").forward(req, resp);
	}
}
