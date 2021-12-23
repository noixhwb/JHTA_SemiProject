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
	//update
	public int updateimg(ProimageVo vo)
	{
		Connection con= null;
		PreparedStatement pstmt=null;
		String sql="update proimage pifilename=?,pifilesize=? set where pnum=? and imgtype=?";
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getPiFilename());
			pstmt.setLong(2, vo.getPiFilesize());
			pstmt.setInt(3, vo.getpNum());
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
	
	//삭제
	public int deleteimg(int pnum,int pinum)
	{
		Connection con= null;
		PreparedStatement pstmt=null;
		String sql="delete from proimage where pnum=? and pinum=?";
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pnum);
			pstmt.setInt(2, pinum);
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
	//pinum값 가져오기
	public ArrayList<Integer> selectipinum(int pnum)
	{

		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select pinum from proimage where pnum=?";
		ArrayList<Integer> list=new ArrayList<Integer>();
		try
		{
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pnum);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				int pinum=rs.getInt("pinum");
				list.add(pinum);
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
