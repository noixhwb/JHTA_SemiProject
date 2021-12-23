package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import db.JdbcUtil;
import test.vo.CartVo;

public class CartDao {

	// 장바구니 조회
	public ArrayList<CartVo> selectCartList(String mId) {
		System.out.println(mId);
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from cart c inner join product p on c.PNUM = p.pnum inner join proimage i on p.pnum = i.pnum inner join prodetail d on p.pnum = d.pnum where mid=? and imgtype = 1";
		ArrayList<CartVo> list = new ArrayList<CartVo>();
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int cCartNum = rs.getInt("cCartNum");
				String pName = rs.getString("pName");
				int pPrice = rs.getInt("pPrice");
				String piFileName = rs.getString("piFileName");
				String proSize = rs.getString("proSize");
				int ccount = rs.getInt("ccount");
				int pdNum =rs.getInt("pdNum");
				
				CartVo vo = new CartVo();
				vo.setcCartNum(cCartNum);
				vo.setpName(pName);
				vo.setpPrice(pPrice);
				vo.setPiFileName(piFileName);
				vo.setProSize(proSize);
				vo.setccount(ccount);
				vo.setPdNum(pdNum);
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
	public int delete(String cCartNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			String sql="delete from cart where cCartNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, cCartNum);
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con,pstmt,null);
		}
	}
	
	// 장바구니 > 주문 조회
		public ArrayList<Map<String, Object>> selectCartOrderList(String[] cCartNum) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from cart c inner join product p on c.PNUM = p.pnum inner join proimage i on p.pnum = i.pnum inner join prodetail d on p.pnum = d.pnum where cCartNum=? and imgtype = 1";
			ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			try {
				con = JdbcUtil.getCon();
				pstmt = con.prepareStatement(sql);
				for(int i=0;i<cCartNum.length;i++) {
					pstmt.setString(1, cCartNum[i]);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						Map<String, Object> order = new HashMap<String, Object>();
						String pNum = rs.getString("pNum");
						String pName = rs.getString("pName");
						int pPrice = rs.getInt("pPrice");
						String piFilename = rs.getString("piFilename");
						int pdNum =rs.getInt("pdNum");
						order.put("pNum", pNum);
						order.put("pName", pName);
						order.put("pPrice", pPrice);
						order.put("piFilename", piFilename);
						order.put("pdNum", pdNum);
						list.add(order);
					}
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
