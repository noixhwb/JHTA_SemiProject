package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.ReviewDao;
import test.vo.ReviewVo;

@WebServlet("/reviewWrite")
public class ReviewWriteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath()+"/REVIEW/ReviewWrite.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String cScore = req.getParameter("cScore");
		String content = req.getParameter("content");
		
		ReviewVo vo=new ReviewVo(Integer.parseInt(null), Integer.parseInt(null), cScore, content, null, null);
		ReviewDao dao=new ReviewDao();
		int n = dao.insert(vo);
		
		if (n>0) {
			req.setAttribute("result", "success");
		} else {
			req.setAttribute("result", "fail");
		}
		req.getRequestDispatcher("/REVIEW/Result.jsp").forward(req, resp);
	}
}
