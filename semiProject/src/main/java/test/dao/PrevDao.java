package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;
import test.vo.PrevVo;

public class PrevDao {
	public PrevVo select(int odNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql = "SELECT p.pName, pd.proSize, pd.pdNum, pi.piFileName, od.odNum "
				+ "FROM product p, prodetail pd, orderdetail od, proimage pi "
				+ "WHERE p.pNum=pd.pNum and pd.pdNum=od.pdNum and p.pNum=pi.pNum and odNum=?";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, odNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String pName = rs.getString("pName");
				String proSize = rs.getString("proSize");
				int pdNum = rs.getInt("pdNum");
				String piFileName = rs.getString("piFileName");
				PrevVo vo=new PrevVo(pName, proSize, pdNum, piFileName, odNum);
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
}
