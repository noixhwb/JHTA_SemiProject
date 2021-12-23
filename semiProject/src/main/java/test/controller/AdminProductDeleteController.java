package test.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.ProdetailDao;
import test.dao.ProductDao;
import test.dao.ProimageDao;
import test.vo.prodetailVo;

@WebServlet("/admin/productDelete")
public class AdminProductDeleteController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int pnum=Integer.parseInt(req.getParameter("pnum"));
		ProductDao dao=ProductDao.getInstance();
		int n=dao.deleteProduct(pnum);
		if(n>0)
		{
			System.out.println("삭제성공");
			ProdetailDao pdao=ProdetailDao.getInstance();
			ArrayList<prodetailVo> list=pdao.selectdetail(pnum);
			for(int i=0;i<list.size();i++)
			{
				int n1=pdao.deleteProdetail(pnum ,list.get(i).getPdNum());
				if(n1>0)
				{
					System.out.println("디테일정보삭제 성공");
					
					ProimageDao Idao=ProimageDao.getInstance();
					ArrayList<Integer> list2=Idao.selectipinum(pnum);
					for(int j=0;j<list2.size();i++)
					{
						int n2=Idao.deleteimg(pnum,(int)list2.get(j));
						if(n2>0)
						{
							System.out.println("이미지정보삭제");

						}
						else {
							System.out.println("이미지정보삭제 실패");
						}
					}
					
				}else
				{
					System.out.println("디테일정보삭제 실패");
				}
			}
			
		}else
		{
			System.out.println("삭제실패");
		}
		
	}
}
