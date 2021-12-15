package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myshopDao.OrderListDao;
@WebServlet("/myshop/refund")
public class OrderRefundController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		OrderListDao dao = new	OrderListDao();
		int odnum=Integer.parseInt(req.getParameter("odnum"));
		int n=dao.refund(odnum);
		if(n>0) {
			req.getRequestDispatcher("/myshop/orderList").forward(req, resp);
		}else {
			resp.sendRedirect(req.getContextPath()+"/myshop/result.jsp");
		}
	}
	
}
