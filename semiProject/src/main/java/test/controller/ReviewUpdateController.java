package test.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.dao.RevDao;
import test.dao.ReviewDao;
import test.vo.RevVo;
import test.vo.ReviewVo;

@WebServlet("/reviewUpdate")
public class ReviewUpdateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int coNum = Integer.parseInt(req.getParameter("coNum"));
		
		//ReviewDao dao=new ReviewDao();
		//ReviewVo vo = dao.select(coNum);
		
		RevDao dao=new RevDao();
		RevVo vo = dao.selecting(coNum);
		
		String spage=req.getParameter("spage");
		if(spage==null)
		{
			spage="home.jsp";
		}
		
		req.setAttribute("header", "header.jsp");
		req.setAttribute("menu", "menu.jsp");
		if (vo == null) {
			req.setAttribute("result", "fail");
			req.getRequestDispatcher("/REVIEW/Result.jsp").forward(req, resp);
		} else {
			req.setAttribute("vo", vo);
			req.setAttribute("main", "/REVIEW/ReviewUpdateForm.jsp?coNum="+coNum);
		}
		req.setAttribute("footer", "footer.jsp");
		req.getRequestDispatcher("/layout.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String pName = req.getParameter("pName");
		String proSize = req.getParameter("proSize");
		int pdNum = Integer.parseInt(req.getParameter("pdNum"));
		int coNum = Integer.parseInt(req.getParameter("coNum"));
		int odNum = Integer.parseInt(req.getParameter("odNum"));
		String cScore = req.getParameter("cScore");
		String content = req.getParameter("content");
		String mid = req.getParameter("mid");
		
		//ReviewVo vo=new ReviewVo(coNum, odNum, cScore, content, mid, null);
		//ReviewDao dao=new ReviewDao();
		//int n = dao.update(vo);
		
		RevVo vo=new RevVo(pName, proSize, pdNum, coNum, odNum, cScore, content, mid, null);
		RevDao dao=new RevDao();
		int n = dao.updating(vo);
		
		if (n>0) {
			resp.sendRedirect(req.getContextPath()+"/review");
		} else {
			req.setAttribute("result", "fail");
			req.getRequestDispatcher("/REVIEW/Result.jsp").forward(req, resp);
		}
	}
}
