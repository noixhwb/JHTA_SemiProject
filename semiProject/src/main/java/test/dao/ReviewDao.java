package test.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import test.vo.ReviewVo;

public class ReviewDao {
	public int insert(ReviewVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql = "INSERT INTO COMMENTSSS VALUES(SEQ_COMMENTS.nextval,?,?,?,?,SYSDATE)";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getOdNum());
			pstmt.setString(2, vo.getcScore());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getMid());
			pstmt.setDate(5, vo.getcDate());
			return pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
			return -1;
		} finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	
	public ArrayList<ReviewVo> selectAll() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql = "SELECT * FROM COMMENTSSS";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<ReviewVo> list=new ArrayList<ReviewVo>();
			while (rs.next()) {
				int coNum = rs.getInt("coNum");
				int odNum = rs.getInt("odNum");
				String cScore = rs.getString("cScore");
				String content = rs.getString("content");
				String mid = rs.getString("mid");
				Date cDate = rs.getDate("cDate");
				
				ReviewVo review=new ReviewVo(coNum, odNum, cScore, content, mid, cDate);
				list.add(review);
			}
			return list;
		} catch (SQLException se) {
			se.printStackTrace();
			return null;
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
	public ReviewVo select(int coNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql = "SELECT * FROM COMMENTSSS WHERE coNum=?";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, coNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int odNum = rs.getInt("odNum");
				String cScore = rs.getString("cScore");
				String content = rs.getString("content");
				String mid = rs.getString("mid");
				Date cDate = rs.getDate("cDate");
				ReviewVo vo=new ReviewVo(coNum, odNum, cScore, content, mid, cDate);
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
	
	public int delete(int coNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql = "DELETE FROM COMMENTSSS WHERE coNum=?";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, coNum);
			return pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
			return -1;
		} finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	
	public int update(ReviewVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql = "UPDATE COMMENTSSS SET CSCORE=?, CONTENT=? WHERE coNum=?";
		
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
