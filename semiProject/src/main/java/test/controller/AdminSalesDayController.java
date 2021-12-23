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
@WebServlet("/admin/salesDay")
public class AdminSalesDayController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AdminOrderDao dao =new AdminOrderDao();
		ArrayList<OrderListVo> list2=dao.getDaysales();
		ArrayList<OrderListVo> list3=dao.getMonsales();
		req.setAttribute("list2", list2);
		req.setAttribute("list3", list3);
		req.getRequestDispatcher("/Home?spage=/admin/sales.jsp").forward(req, resp);
		
		
	}
}
