package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.JdbcUtil;

public class CartdelDao {
	public void delete(String[] cCartNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql = "DELETE cart WHERE cCartNum=?";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			for(int i=0;i<cCartNum.length;i++) {
				pstmt.setString(1, cCartNum[i]);
				pstmt.executeUpdate();
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
}
