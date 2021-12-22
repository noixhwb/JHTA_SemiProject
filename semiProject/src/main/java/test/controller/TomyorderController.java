package test.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.MyodDao;
import test.dao.MyorderDao;
import test.vo.MyodVo;
import test.vo.MyorderVo;

@WebServlet("/toMyOrder")
public class TomyorderController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pNum = Integer.parseInt(req.getParameter("pNum"));
		int pBuyCount = Integer.parseInt(req.getParameter("select_num"));
		
		MyodDao dao=new MyodDao();
		int n = dao.update(pBuyCount, pNum);
		MyodVo vo = dao.select(pNum);
		
		req.setAttribute("pNum", pNum);
		req.setAttribute("pBuyCount", pBuyCount);
		
		if (n>0 && vo!=null) {
			//req.setAttribute("result", "success");
			req.getRequestDispatcher("/Home?spage=/ORDER/MyOrderForm2.jsp").forward(req, resp);
		}
	}
}
