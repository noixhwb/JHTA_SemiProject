package test.controller;

import java.io.IOException;
import java.io.PrintStream;
import java.util.Map;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.CartDao;
import test.dao.MemberDao;
import test.vo.MemberVo;

@WebServlet("/MyOrder")
public class MyorderListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setAttribute("header", "/header.jsp");
		
		//상품리스트(사진,사이즈 포함)
		int totPrice = 0;
		CartDao dao=new CartDao();
		List<Map<String,Object>> list = dao.selectCartOrderList(req.getParameterValues("product"));
		String[] cnt = req.getParameterValues("cartCnt");
		for(int i=0;i<list.size();i++) {
			System.out.println(cnt[i]);
			list.get(i).put("cnt", cnt[i]);
			int ccnt = Integer.parseInt(String.valueOf(cnt[i]));
			int price = Integer.parseInt(String.valueOf(list.get(i).get("pPrice")));
			totPrice += price*ccnt;
			list.get(i).put("price", price*ccnt);
			
		}
		req.setAttribute("list", list);
		req.setAttribute("totPrice", totPrice);
		
		//회원배송정보
		MemberDao mdao = new MemberDao();
		MemberVo del = mdao.select((String)req.getSession().getAttribute("mid"));
		req.setAttribute("del", del);
		
		req.setAttribute("footer", "/footer.jsp");
		req.getRequestDispatcher("/ORDER/MyOrderForm.jsp").forward(req, resp);
		
	}
}
