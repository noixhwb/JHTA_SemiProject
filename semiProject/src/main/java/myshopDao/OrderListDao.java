package myshopDao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;

import myshopVo.OrderListVo;
import myshopVo.OrdersVo;


public class OrderListDao {
	
	
	public OrderListDao() {}
	
	
	public ArrayList<OrdersVo> recentList(String mid){
		Connection con =null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement("select * from(select ord.*,rownum rnum from ("
					+ "select * from orders where mid=? order by odate desc) ord) where rnum<=3");
			pstmt.setString(1, mid);
			rs=pstmt.executeQuery();
			ArrayList<OrdersVo> list =new ArrayList<OrdersVo>();
			while(rs.next()) {
				int onum=rs.getInt("onum");
				String mid1=rs.getString("mid");
				int totalsales=rs.getInt("totalsales");
				String delocation=rs.getString("delocation");
				Date odate =rs.getDate("odate");
				
				OrdersVo vo = new OrdersVo(onum, mid1, totalsales, delocation, odate);
				
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
	public int cancel(int odnum) {
		Connection con =null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement("update orderdetail set dstate=5  where odnum=?");
			pstmt.setInt(1, odnum);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public int refund(int odnum) {
		Connection con =null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement("update orderdetail set dstate=6  where odnum=?");
			pstmt.setInt(1, odnum);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	
	public int decideBuy(int odnum) {
		Connection con =null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement("update orderdetail set dstate=7  where odnum=?");
			pstmt.setInt(1, odnum);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public int getCount(String mid) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement("select NVL(count(onum),0) from orders where mid=?");
			pstmt.setString(1, mid);
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
	
	public ArrayList<OrderListVo> list(int startrow,int endrow,String mid){
		String sql="select * from("
				+ "select  aa.odnum ,aa.delocation,aa.dstate,aa.dcount,aa.totalsales,aa.odate,aa.mid,rownum rnum from(select * from orders o,orderdetail d where o.onum =d.onum and mid=? order by odate desc)aa) where rnum>=? and rnum<=?";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
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
	public ArrayList<OrderListVo> decideDay(Date date1,Date date2,String mid1){
		String sql="select * from orders o,orderdetail d where TO_CHAR(odate, 'YYYY-MM-DD') >= ? and TO_CHAR(odate, 'YYYY-MM-DD')  <= ? and o.onum=d.onum and mid=? order by odnum desc";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setDate(1, date1);
			pstmt.setDate(2, date2);
			pstmt.setString(3, mid1);
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
	public int getDayCount(Date date1,Date date2,String mid) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement("select NVL(count(odnum),0) from orders o,orderdetail d where TO_CHAR(odate, 'YYYY-MM-DD') >= ? and TO_CHAR(odate, 'YYYY-MM-DD')  <= ? and o.onum=d.onum and mid=?");
			pstmt.setDate(1, date1);
			pstmt.setDate(2, date2);
			pstmt.setString(3, mid);
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
