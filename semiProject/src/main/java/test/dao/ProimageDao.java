package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.JdbcUtil;
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
		String sql="insert into proimage values(fileinfo_seq.nextval,?,?,?)";
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getpNum());;
			pstmt.setString(2, vo.getPiFilename());
			pstmt.setLong(3, vo.getPiFilesize());
		
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
