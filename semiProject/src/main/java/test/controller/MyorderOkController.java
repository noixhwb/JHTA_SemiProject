package test.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.CartdelDao;
import test.dao.MyordDao;
import test.dao.MyorderDao;
import test.vo.MyoVo;
import test.vo.MyordVo;
import test.vo.MyorderVo;

@WebServlet("/myorderOk")
public class MyorderOkController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//주문테이블
		MyordDao dao=new MyordDao();
				
		String mId = (String)req.getSession().getAttribute("mid");
		int totalSales = Integer.parseInt(req.getParameter("totPrice"));
		String delocation = req.getParameter("whereto");
		
		MyoVo vo=new MyoVo(0, mId, totalSales, delocation, null);
		
		//주문상세테이블 추가
		//String[] mpdnum = req.getParameterValues("pdnum");
		//int pdnum = Integer.parseInt(mpdnum[0]);
		int pdnum=11001002; //값 ""로 나와서 임의로 아무숫자넣음..왜??ㅠㅜ
		String[] mdcount = req.getParameterValues("cnt");
		//int dcount = Integer.parseInt(mdcount[0]);
		String[] mdprice = req.getParameterValues("price");
		//int dprice = Integer.parseInt(mdprice[0]);
		
		for (int i=0; i<mdcount.length; i++) {
			//int pdnum = Integer.parseInt(mpdnum[i]);
			int dcount = Integer.parseInt(mdcount[i]);
			int dprice = Integer.parseInt(mdprice[i]);
			MyordVo ovo=new MyordVo(0, 0, pdnum, dcount, dprice, 1);
			dao.insert(vo, ovo);
		}
		
		//MyordVo ovo=new MyordVo(0, 0, pdnum, dcount, dprice, 1);
			
		//int n = dao.insert(vo, ovo);
		//System.out.println("@@@"+vo);
		//System.out.println("###"+ovo);
		
		//주문,주문상세 조인한 주문내역 보여주기
		int onum = 1;//sequence로 넣은 값... 어떻게...?
		MyorderDao myorderdao=new MyorderDao();
		ArrayList<MyorderVo> myorderlist = myorderdao.select(onum);
		req.setAttribute("myorderlist", myorderlist);	
				
				
		//장바구니 내역 삭제
		//String mid = (String)req.getSession().getAttribute("mid");
		//CartdelDao cddao=new CartdelDao();
		//int cdn = cddao.delete(mid);
				
		req.setAttribute("result", "success");
		req.getRequestDispatcher("/Home?spage=/ORDER/MyOrderOk.jsp").forward(req, resp);		
		/*		
		if (n>0) {
			req.setAttribute("result", "success");
			req.getRequestDispatcher("/Home?spage=/ORDER/MyOrderOk.jsp").forward(req, resp);
		} else {
			req.setAttribute("result", "fail");
			req.getRequestDispatcher("/Home?spage=/ORDER/MyOrderOk.jsp").forward(req, resp);
		}
		*/
	}
}
