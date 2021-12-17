package test.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import test.dao.ProductDao;
import test.dao.ProimageDao;
import test.vo.ProductVo;
import test.vo.ProimageVo;
@WebServlet("/admin/productInsert")
public class AdminProductInsertController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//파일 저장 경로
		String root = req.getSession().getServletContext().getRealPath("/");
        String saveDir = root + "imagesPro";
        System.out.println(saveDir);
        //파일 저장을 위한 MultipartRequest 선언
		 MultipartRequest mr=new MultipartRequest(
	        		req,
	        		saveDir,
	        		1024*1024*5,
	        		"utf-8",
	        		new DefaultFileRenamePolicy()
	        		);
		//product insert
		ProductDao dao=ProductDao.getInstance();
		String pName=mr.getParameter("pName");
		String pContent=mr.getParameter("pContent");
		//int pPrice=Integer.parseInt(mr.getParameter("pPrice"));
		String cName=mr.getParameter("selectCg_d");
		System.out.println(pName);
		System.out.println(pContent);
		System.out.println(cName);
		ProductVo vo=new ProductVo(0, pName, pContent, 2000,0, "니트");
		int n=dao.insertProduct(vo);
		int pnum=dao.getpNum(pName);
		//product pk번호 불러오기
		System.out.println(pnum);
		if(n>0)
		{
			
			System.out.println(pnum);
			//prodetail insert
			
			//proimage insert
			
	       
	        Enumeration<String> em=mr.getFileNames();
	        while(em.hasMoreElements())
	        {
	        	String file=em.nextElement();
	        	String savefilename=mr.getFilesystemName("file");
	        	File f=new File(saveDir+"\\"+savefilename);
	        	long filesize=f.length();
	        	ProimageVo iVo=new ProimageVo(0, pnum, savefilename, filesize);
	        	ProimageDao Idao=ProimageDao.getInstance();
	        	int n2=Idao.insertimg(iVo);
	        	if(n2>0)
	        	{
	        		System.out.println("img등록 성공");
	        	}else
	        	{
	        		System.out.println("img등록 실패");
	        	}
	        	
	        }
		}else
		{
			System.out.println("product등록 실패");
		}
		
	
	}
}
