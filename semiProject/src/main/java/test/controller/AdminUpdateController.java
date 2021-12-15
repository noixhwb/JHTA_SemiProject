package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.AdminDao;
import test.vo.AdminVo;
@WebServlet("/admin/update")
public class AdminUpdateController extends HttpServlet {
 
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//updateForm으로 넘어가기
	String aid=req.getParameter("aid");
	AdminDao dao=AdminDao.getInstance();
	AdminVo vo=dao.selectDetail(aid);
	req.setAttribute("vo",vo );
	req.getRequestDispatcher("/Home?spage=/admin/updateForm.jsp").forward(req, resp);
}
@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
}
