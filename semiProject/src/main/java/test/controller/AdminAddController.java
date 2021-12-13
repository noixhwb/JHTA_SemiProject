package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.AdminDao;
import test.vo.AdminVo;
@WebServlet("/admin/add")
public class AdminAddController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		resp.sendRedirect(req.getContextPath()+"/Home?spage=/admin/adminAdd.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String aid=req.getParameter("aid");
		String apwd=req.getParameter("apwd");
		int alevel=Integer.parseInt(req.getParameter("alevel"));
		AdminDao dao=AdminDao.getInstance();
		AdminVo vo=new AdminVo(aid, apwd, alevel, null);
		int n=dao.insertAdmin(vo);
		if(n>0)
		{
			System.out.println("성공");
			resp.sendRedirect(req.getContextPath()+"/admin/list");
		}else {
			System.out.println("실패");
		}
	}
}
