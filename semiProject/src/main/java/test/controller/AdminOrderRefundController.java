package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.AdminOrderDao;
@WebServlet("/admin/refund")
public class AdminOrderRefundController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int odnum=Integer.parseInt(req.getParameter("odnum"));
		AdminOrderDao dao= new AdminOrderDao();
		int n =dao.refundCompleted(odnum);
		if(n>0) {
			req.getRequestDispatcher("/admin/order").forward(req, resp);
		}else {
			resp.sendRedirect(req.getContextPath()+"/myshop/result.jsp");
		}
	}
}
