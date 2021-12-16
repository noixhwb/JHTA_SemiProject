package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.dao.AdminDao;
import test.vo.AdminVo;
import test.vo.MemberVo;
import test.dao.MemberDao;

@WebServlet("/admin/login")
public class AdminLoginController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String aid=req.getParameter("aid");
		String apwd=req.getParameter("apwd");
		String mid=req.getParameter("mid");
		String mpwd=req.getParameter("mpwd");
		//관리자 로그인
		if(aid!=null &&!aid.equals(""))
		{
			System.out.println(aid);
			System.out.println(apwd);
			AdminDao dao=AdminDao.getInstance();
			boolean loginOk=dao.loginAdmin(aid, apwd);
			AdminVo vo=dao.selectDetail(aid);
			if(loginOk==true)
			{
				HttpSession session= req.getSession();
				session.setAttribute("aid", aid);
				session.setAttribute("alevel", vo.getAlevel());
				System.out.println("로그인성공");
				resp.sendRedirect(req.getContextPath()+"/Home");
			}else
			{
				System.out.println("로그인실패");
				req.setAttribute("errMsg", "아이디가 잘못되었습니다.");
				req.getRequestDispatcher("/Home?spage=loginForm.jsp").forward(req, resp);
				
			}
		}
		//회원로그인
		else if(mid!=null &&!mid.equals(""))
		{
			System.out.println("유저로그인 중..");
			System.out.println(mid);
			System.out.println(mpwd);
			
			MemberDao dao=new MemberDao();
			boolean loginOk=dao.loginMember(mid, mpwd);
			MemberVo mvo=dao.select(mid);
			
			System.out.println(loginOk);
			System.out.println("유저아디:" +mid);
			System.out.println("회원상태:" +mvo.getMstate());
			
			if(loginOk==true)
			{
				HttpSession session= req.getSession();
				session.setAttribute("mid", mid);
				session.setAttribute("mpwd", mvo.getMpwd());
				session.setAttribute("mname", mvo.getMname());
				session.setAttribute("maddr", mvo.getMaddr());
				session.setAttribute("mphone", mvo.getMphone());
				session.setAttribute("mstate", mvo.getMstate());
				session.setAttribute("regdate", mvo.getRegdate());
				
				System.out.println("로그인성공");
				resp.sendRedirect(req.getContextPath()+"/Home");
			}else
			{
				System.out.println("로그인실패");
				req.setAttribute("errMsg", "아이디가 잘못되었습니다.");
				req.getRequestDispatcher("/Home?spage=loginForm.jsp").forward(req, resp);
				
			}
			
		}
		
	}
}
