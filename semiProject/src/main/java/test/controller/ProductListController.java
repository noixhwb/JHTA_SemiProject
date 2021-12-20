package test.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.ProductDao;
import test.dao.ProimageDao;
import test.vo.ProductVo;
@WebServlet("/product/list")
public class ProductListController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		ProductDao dao=ProductDao.getInstance();
		ArrayList<ProductVo> list=dao.selectAll();
		ArrayList<String> listP=new ArrayList<String>();
		for(int i=0;i<list.size();i++)
		{
			ProductVo vo=list.get(i);
			int pnum=vo.getpNum();
			ProimageDao pDao=ProimageDao.getInstance();
			String filename=pDao.selectimage(pnum);
			listP.add(filename);
			
		}
		
		req.setAttribute("list", list);
		req.setAttribute("listP", listP);
		req.getRequestDispatcher("/Home?spage=/product/productlist.jsp").forward(req, resp);
	}
}
