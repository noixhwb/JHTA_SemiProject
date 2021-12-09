package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Home")
public class HomeController extends HttpServlet{
 @Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	 req.setAttribute("header", "header.jsp");
	 req.setAttribute("menu", "menu.jsp");
	 req.setAttribute("main", "home.jsp");
	 req.setAttribute("footer", "footer.jsp");
	 req.getRequestDispatcher("/layout.jsp").forward(req, resp);
}
}
