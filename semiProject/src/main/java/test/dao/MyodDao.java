package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;
import test.vo.MyodVo;

public class MyodDao {
	public MyodVo select(int pNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql = "SELECT p.pNum, p.pName, p.pPrice, pBuyCount, pd.pdNum "
				   + "FROM product p, prodetail pd "
				   + "WHERE p.pNum=pd.pNum and p.pnum=?";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String pName = rs.getString("pName");
				int pPrice = rs.getInt("pPrice");
				int pBuyCount = rs.getInt("pBuyCount");
				int pdNum = rs.getInt("pdNum");
				MyodVo vo=new MyodVo(pNum, pName, pPrice, pBuyCount, pdNum);
				return vo;
			}
			return null;
		} catch (SQLException se) {
			se.printStackTrace();
			return null;
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
	public int update(int pBuyCount, int pNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql = "UPDATE product SET pBuyCount=? WHERE pNum=?";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pBuyCount);
			pstmt.setInt(2, pNum);
			return pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
			return -1;
		} finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
}
