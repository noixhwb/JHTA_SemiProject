package test.controller;

import java.io.IOException;
import java.sql.Date;

import java.util.ArrayList;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myshopDao.OrderListDao;

import myshopVo.OrderListVo;



@WebServlet("/myshop/orderList")
public class OrderListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		String mid=(String)session.getAttribute("mid");
		System.out.println(mid);
		String spageNum=req.getParameter("pageNum");
		int pageNum=1;
		if(spageNum!=null) {
			pageNum=Integer.parseInt(spageNum);
		}
		int startRow=(pageNum-1)*10+1;
		int endRow=startRow+9;
		OrderListDao dao =new OrderListDao(); 
		ArrayList<OrderListVo> list=dao.list(startRow, endRow,mid);
		int pageCount=(int)Math.ceil(dao.getCount(mid)/10.0);
		int startPage=(pageNum-1)/10*10+1;
		int endPage=startPage+9;
		if(endPage>pageCount) {
			endPage=pageCount;	
		
		}
		
		
		
		req.setAttribute("list", list);
		req.setAttribute("pageCount",pageCount);
		req.setAttribute("startPage",startPage);
		req.setAttribute("endPage",endPage);
		req.setAttribute("pageNum",pageNum);
		
		req.getRequestDispatcher("/Home?spage=/myshop/orderList.jsp").forward(req, resp);
		
		
		
	}
}
