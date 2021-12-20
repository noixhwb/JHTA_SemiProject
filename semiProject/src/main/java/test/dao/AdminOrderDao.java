package test.dao;



import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;

import myshopVo.OrderListVo;



public class AdminOrderDao {
	
	
	public AdminOrderDao() {}
	
	public int refundCompleted(int odnum) {
		Connection con =null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement("update orderdetail set dstate=4  where odnum=?");
			pstmt.setInt(1, odnum);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
		
	public ArrayList<OrderListVo> list(int startrow,int endrow){
		String sql="select * from("
				+ "select  aa.odnum ,aa.delocation,aa.dstate,aa.dcount,aa.totalsales,aa.odate,aa.mid,rownum rnum from(select * from orders o,orderdetail d where o.onum =d.onum order by odate desc)aa) where rnum>=? and rnum<=?";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs=pstmt.executeQuery();
			ArrayList<OrderListVo> list= new ArrayList<OrderListVo>();
			while(rs.next()) {
				
				String mid1=rs.getString("mid");
				int totalsales=rs.getInt("totalsales");
				String delocation=rs.getString("delocation");
				Date odate =rs.getDate("odate");
				int odnum=rs.getInt("odnum");
				int dcount=rs.getInt("dcount");
				int dstate=rs.getInt("dstate");
				OrderListVo vo =new OrderListVo(odnum, odnum, odnum, dcount, dcount, dstate, mid1, totalsales, delocation, odate);
				
				list.add(vo);

			}
				return list;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		
	}
	public ArrayList<OrderListVo> decideDay(Date date1,Date date2){
		String sql="select * from orders o,orderdetail d where TO_CHAR(odate, 'YYYY-MM-DD') >= ? and TO_CHAR(odate, 'YYYY-MM-DD')  <= ? and o.onum=d.onum order by odnum desc";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setDate(1, date1);
			pstmt.setDate(2, date2);
			
			rs=pstmt.executeQuery();
			ArrayList<OrderListVo> list= new ArrayList<OrderListVo>();
			while(rs.next()) {
				
				String mid=rs.getString("mid");
				int totalsales=rs.getInt("totalsales");
				String delocation=rs.getString("delocation");
				Date odate =rs.getDate("odate");
				int odnum=rs.getInt("odnum");
				int dcount=rs.getInt("dcount");
				int dstate=rs.getInt("dstate");
				OrderListVo vo =new OrderListVo(odnum, odnum, odnum, dcount, dcount, dstate, mid, totalsales, delocation, odate);
				
				list.add(vo);

			}
				return list;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		
	}
	public int getDayCount(Date date1,Date date2) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement("select NVL(count(odnum),0) from orders o,orderdetail d where TO_CHAR(odate, 'YYYY-MM-DD') >= ? and TO_CHAR(odate, 'YYYY-MM-DD')  <= ? and o.onum=d.onum");
			pstmt.setDate(1, date1);
			pstmt.setDate(2, date2);
			
			rs= pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
			return -1;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public int getCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement("select NVL(count(onum),0) from orders");
			
			rs= pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
			return -1;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	
	
}
