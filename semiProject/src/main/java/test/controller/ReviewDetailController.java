package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/reviewDetail")
public class ReviewDetailController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String spage=req.getParameter("spage");
		if(spage==null)
		{
			spage="home.jsp";
		}
		String coNum = req.getParameter("coNum");
		req.setAttribute("header", "header.jsp");
		req.setAttribute("menu", "menu.jsp");
		req.setAttribute("main", "/REVIEW/ReviewDetail.jsp?coNum="+coNum);
		req.setAttribute("footer", "footer.jsp");
		req.getRequestDispatcher("/layout.jsp").forward(req, resp);
	}
}
