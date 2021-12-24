package test.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.AdminDao;
@WebServlet("/admin/idchk")
public class AdminIDCheckController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AdminDao dao=AdminDao.getInstance();
		String aid=req.getParameter("aid");
		boolean IdOk=dao.adminIdcheck(aid);
		
		
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		pw.print("<result>");
		if(IdOk)
		{
			pw.print("<exist>"+IdOk+"</exist>");
		}else
		{
			pw.print("<exist>"+IdOk+"</exist>");
		}
		pw.print("</result>");
	}

}
