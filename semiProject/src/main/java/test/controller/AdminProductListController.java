package test.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.ProductDao;
import test.vo.ProductVo;
@WebServlet("/admin/productlist")
public class AdminProductListController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		ProductDao dao=ProductDao.getInstance();
		ArrayList<ProductVo> list=dao.selectAll();
		req.setAttribute("list", list);
		req.getRequestDispatcher("/Home?spage=/admin/productlistAdmin.jsp").forward(req, resp);
	}
}
