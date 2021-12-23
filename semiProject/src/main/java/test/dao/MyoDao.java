package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;
import test.vo.MyoVo;

public class MyoDao {
	//주문 테이블 추가
	public int insertOrders(MyoVo vo1) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql1 = "INSERT INTO ORDERS VALUES(SEQ_ORDER.NEXTVAL,?,?,?,SYSDATE)";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql1);
			pstmt.setString(1, vo1.getmId());
			pstmt.setInt(2, vo1.getTotalSales());
			pstmt.setString(3, vo1.getDelocation());
			return pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
			return -1;
		} finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	
	//마지막 PK값 가져오기
	public int getOnum() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql = "SELECT onum FROM "
				+ "("
				+ "SELECT * FROM orders "
				+ "ORDER BY onum DESC "
				+ ") "
				+ "WHERE rownum=1";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int n = rs.getInt("oNum");
			return n;
		} catch (SQLException se) {
			se.printStackTrace();
			return -1;
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
}
