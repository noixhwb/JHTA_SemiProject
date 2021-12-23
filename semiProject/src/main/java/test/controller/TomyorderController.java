package test.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import test.dao.MemberDao;
import test.dao.MyodDao;
import test.dao.MyorderDao;
import test.dao.ProdetailDao;
import test.dao.ProductDao;
import test.dao.ProimageDao;
import test.vo.MemberVo;
import test.vo.MyodVo;
import test.vo.MyorderVo;
import test.vo.ProductVo;
import test.vo.prodetailVo;

@WebServlet("/toMyOrder")
public class TomyorderController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pNum = Integer.parseInt(req.getParameter("pNum"));
		System.out.println(pNum);
		int pdNum = Integer.parseInt(req.getParameter("pdNum"));
		int num = Integer.parseInt(req.getParameter("num"));
		int pricetotal = Integer.parseInt(req.getParameter("pricetotal"));
		
		req.setAttribute("pNum", pNum);
		req.setAttribute("pdNum", pdNum);
		req.setAttribute("num", num);
		req.setAttribute("pricetotal", pricetotal);
		
			//product
			ProductDao dao=ProductDao.getInstance();
			ProductVo vo=dao.selectDetail(pNum);
			String price=String.valueOf(vo.getpPrice());
			//prodetail
			ProdetailDao pdao=ProdetailDao.getInstance();
			ArrayList<prodetailVo> list=pdao.selectdetail(pNum);
			//proimage
			ProimageDao pidao=ProimageDao.getInstance();
			String img=pidao.selectimage(pNum);
			
			req.setAttribute("vo", vo);
			req.setAttribute("list", list);
			req.setAttribute("img", img);
			
			//회원배송정보
			MemberDao mdao = new MemberDao();
			MemberVo del = mdao.select((String)req.getSession().getAttribute("mid"));
			req.setAttribute("del", del);
			
		
		//int pBuyCount = Integer.parseInt((String) req.getAttribute("select_num"));
		//int priceTotal = Integer.parseInt((String) req.getAttribute("priceTotal"));
		//이미지 ${img}
		//${pName, pPrice}
		//pName=${pName }&pPrice=${vo.pPrice }&img=${img }'"> <input type="button" value="장바구니" class="cartbut">
		MyodDao myoddao=new MyodDao();
		//int n = myoddao.update(pBuyCount, pNum);
		MyodVo myodvo = myoddao.select(pNum);
		
		
		//if (n>0 && vo!=null) {
			//req.setAttribute("result", "success");
			req.getRequestDispatcher("/Home?spage=/ORDER/MyOrderForm2.jsp").forward(req, resp);
		//}
	}
}
