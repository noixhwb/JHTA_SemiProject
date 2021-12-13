package test.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myshopDao.OrderListDao;

import myshopVo.OrderListVo;
import myshopVo.OrdersVo;

@WebServlet("/myshop/orderList")
public class OrderListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		OrderListDao dao = new OrderListDao();
		
		ArrayList<OrderListVo> list=dao.orderlist();
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/Home?spage=/myshop/orderList.jsp").forward(req, resp);
		
		
		
	}
}
