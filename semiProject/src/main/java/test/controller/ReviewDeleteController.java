package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.ReviewDao;
import test.vo.ReviewVo;

@WebServlet("/reviewDelete")
public class ReviewDeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int coNum = Integer.parseInt(req.getParameter("coNum"));
		
		ReviewDao dao=new ReviewDao();
		int n = dao.delete(coNum);
		
		if (n>0) {
			resp.sendRedirect(req.getContextPath()+"/review");
		} else {
			req.setAttribute("result", "fail");
			req.getRequestDispatcher("/REVIEW/Result.jsp").forward(req, resp);
		}
	}
}
