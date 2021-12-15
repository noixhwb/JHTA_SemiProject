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
		OrderListDao dao = new	OrderListDao();
		String today=req.getParameter("today");
		String m3=req.getParameter("m3");
		String m6=req.getParameter("m6");
		String All=req.getParameter("ALL");
		if(today!=null){
			ArrayList<OrderListVo> listT=dao.todayList();
			req.setAttribute("listT", listT);
		}else if(m3!=null) {
			ArrayList<OrderListVo> list3=dao.M3List();
			req.setAttribute("list3", list3);
		}else if(m6!=null){
			ArrayList<OrderListVo> list6=dao.M6List();
			req.setAttribute("list6", list6);
			
		}else if(All!=null) {
			req.getRequestDispatcher("/myshop/orderList").forward(req, resp);
		}
		
		
		req.getRequestDispatcher("/Home?spage=/myshop/orderList.jsp").forward(req, resp);
		
	}
}
