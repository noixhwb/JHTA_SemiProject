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
		// updateForm으로 넘어가기
		String aid = req.getParameter("aid");
		AdminDao dao = AdminDao.getInstance();
		AdminVo vo = dao.selectDetail(aid);
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/Home?spage=/admin/updateForm.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String aid = req.getParameter("aid");
		String id = req.getParameter("id");
		String apwd = req.getParameter("apwd");
		int alevel = Integer.parseInt(req.getParameter("alevel"));
		System.out.println(aid);
		System.out.println(id);
		System.out.println(apwd);
		System.out.println(alevel);
	
		AdminVo vo = new AdminVo(aid, apwd, alevel, null);
		AdminDao dao = AdminDao.getInstance();
		int n = dao.updateAdmin(vo, id);
		if (n > 0) {
			System.out.println("성공");
			resp.sendRedirect(req.getContextPath()+"/Home?spage=/admin/list");
		} else {
			System.out.println("실패");
		}
	}

}
