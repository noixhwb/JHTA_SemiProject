package test.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.MyoDao;
import test.dao.MyordDao;
import test.dao.MyorderDao;
import test.vo.MyoVo;
import test.vo.MyordVo;
import test.vo.MyorderVo;

@WebServlet("/myorderOk2")
public class MyorderOkController2 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//주문테이블
		String mId = (String)req.getSession().getAttribute("mid");
		int totalSales = Integer.parseInt(req.getParameter("pricetotal"));
		String delocation = req.getParameter("whereto");
		
		MyoDao dao=new MyoDao();
		MyoVo vo=new MyoVo(0, mId, totalSales, delocation, null);
		int n = dao.insertOrders(vo);
		
		//주문상세테이블 추가
		int oNum = dao.getOnum();
		int pdNum=1;
		int dCount=1;
		int dPrice=1;
		MyordVo myordvo=new MyordVo(0, oNum, pdNum, dCount, dPrice, 1);
		MyordDao myorddao=new MyordDao();
		int nn = myorddao.insertOrderdetail(myordvo);
		
		//주문,주문상세 조인한 주문내역 보여주기
		//MyorderDao myorderdao=new MyorderDao();
		//ArrayList<MyorderVo> myorderlist = myorderdao.select(pdnum);
		//req.setAttribute("myorderlist", myorderlist);
		
		
		if (n>0 && nn>0) {
			req.setAttribute("result", "success");
			req.getRequestDispatcher("/Home?spage=/ORDER/MyOrderOk.jsp").forward(req, resp);
		} else {
			req.setAttribute("result", "fail");
			req.getRequestDispatcher("/Home?spage=/ORDER/MyOrderOk.jsp").forward(req, resp);
		}
	}
}
