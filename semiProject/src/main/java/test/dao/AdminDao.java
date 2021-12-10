package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.JdbcUtil;
import test.vo.AdminVo;

public class AdminDao {

	//관리자가입
	public int insertAdmin(AdminVo vo)
	{
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="insert into admin value(seq_admin.nextval,?,?,sysdate)";
		try
		{
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getaId());
			pstmt.setInt(2,vo.getAlevel());
			int n=pstmt.executeUpdate();
			return n;	
		}catch(SQLException se)
		{
			se.printStackTrace();
			return -1;
		}finally
		{
			JdbcUtil.close(con, pstmt, null);
		}
	}
}
