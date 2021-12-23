package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;
import test.vo.MyoVo;
import test.vo.MyordVo;

public class MyordDao {
	public int insert(MyoVo vo1, MyordVo vo2) {
		Connection con=null;
		PreparedStatement pstmt1=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		
		String sql1 = "INSERT INTO ORDERS VALUES(SEQ_ORDER.NEXTVAL,?,?,?,SYSDATE)";
		String sql2 = "INSERT INTO ORDERDETAIL VALUES(SEQ_ORDERDETAIL.NEXTVAL,SEQ_ORDER.CURRVAL,?,?,?,1)";
		
		try {
			con = JdbcUtil.getCon();
			pstmt1 = con.prepareStatement(sql1);
			pstmt1.setString(1, vo1.getmId());
			pstmt1.setInt(2, vo1.getTotalSales());
			pstmt1.setString(3, vo1.getDelocation());
			pstmt1.executeUpdate();
			//while (rs.next()) {
				pstmt2 = con.prepareStatement(sql2);
				pstmt2.setInt(1, vo2.getPdNum());
				pstmt2.setInt(2, vo2.getdCount());
				pstmt2.setInt(3, vo2.getdPrice());
			//}
			return pstmt2.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
			return -1;
		} finally {
			JdbcUtil.close(pstmt2);
			JdbcUtil.close(pstmt1);
			JdbcUtil.close(con);
		}
	}
	
}
