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
		req.setAttribute("header","../header.jsp");
		req.setAttribute("menu", "../menu.jsp");
		req.setAttribute("main", "/myshop/index.jsp");
		req.setAttribute("footer", "../footer.jsp");
		req.getRequestDispatcher("/myshop/main.jsp").forward(req, resp);
	}
}
