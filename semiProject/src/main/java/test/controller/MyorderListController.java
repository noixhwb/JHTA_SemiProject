package test.controller;

import java.io.IOException;
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
		//req.setAttribute("footer", "/footer.jsp");
		//System.out.println("test");
		
		//상품리스트
		req.setAttribute("product", req.getParameterValues("product"));
		CartDao dao = new CartDao();
		List<Map<String,Object>> list = dao.selectCartOrderList(req.getParameterValues("product"));
		req.setAttribute("list", list);
		
		//회원배송정보
		MemberDao mdao = new MemberDao();
		MemberVo del = mdao.select((String)req.getSession().getAttribute("mid"));
		req.setAttribute("del", del);
		
		req.setAttribute("main", "/ORDER/MyOrderForm.jsp");
		req.setAttribute("footer", "/footer.jsp");
		req.getRequestDispatcher("/layout.jsp").forward(req, resp);
		//req.getRequestDispatcher("/ORDER/MyOrder.jsp").forward(req, resp);
		
	}
}
