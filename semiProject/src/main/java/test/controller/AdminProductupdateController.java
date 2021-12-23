package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import test.dao.ProductDao;
import test.vo.ProductVo;
@WebServlet("/admin/updateproduct")
public class AdminProductupdateController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 경로
		String root = req.getSession().getServletContext().getRealPath("/");
		String saveDir = root + "imagesPro";
		// 파일 저장을 위한 MultipartRequest 선언
		MultipartRequest mr = new MultipartRequest(req, saveDir, 1024 * 1024 * 5, "utf-8",
				new DefaultFileRenamePolicy());
		// product update
				ProductDao dao = ProductDao.getInstance();
		String pName = mr.getParameter("pName");
		String pContent = mr.getParameter("pContent");
		int pPrice = Integer.parseInt(mr.getParameter("pPrice"));
		String cName = mr.getParameter("cName");
		ProductVo vo = new ProductVo(0, pName, pContent, pPrice, 0, cName);
		int n = dao.updateProduct(vo);
		if(n>0)
		{
	
			
			//디테일 업데이트
			 String[] prosize =  mr.getParameterValues("prosize");
			 String[] procount = mr.getParameterValues("procount");
			   //기존이미지 삭제
			 //기존이미지 인서트
		}
		
	}
}
