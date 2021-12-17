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
@WebServlet("/member/updateOk")
public class MemberUpdateOkController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String mid=req.getParameter("mid");
		String mpwd=req.getParameter("mpwd");
		String maddr=req.getParameter("maddr");
		String mphone=req.getParameter("mphone");
		String mphone1=req.getParameter("mphone1");
		String mphone2=req.getParameter("mphone2");
		String mphone3=req.getParameter("mphone3");
		mphone=mphone1+mphone2+mphone3;
		
		String mname=req.getParameter("mname");
		int mstate=Integer.parseInt(req.getParameter("mstate"));
		
		System.out.println("mid : " + mid);
		System.out.println("mpwd : " + mpwd);
		System.out.println("mname : " + mname);
		System.out.println("maddr : " + maddr);
		System.out.println("mphone : " + mphone);
		System.out.println("mstate : " + mstate);
		
		
		MemberDao dao=new MemberDao();
		MemberVo vo=new MemberVo(mid,mpwd,mname,maddr,mphone,mstate,null);
		int n = dao.update(vo);
		
		System.out.println("n의 결과 : " + n);
		
		if (n> 0) { 
			
			HttpSession session= req.getSession();
			req.setAttribute("mpwd", vo.getMpwd());
			req.setAttribute("mname", vo.getMname());
			req.setAttribute("maddr", vo.getMaddr());
			req.setAttribute("mphone", vo.getMphone());
			req.setAttribute("mstate", vo.getMstate());
			resp.sendRedirect(req.getContextPath()+"/Home");
		}else {
			req.setAttribute("ff", "정보수정 실패");
			req.getRequestDispatcher("/Home?spage=/member/update.jsp").forward(req, resp);
		}
	}
}
