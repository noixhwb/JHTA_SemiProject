package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
}
