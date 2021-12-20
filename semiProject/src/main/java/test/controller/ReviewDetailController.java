package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.RevDao;
import test.dao.ReviewDao;
import test.vo.RevVo;
import test.vo.ReviewVo;

@WebServlet("/reviewDetail")
public class ReviewDetailController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int coNum = Integer.parseInt(req.getParameter("coNum"));
		
		//ReviewDao dao=new ReviewDao();
		//ReviewVo vo = dao.select(coNum);
		//req.setAttribute("vo", vo);
		
		RevDao dao=new RevDao();
		RevVo vo = dao.selecting(coNum);
		req.setAttribute("vo", vo);
		
		String spage=req.getParameter("spage");
		if(spage==null)
		{
			spage="home.jsp";
		}
		
		req.setAttribute("header", "header.jsp");
		req.setAttribute("menu", "menu.jsp");
		req.setAttribute("main", "/REVIEW/ReviewDetail.jsp");
		req.setAttribute("footer", "footer.jsp");
		req.getRequestDispatcher("/layout.jsp").forward(req, resp);
	}
}
