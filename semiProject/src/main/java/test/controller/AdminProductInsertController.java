package test.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import test.dao.ProdetailDao;
import test.dao.ProductDao;
import test.dao.ProimageDao;
import test.vo.ProductVo;
import test.vo.ProimageVo;
import test.vo.prodetailVo;

@WebServlet("/admin/productInsert")
public class AdminProductInsertController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 파일 저장 경로
		String root = req.getSession().getServletContext().getRealPath("/");
		String saveDir = root + "imagesPro";
		System.out.println(saveDir);
		// 파일 저장을 위한 MultipartRequest 선언
		MultipartRequest mr = new MultipartRequest(req, saveDir, 1024 * 1024 * 5, "utf-8",
				new DefaultFileRenamePolicy());
		// product insert
		ProductDao dao = ProductDao.getInstance();
		String pName = mr.getParameter("pName");
		String pContent = mr.getParameter("pContent");
		int pPrice = Integer.parseInt(mr.getParameter("pPrice"));
		String cName = mr.getParameter("cname");
		System.out.println(pName);
		System.out.println(pContent);
		System.out.println(cName);
		ProductVo vo = new ProductVo(0, pName, pContent, pPrice, 0, cName);
		int n = dao.insertProduct(vo);
		// product pk번호 불러오기
		int pnum = dao.getpNum();
		System.out.println(pnum);

		if (n > 0) {
			// 디테일한 파일들
			String[] prosize = mr.getParameterValues("prosize");
			String[] procount = mr.getParameterValues("procount");
			ProdetailDao pddao = ProdetailDao.getInstance();
			Enumeration<String> em = mr.getFileNames();
			while (em.hasMoreElements()) {
				String file = em.nextElement();
				String savefilename = mr.getFilesystemName(file);
				System.out.println(savefilename);
				System.out.println(file);
				ProimageVo iVo;
				if (file.indexOf("s") > -1) {
					File f = new File(saveDir + "\\" + savefilename);
					long filesize = f.length();
					iVo = new ProimageVo(0, pnum, savefilename, filesize, 2);
					ProimageDao Idao = ProimageDao.getInstance();
					int n2 = Idao.insertimg(iVo);
					if (n2 > 0) {
						System.out.println("img등록 성공");

					} else {
						System.out.println("img등록 실패");
					}

				} else {
					File f = new File(saveDir + "\\" + savefilename);
					long filesize = f.length();
					iVo = new ProimageVo(0, pnum, savefilename, filesize, 1);
					ProimageDao Idao = ProimageDao.getInstance();
					int n2 = Idao.insertimg(iVo);
					if (n2 > 0) {
						System.out.println("img등록 성공");

					} else {
						System.out.println("img등록 실패");
					}
				}

			}

			// prodetail DB등록
			for (int i = 0; i < prosize.length; i++) {
				System.out.println("반복문까지 들어올수있음");

				prodetailVo pdVo = new prodetailVo(0, pnum, prosize[i], Integer.parseInt(procount[i]));
				int n3 = pddao.insertProdetail(pdVo);
				if (n3 > 0) {
					System.out.println("상세등록 성공");

				} else {
					System.out.println("상세등록 실패");
				}

			}
			 req.getRequestDispatcher("/Home?spage=/admin/productlist").forward(req, resp);

		} else {
			System.out.println("product등록 실패");
		}

	}
}
