package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.AdminDao;

@WebServlet("/admin/delete")
public class AdminDeleteController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String aid = req.getParameter("aid");
		AdminDao dao = AdminDao.getInstance();
		int n = dao.deleteAdmin(aid);
		if (n > 0) {
			System.out.println("성공");
			resp.sendRedirect(req.getContextPath() + "/Home?spage=/admin/list");
		} else {
			System.out.println("실패");
		}
	}
}
