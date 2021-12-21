package test.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sun.net.httpserver.Authenticator.Result;

import db.JdbcUtil;
import test.vo.RevVo;

public class RevDao {
	public RevVo selecting(int coNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql = "SELECT p.pName, pd.proSize, pd.pdNum, pi.piFileName, cm.coNum, cm.odNum, cm.cScore, cm.content, cm.mid, cm.cDate "
				   + "FROM product p, prodetail pd, orderdetail od, comments_s cm , proimage pi "
				   + "WHERE p.pNum=pd.pNum and pd.pdNum=od.pdNum and od.odNum=cm.odNum and p.pNum=pi.pNum and coNum=?";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, coNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String pName = rs.getString("pName");
				String proSize = rs.getString("proSize");
				int pdNum = rs.getInt("pdNum");
				String piFileName = rs.getString("piFileName");
				int odNum = rs.getInt("odNum");
				String cScore = rs.getString("cScore");
				String content = rs.getString("content");
				String mid = rs.getString("mid");
				Date cDate = rs.getDate("cDate");
				RevVo vo=new RevVo(pName, proSize, pdNum, piFileName, coNum, odNum, cScore, content, mid, cDate);
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
	
	public RevVo selectingod(int odNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql = "SELECT p.pName, pd.proSize, pd.pdNum, pi.piFileName, cm.coNum, cm.odNum, cm.cScore, cm.content, cm.mid, cm.cDate "
				   + "FROM product p, prodetail pd, orderdetail od, comments_s cm , proimage pi "
				   + "WHERE p.pNum=pd.pNum and pd.pdNum=od.pdNum and od.odNum=cm.odNum and p.pNum=pi.pNum and cm.odNum=?";
		
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
				int coNum = rs.getInt("coNum");
				String cScore = rs.getString("cScore");
				String content = rs.getString("content");
				String mid = rs.getString("mid");
				Date cDate = rs.getDate("cDate");
				RevVo vo=new RevVo(pName, proSize, pdNum, piFileName, coNum, odNum, cScore, content, mid, cDate);
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
	
	public ArrayList<RevVo> selectings(String mid) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql = "SELECT p.pName, pd.proSize, pd.pdNum, pi.piFileName, cm.coNum, cm.odNum, cm.cScore, cm.content, cm.mid, cm.cDate "
				   + "FROM product p, prodetail pd, orderdetail od, comments_s cm , proimage pi "
				   + "WHERE p.pNum=pd.pNum and pd.pdNum=od.pdNum and od.odNum=cm.odNum and p.pNum=pi.pNum and mid=?";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			ArrayList<RevVo> list=new ArrayList<RevVo>();
			while (rs.next()) {
				String pName = rs.getString("pName");
				String proSize = rs.getString("proSize");
				int pdNum = rs.getInt("pdNum");
				String piFileName = rs.getString("piFileName");
				int coNum = rs.getInt("coNum");
				int odNum = rs.getInt("odNum");
				String cScore = rs.getString("cScore");
				String content = rs.getString("content");
				Date cDate = rs.getDate("cDate");
				RevVo vo=new RevVo(pName, proSize, pdNum, piFileName, coNum, odNum, cScore, content, mid, cDate);
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
	
	public int updating(RevVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql = "UPDATE "
				+ "( "
				+ "SELECT p.pName, pd.proSize, pd.pdNum, pi.piFileName, cm.coNum, cm.odNum, cm.cScore, cm.content, cm.mid, cm.cDate "
				+ "FROM product p, prodetail pd, orderdetail od, comments_s cm , proimage pi "
				+ "WHERE p.pNum = pd.pNum and pd.pdNum = od.pdNum and od.odNum = cm.odNum and p.pNum = pi.pNum "
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
