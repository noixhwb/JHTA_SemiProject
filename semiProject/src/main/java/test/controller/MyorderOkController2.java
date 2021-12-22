package test.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		MyordDao dao=new MyordDao();
				
		String mId = (String)req.getSession().getAttribute("mid");
		int totalSales = Integer.parseInt(req.getParameter("pricetotal"));
		String delocation = req.getParameter("whereto");
		
		MyoVo vo=new MyoVo(0, mId, totalSales, delocation, null);
		
		//주문상세테이블 추가
		//String[] mpdnum = req.getParameterValues("pdnum");
		//int pdnum = Integer.parseInt(mpdnum[0]);
		int pdnum=11001002; 
		int dcount = Integer.parseInt(req.getParameter("select_num"));
		String[] mdprice = req.getParameterValues("price");
		int dprice = Integer.parseInt(mdprice[0]);
		
		
		MyordVo ovo=new MyordVo(0, 0, pdnum, dcount, dprice, 1);
			
		int n = dao.insert(vo, ovo);
		//System.out.println("@@@"+vo);
		//System.out.println("###"+ovo);
		
		//주문,주문상세 조인한 주문내역 보여주기
		MyorderDao myorderdao=new MyorderDao();
		ArrayList<MyorderVo> myorderlist = myorderdao.select(pdnum);
		req.setAttribute("myorderlist", myorderlist);
		
		
		
		if (n>0) {
			req.setAttribute("result", "success");
			req.getRequestDispatcher("/Home?spage=/ORDER/MyOrderOk.jsp").forward(req, resp);
		} else {
			req.setAttribute("result", "fail");
			req.getRequestDispatcher("/Home?spage=/ORDER/MyOrderOk.jsp").forward(req, resp);
		}
	}
}
