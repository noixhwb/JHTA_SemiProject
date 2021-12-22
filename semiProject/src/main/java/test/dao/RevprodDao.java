package test.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import test.vo.RevprodVo;

public class RevprodDao {
	public ArrayList<RevprodVo> selectProductReview(int pNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql = "SELECT pd.pNum, cm.cScore, cm.content, cm.mid, cm.cDate "
				   + "FROM prodetail pd, orderdetail od, comments_s cm "
				   + "WHERE pd.pdNum=od.pdNum and od.odNum=cm.odNum and pd.pNum=?"
				   + "ORDER BY cDate desc ";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pNum);
			rs = pstmt.executeQuery();
			ArrayList<RevprodVo> list=new ArrayList<RevprodVo>();
			while (rs.next()) {
				String cScore = rs.getString("cScore");
				String content = rs.getString("content");
				String mid = rs.getString("mid");
				Date cDate = rs.getDate("cDate");
				RevprodVo vo=new RevprodVo(pNum, cScore, content, mid, cDate);
				list.add(vo);
			}
			return list;
		} catch (SQLException se) {
			se.printStackTrace();
			return null;
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
}
