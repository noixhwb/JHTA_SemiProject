package test.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.ProdetailDao;
import test.dao.ProductDao;
import test.dao.ProimageDao;
import test.dao.RevprodDao;
import test.vo.ProductVo;
import test.vo.RevprodVo;
import test.vo.prodetailVo;
@WebServlet("/admin/productdetail")
public class AdminProductDetailController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int pnum= Integer.parseInt(req.getParameter("pnum"));
		String page=req.getParameter("page");
		//product
		ProductDao dao=ProductDao.getInstance();
		ProductVo vo=dao.selectDetail(pnum);
		String price=String.valueOf(vo.getpPrice());
		//prodetail
		String code=dao.getcategory(vo.getcName());
		ProdetailDao pdao=ProdetailDao.getInstance();
		ArrayList<prodetailVo> list=pdao.selectdetail(pnum);
		//proimage
		ProimageDao pidao=ProimageDao.getInstance();
		String img=pidao.selectimage(pnum);
		ArrayList<String> imgsList=pidao.selectimages(pnum);
		//review
		RevprodDao rvdao=new RevprodDao();
		ArrayList<RevprodVo> rvlist = rvdao.selectProductReview(pnum);
		req.setAttribute("rvlist", rvlist);
		req.setAttribute("code", code);
		req.setAttribute("vo", vo);
		req.setAttribute("list", list);
		req.setAttribute("img", img);
		req.setAttribute("imgsList", imgsList);
		if(page.equals("admin"))
		{
			req.getRequestDispatcher("/Home?spage=/admin/productdetail.jsp").forward(req, resp);
		}else if(page.equals("update"))
		{
			req.getRequestDispatcher("/Home?spage=/admin/productUpdateForm.jsp").forward(req, resp);
		}
		else
		{
			req.getRequestDispatcher("/Home?spage=/product/productDetail.jsp").forward(req, resp);
		}
		
	}

}
