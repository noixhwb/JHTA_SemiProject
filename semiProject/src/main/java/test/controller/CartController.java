package test.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.AdminDao;
import test.dao.CartDao;
import test.dao.MemberDao;
import test.vo.CartVo;
@WebServlet("/cart")
public class CartController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header", "header.jsp");
		req.setAttribute("footer", "footer.jsp");

		CartDao dao = new CartDao();
		ArrayList<CartVo> list = dao.selectCartList((String)req.getSession().getAttribute("mid"));
		req.setAttribute("list", list);
		System.out.println(list);
		req.getRequestDispatcher("cart.jsp").forward(req, resp);
		
	}

}
