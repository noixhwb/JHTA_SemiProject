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
		int pnum = Integer.parseInt(mr.getParameter("pNum"));
		String cName = mr.getParameter("cName");
		ProductVo vo = new ProductVo(pnum, pName, pContent, pPrice, 0, cName);
		int n = dao.updateProduct(vo);
		if(n>0)
		{
	
			
			//디테일 업데이트
			 String[] prosize =  mr.getParameterValues("prosize");
			 String[] pdNum =  mr.getParameterValues("pdnum");
			 String[] procount = mr.getParameterValues("procount");
			 System.out.println(prosize.length);
			 ProdetailDao pddao = ProdetailDao.getInstance();
			 for (int i = 0; i < prosize.length; i++) {
					System.out.println("반복문까지 들어올수있음");

					prodetailVo pdVo = new prodetailVo(Integer.parseInt(pdNum[i]), pnum, prosize[i], Integer.parseInt(procount[i]));
					int n3 = pddao.updateProdetail(pdVo);
					if (n3 > 0) {
						System.out.println("상세수정 성공");

					} else {
						System.out.println("상세수정 실패");
					}

			}
			 //기존이미지 삭제
			 String[] img= mr.getParameterValues("imgs");
			 ProimageDao Idao = ProimageDao.getInstance();
			 ArrayList<Integer> list=Idao.selectipinum(pnum);
			 for (int i = 0; i < img.length; i++) {
					System.out.println("반복문까지 들어올수있음");
					
					File f=new File(saveDir+"\\"+img[i]);
					if(f.exists())
					{
						f.delete();
					}
					//기존이미지 DB삭제
					int n4=Idao.deleteimg(pnum, list.get(i));
					if(n4>0)
					{
						System.out.println("삭제성공");
					}else
					{
						System.out.println("삭제실패");
					}
					
			 }
			 
			 
			 //기존이미지 인서트
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
						int n2 = Idao.insertimg(iVo);
						if (n2 > 0) {
							System.out.println("img등록 성공");

						} else {
							System.out.println("img등록 실패");
						}
						
					}

				}

		}else
		{
			System.out.println("product 수정실패");
			
		}
		
	}
}
