package test.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.CartDao;
import test.vo.CartVo;
@WebServlet("/cartinsert")
public class CartInsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header", "header.jsp");
		req.setAttribute("footer", "footer.jsp");
		String mid=(String)req.getSession().getAttribute("mid");
		
		CartDao dao=new CartDao();
		System.out.println(req.getParameter("pdNum"));
		int num = Integer.parseInt(String.valueOf(req.getParameter("num")));
		String pdNum = req.getParameter("pdNum");
		
		dao.insertCart(pdNum,mid,num);
		ArrayList<CartVo> list=dao.selectCartList((String)req.getSession().getAttribute("mid"));
		req.setAttribute("list", list);
		req.getRequestDispatcher("cart.jsp").forward(req, resp);
	}
}
