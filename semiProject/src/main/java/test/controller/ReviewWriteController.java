package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.PrevDao;
import test.dao.RevDao;
import test.dao.ReviewDao;
import test.vo.PrevVo;
import test.vo.RevVo;
import test.vo.ReviewVo;

@WebServlet("/reviewWrite")
public class ReviewWriteController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int odnum = Integer.parseInt(req.getParameter("odNum"));
		System.out.println(odnum);
		
		PrevDao dao=new PrevDao();
		PrevVo vo = dao.select(odnum);
		//req.setAttribute("vo", vo);
		//System.out.println("@@@@@"+vo);
		
		if (vo == null) {
			req.setAttribute("result", "fail");
			req.getRequestDispatcher("/Home?spage=/REVIEW/Result.jsp").forward(req, resp);
		} else {
			req.setAttribute("vo", vo);
			req.getRequestDispatcher("/Home?spage=/REVIEW/ReviewWrite.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//int coNum = Integer.parseInt(req.getParameter("coNum"));
		int odNum = Integer.parseInt(req.getParameter("odNum"));
		String cScore = req.getParameter("cScore");
		String content = req.getParameter("content");
		String mid = req.getParameter("mid");
		
		ReviewVo vo=new ReviewVo(0, odNum, cScore, content, mid, null);
		ReviewDao dao=new ReviewDao();
		int n = dao.insert(vo);
		System.out.println(n);
		System.out.println("@@@@@"+vo);
		if (n>0) {
			req.setAttribute("result", "success");
			req.getRequestDispatcher("/Home?spage=/review").forward(req, resp);
		} else {
			req.setAttribute("result", "fail");
			req.getRequestDispatcher("/Home?spage=/REVIEW/Result.jsp").forward(req, resp);
		}
	}
}
