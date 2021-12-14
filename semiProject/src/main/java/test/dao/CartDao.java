package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import test.vo.CartVo;

public class CartDao {

	// 장바구니 조회
	public ArrayList<CartVo> selectCartList(String mId) {
		//System.out.println(mId +" "+ mId.length());
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select cCartNum,pName,pPrice,piFilename from cart c inner join product p on c.PNUM = p.pnum inner join proimage i on p.pnum = i.pnum where mid=?";
		ArrayList<CartVo> list = new ArrayList<CartVo>();
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				//System.out.println("나오니");
				int cCartNum = rs.getInt("cCartNum");
				int pPrice = rs.getInt("pPrice");
				String pName = rs.getString("pName");
				String piFilename = rs.getString("piFilename");
				CartVo vo = new CartVo(cCartNum, pName, pPrice, piFilename);
				list.add(vo);
			}
			System.out.println(list);
			return list;

		} catch (SQLException se) {
			se.printStackTrace();
			return null;
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	public int delete(String mId) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			String sql="delete from cart where mId=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mId);
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con,pstmt,null);
		}
	}
}













