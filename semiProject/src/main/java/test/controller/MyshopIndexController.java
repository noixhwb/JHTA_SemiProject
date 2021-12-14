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
@WebServlet("/myshop/index")
public class MyshopIndexController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		OrderListDao dao = new	OrderListDao();
		
		ArrayList<OrdersVo> list =dao.recentList();
		req.setAttribute("list", list);
		
		
		req.getRequestDispatcher("/Home?spage=/myshop/index.jsp").forward(req, resp);
		
		
	}
}
