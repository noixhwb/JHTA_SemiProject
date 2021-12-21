package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import db.JdbcUtil;
import test.vo.CtVo;

public class CtDao {
	public ArrayList<CtVo> selCartList(String mId) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql = "SELECT cCartNum, pName, pPrice, piFileName, proSize, proCount, mId "
				+ "FROM cart c, product p, prodetail pd, proimage pi "
				+ "WHERE c.pNum=p.pNum and p.pNum=pi.pNum and p.pNum=pd.pNum and mId=? ";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			ArrayList<CtVo> listt=new ArrayList<CtVo>();
			while(rs.next()) {
				int cCartNum = rs.getInt("cCartNum");
				String pName = rs.getString("pName");
				int pPrice = rs.getInt("pPrice");
				String piFileName = rs.getString("piFileName");
				String proSize = rs.getString("proSize");
				int proCount = rs.getInt("proCount");
				CtVo vo=new CtVo(cCartNum, pName, pPrice, piFileName, proSize, proCount, mId);
				listt.add(vo);
			}
			return listt;
		} catch (SQLException se) {
			se.printStackTrace();
			return null;
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
	public ArrayList<Map<String, Object>> selCartOrderList(String[] cCartNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT cCartNum, pName, pPrice, piFileName, proSize, proCount, mId "
				+ "FROM cart c, product p, prodetail pd, proimage pi "
				+ "WHERE c.pNum=p.pNum and p.pNum=pi.pNum and p.pNum=pd.pNum and cCartNum=? ";
		ArrayList<Map<String, Object>> listt = new ArrayList<Map<String, Object>>();
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			for(int i=0; i<cCartNum.length; i++) {
				pstmt.setString(1, cCartNum[i]);
				rs = pstmt.executeQuery();
				System.out.println(cCartNum[i]);
				if (rs.next()) {
					Map<String, Object> orderr = new HashMap<String, Object>();
					String pName = rs.getString("pName");
					int pPrice = rs.getInt("pPrice");
					String piFilename = rs.getString("piFilename");
					String proSize = rs.getString("proSize");
					
					orderr.put("pName", pName);
					orderr.put("pPrice", pPrice);
					orderr.put("piFilename", piFilename);
					orderr.put("proSize", proSize);
					
					listt.add(orderr);
				}
			}
			return listt;

		} catch (SQLException se) {
			se.printStackTrace();
			return null;
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
}
