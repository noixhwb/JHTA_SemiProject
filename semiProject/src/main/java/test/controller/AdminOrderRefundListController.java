package test.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myshopVo.OrderListVo;
import test.dao.AdminOrderDao;
@WebServlet("/admin/refundList")
public class AdminOrderRefundListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AdminOrderDao dao= new AdminOrderDao();
		ArrayList<OrderListVo> list2=dao.refundList();
		req.setAttribute("list2", list2);
		req.getRequestDispatcher("/Home?spage=/admin/order.jsp").forward(req, resp);
	
		
	}
}
