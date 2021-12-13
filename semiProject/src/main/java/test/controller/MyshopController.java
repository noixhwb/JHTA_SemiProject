package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/myshop/main")
public class MyshopController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String spage=req.getParameter("spage");
		req.setAttribute("main", spage);
		
		req.getRequestDispatcher("/layout.jsp").forward(req, resp);
	}
}
