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
@WebServlet("/myshop/dayList")
public class OrderDayListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		OrderListDao dao = new OrderListDao();
		ArrayList<OrderListVo> list6=dao.M6List();
		ArrayList<OrderListVo> list3=dao.M3List();
		ArrayList<OrderListVo> listT=dao.todayList();
		req.setAttribute("list6", list6);
		req.setAttribute("list3", list3);
		req.setAttribute("listT", listT);
		
	}
}
