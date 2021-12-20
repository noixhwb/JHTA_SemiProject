package test.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;
import test.vo.RevVo;

public class RevDao {
	public RevVo selecting(int coNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql = "SELECT p.pName, pd.proSize, pd.pdNum, cm.coNum, cm.odNum, cm.cScore, cm.content, cm.mid, cm.cDate "
				+ " FROM product p, prodetail pd, orderdetail od, comments_s cm "
				+ " WHERE p.pNum = pd.pNum and pd.pdNum = od.pdNum and od.odNum = cm.odNum and cm.coNum=?";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, coNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String pName = rs.getString("pName");
				String proSize = rs.getString("proSize");
				int pdNum = rs.getInt("pdNum");
				int odNum = rs.getInt("odNum");
				String cScore = rs.getString("cScore");
				String content = rs.getString("content");
				String mid = rs.getString("mid");
				Date cDate = rs.getDate("cDate");
				RevVo vo=new RevVo(pName, proSize, pdNum, coNum, odNum, cScore, content, mid, cDate);
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
	
	public int updating(RevVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql = "UPDATE "
				+ "( "
				+ "SELECT p.pName, pd.proSize, pd.pdNum, cm.coNum, cm.odNum, cm.cScore, cm.content, cm.mid, cm.cDate "
				+ "FROM product p, prodetail pd, orderdetail od, comments_s cm  "
				+ "WHERE p.pNum = pd.pNum and pd.pdNum = od.pdNum and od.odNum = cm.odNum "
				+ ") "
				+ "SET cScore=?, content=? "
				+ "WHERE coNum=?";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getcScore());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getCoNum());
			return pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
			return -1;
		} finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
}
