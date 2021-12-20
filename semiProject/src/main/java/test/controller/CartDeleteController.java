package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.CartDao;
@WebServlet("/delete")
public class CartDeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("cCartNum");
		CartDao dao=new CartDao();
		int n=dao.delete(id);
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/cart");
		}else {
			req.setAttribute("result", "fail");
			req.getRequestDispatcher("/Home").forward(req, resp);
		}
	}
}
