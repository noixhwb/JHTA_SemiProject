package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;
import test.vo.MyoVo;
import test.vo.MyordVo;

public class MyordDao {
	public int insertOrderdetail(MyordVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql = "INSERT INTO ORDERDETAIL VALUES(SEQ_ORDERDETAIL.NEXTVAL,?,?,?,?,1)";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getoNum());
			pstmt.setInt(2, vo.getPdNum());
			pstmt.setInt(3, vo.getdCount());
			pstmt.setInt(4, vo.getdPrice());
			return pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
			return -1;
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}

	public void updateTotalPrice(int oNum, int totalPrice) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql = "update orders set totalSales = ? where oNum = ?";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, totalPrice);
			pstmt.setInt(2, oNum);
			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
}
