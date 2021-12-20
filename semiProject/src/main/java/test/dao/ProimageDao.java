package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import test.vo.ProductVo;
import test.vo.ProimageVo;

public class ProimageDao {
	private static ProimageDao instance=new ProimageDao();
	private ProimageDao() {}
	public static ProimageDao getInstance()
	{
		return instance;
	}
	//인서트
	public int insertimg(ProimageVo vo)
	{
		Connection con= null;
		PreparedStatement pstmt=null;
		String sql="insert into proimage values(fileinfo_seq.nextval,?,?,?,?)";
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getpNum());;
			pstmt.setString(2, vo.getPiFilename());
			pstmt.setLong(3, vo.getPiFilesize());
			pstmt.setInt(4, vo.getImgtype());
			int n=pstmt.executeUpdate();
			return n;
		}catch(SQLException se)
		{
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con,pstmt,null);
		}
	}
	//상품넘버로 대표이미지 가져오기
	public String selectimage(int pnum)
	{

		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select pifilename from proimage where pnum=? and imgtype=1";
		try
		{
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pnum);
			rs=pstmt.executeQuery();
			rs.next();
			String filename=rs.getString("pifilename");
	
			return filename;
		}catch(SQLException se)
		{
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	//상품넘버로 상세이미지들 가져오기
	public ArrayList<String> selectimages(int pnum)
	{

		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select pifilename from proimage where pnum=? and imgtype=2";
		ArrayList<String> list=new ArrayList<String>();
		try
		{
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pnum);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				String filename=rs.getString("pifilename");
				list.add(filename);
			}
			
	
			return list;
		}catch(SQLException se)
		{
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	

	
	
}
