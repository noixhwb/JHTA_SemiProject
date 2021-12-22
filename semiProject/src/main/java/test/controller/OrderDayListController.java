package test.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myshopDao.OrderListDao;
import myshopVo.OrderListVo;


@WebServlet("/myshop/dayList")
public class OrderDayListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String sdate1=req.getParameter("date1");
		if(sdate1==null) {
			resp.sendRedirect(req.getContextPath()+"/myshop/orderList");
		}
		HttpSession session = req.getSession();
		String mid=(String)session.getAttribute("mid");
		OrderListDao dao =new OrderListDao(); 
		

		
		
		if(sdate1!=null) {
			String sdate2=req.getParameter("date2");
			java.sql.Date date1 = java.sql.Date.valueOf(sdate1);
			java.sql.Date date2 = java.sql.Date.valueOf(sdate2);
			System.out.println(date1);
			System.out.println(date2);
		
				
				String spageNum2=req.getParameter("pageNum2");
				int pageNum2=1;
				if(spageNum2!=null) {
					pageNum2=Integer.parseInt(spageNum2);
				}
				int startRow2=(pageNum2-1)*10+1;
				int endRow2=startRow2+9;
				
				
				int pageCount2=(int)Math.ceil(dao.getDayCount(date1, date2,mid)/10.0);
				int startPage2=(pageNum2-1)/10*10+1;
				int endPage2=startPage2+9;
				if(endPage2>pageCount2) {
					endPage2=pageCount2;	
				
				}
				ArrayList<OrderListVo> list2=dao.decideDay(date1, date2,mid);
				req.setAttribute("date1", date1);
				req.setAttribute("date2", date2);
				req.setAttribute("list2", list2);
				req.setAttribute("pageCount2",pageCount2);
				req.setAttribute("startPage2",startPage2);
				req.setAttribute("endPage2",endPage2);
				req.setAttribute("pageNum2",pageNum2);
				req.getRequestDispatcher("/Home?spage=/myshop/orderList.jsp").forward(req, resp);
			}
		
		
	}
}
