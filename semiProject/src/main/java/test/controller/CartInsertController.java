package test.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import test.dao.CartDao;
import test.vo.CartVo;
@WebServlet("/cartinsert")
public class CartInsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header", "header.jsp");
		req.setAttribute("footer", "footer.jsp");
		String mid=(String)req.getSession().getAttribute("mid");
		
		CartDao dao=new CartDao();
		System.out.println("pdNum============>"+ req.getParameter("pdNum"));
		int num = Integer.parseInt(String.valueOf(req.getParameter("num")));
		System.out.println("um============>"+ req.getParameter("num"));
		String pdNum = req.getParameter("pdNum");
		System.out.println("cart insert....");
		int n=dao.insertCart(pdNum,mid,num);
		//ArrayList<CartVo> list=dao.selectCartList((String)req.getSession().getAttribute("mid"));
		//req.setAttribute("list", list);
		//req.getRequestDispatcher("cart.jsp").forward(req, resp);
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		JSONObject ob=new JSONObject();
		if(n==1) {
			ob.put("code", "success");
		}else {
			ob.put("code", "fail");		
		}
		pw.print(ob);
	}
}
