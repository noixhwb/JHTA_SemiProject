package test.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import test.vo.MyorderVo;

public class MyorderDao {
	public ArrayList<MyorderVo> select(int oNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql = "SELECT o.onum, o.mid, o.totalsales, o.delocation, o.oDate, od.odnum, od.pdnum, od.dcount, od.dprice, od.dstate "
				   + "FROM ORDERS O ,ORDERDETAIL OD "
				   + "WHERE O.ONUM=OD.ONUM and o.onum=?";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, oNum);
			rs = pstmt.executeQuery();
			ArrayList<MyorderVo> list=new ArrayList<MyorderVo>();
			while (rs.next()) {
				String mId = rs.getString("mId");
				int totalSales = rs.getInt("totalSales");
				String delocation = rs.getString("delocation");
				Date oDate = rs.getDate("oDate");
				int odNum = rs.getInt("odNum");
				int pdNum = rs.getInt("pdNum");
				int dCount = rs.getInt("dCount");
				int dPrice = rs.getInt("dPrice");
				int dState = rs.getInt("dState");
				MyorderVo vo=new MyorderVo(oNum, mId, totalSales, delocation, oDate, odNum, pdNum, dCount, dPrice, dState);
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
