package test.controller;

import java.io.Console;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.ProductDao;
import test.dao.ProimageDao;
import test.vo.CategoryVo;
import test.vo.ProductVo;
@WebServlet("/product/list")
public class ProductListController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String spageNum = req.getParameter("pageNum");
		//카테고리 파라미터 받아오기
		String category=req.getParameter("ct");
		//cname 파라미터 받아오기
		String cname=req.getParameter("cname");
		int pageNum = 1;
		if (spageNum != null) {
			pageNum = Integer.parseInt(spageNum);
		}
		int endRow = pageNum * 20;
		int startRow = endRow - 19;
		
		ProductDao dao=ProductDao.getInstance();
		ArrayList<String> listP=new ArrayList<String>();
		if(category!=null && cname==null)
		{
			System.out.println("들어왔다.");
			int count =dao.getCount_category(startRow, endRow, category);
			int pageCount = (int) Math.ceil(count / 10.0);// 전체 페이지 갯수
			int startPageNum = ((pageNum - 1) / 10 * 10) + 1;// 시작페이지
			int endPageNum = startPageNum + 9;// 끝페이지
			if (endPageNum > pageCount) {
				endPageNum = pageCount;
			}
		
			ArrayList<CategoryVo> list=dao.selectcategory(startRow, endRow, category);
			for(int i=0;i<list.size();i++)
			{
				CategoryVo vo=list.get(i);
				int pnum=vo.getPnum();
				System.out.println(pnum);
				ProimageDao pDao=ProimageDao.getInstance();
				String filename=pDao.selectimage(pnum);
				listP.add(filename);
				
			}
			req.setAttribute("list", list);
			req.setAttribute("listP", listP);
		}else if(category!=null && cname!=null)
		{
			System.out.println(cname);
			int count =dao.getCount_cname(startRow, endRow, category, cname);
			int pageCount = (int) Math.ceil(count / 10.0);// 전체 페이지 갯수
			int startPageNum = ((pageNum - 1) / 10 * 10) + 1;// 시작페이지
			int endPageNum = startPageNum + 9;// 끝페이지
			if (endPageNum > pageCount) {
				endPageNum = pageCount;
			}
			ArrayList<CategoryVo> list=dao.selectcategory_cname(startRow, endRow, category, cname);
			for(int i=0;i<list.size();i++)
			{
				CategoryVo vo=list.get(i);
				int pnum=vo.getPnum();
				ProimageDao pDao=ProimageDao.getInstance();
				String filename=pDao.selectimage(pnum);
				listP.add(filename);
				
			}
			req.setAttribute("list", list);
			req.setAttribute("listP", listP);
		}else
		{
			int count =dao.getCount_all(startRow, endRow);
			int pageCount = (int) Math.ceil(count / 10.0);// 전체 페이지 갯수
			int startPageNum = ((pageNum - 1) / 10 * 10) + 1;// 시작페이지
			int endPageNum = startPageNum + 9;// 끝페이지
			if (endPageNum > pageCount) {
				endPageNum = pageCount;
			}
			ArrayList<CategoryVo> list=dao.selectAll_page(startRow, endRow);
	
			for(int i=0;i<list.size();i++)
			{
				CategoryVo vo=list.get(i);
				int pnum=vo.getPnum();
				ProimageDao pDao=ProimageDao.getInstance();
				String filename=pDao.selectimage(pnum);
				listP.add(filename);
				
			}
			
			req.setAttribute("list", list);
			req.setAttribute("listP", listP);
		}
		
		req.getRequestDispatcher("/Home?spage=/product/productlist.jsp").forward(req, resp);
	}
}
