package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import test.vo.ProimageVo;
import test.vo.prodetailVo;

public class ProdetailDao {

	private static ProdetailDao instance=new ProdetailDao();
	private ProdetailDao() {}
	public static ProdetailDao getInstance()
	{
		return instance;
	}
	
	//insert
	public int insertProdetail(prodetailVo vo)
	{
		Connection con= null;
		PreparedStatement pstmt=null;
		String sql="insert into prodetail values(seq_prodetail.nextval,?,?,?)";
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getpNum());;
			pstmt.setString(2, vo.getProSize());
			pstmt.setInt(3, vo.getProCount());
		
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
	//셀렉트ALL
	public ArrayList<prodetailVo> selectdetail(int pnum)
	{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from prodetail where pnum=?";
		ArrayList<prodetailVo> list= new ArrayList<prodetailVo>();
		try
		{
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pnum);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				int pdnum=rs.getInt("pdnum");
				String prosize=rs.getString("prosize");
				int procount=rs.getInt("procount");
				prodetailVo vo=new prodetailVo(pdnum, pnum, prosize, procount);
				list.add(vo);
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
	//업데이트
	public int updateProdetail(prodetailVo vo)
	{
		Connection con= null;
		PreparedStatement pstmt=null;
		String sql="update prodetail set prosize=?,procount=? where pnum=? and pdnum=?";
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getProSize());
			pstmt.setInt(2, vo.getProCount());
			pstmt.setInt(3, vo.getpNum());;
			pstmt.setInt(4, vo.getPdNum());;
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
	public int deleteProdetail(int pnum,int pdnum)
	{
		Connection con= null;
		PreparedStatement pstmt=null;
		String sql="delete from prodetail where pnum=?";
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pnum);;
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
	

}
