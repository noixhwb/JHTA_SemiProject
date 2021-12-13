package test.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.AdminDao;
import test.vo.AdminVo;

@WebServlet("/admin/list")
public class AdminListController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int alevel = (int) req.getSession().getAttribute("alevel");
		System.out.println(alevel);
		if (alevel==1) {
			String spageNum = req.getParameter("pageNum");
			int pageNum = 1;
			if (spageNum != null) {
				pageNum = Integer.parseInt(spageNum);
			}
			int endRow = pageNum * 10;
			int startRow = endRow - 9;
			AdminDao dao = AdminDao.getInstance();
			ArrayList<AdminVo> list = dao.selectAdminAll(startRow,endRow);
			int count=dao.getCount();
			 int pageCount=(int)Math.ceil(count/10.0);//전체 페이지 갯수
			   int startPageNum=((pageNum-1)/10*10)+1;//시작페이지
			   int endPageNum=startPageNum+9;//끝페이지 
			   if(endPageNum>pageCount)
			   {
				   endPageNum=pageCount;
			   }
			   req.setAttribute("list", list);
			   req.setAttribute("pageCount",pageCount);
			   req.setAttribute("startPage", startPageNum);
			   req.setAttribute("endPage", endPageNum);
			   req.setAttribute("pageNum", pageNum);
			 
		} else {
			req.setAttribute("errMsg", "해당 게시판을 열람할 권한이 없습니다.");
		}
		 req.getRequestDispatcher("/Home?spage=/admin/adminList.jsp").forward(req, resp);
	}
}
