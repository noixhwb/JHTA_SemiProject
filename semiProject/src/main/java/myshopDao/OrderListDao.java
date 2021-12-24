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
		PreparedStatement pstmt1=null;
		PreparedStatement pstmt2=null;
		try {
			con=JdbcUtil.getCon();
			pstmt2=con.prepareStatement("update product set pbuycount=pbuycount+1 where pnum=(select p.pnum from prodetail d , product p, orderdetail o,orders od where d.pnum = p.pnum and d.pdnum=o.pdnum and o.onum=od.onum and odnum=?)");
			pstmt2.setInt(1, odnum);
			pstmt2.executeUpdate();
			pstmt1=con.prepareStatement("update orderdetail set dstate=7  where odnum=?");
			pstmt1.setInt(1, odnum);
			
			return pstmt1.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt1, null);
		}
	}
	
	public int reviewCompelete(int odnum) {
		Connection con =null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement("update orderdetail set dstate=8  where odnum=?");
			pstmt.setInt(1, odnum);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	
	public int reviewDelete(int odnum) {
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
	
	public ArrayList<OrderListVo> list(int startrow,int endrow,String mid1){
		String sql="select * from(select aa.odnum,aa.prosize,aa.dcount,aa.pname,aa.dprice,aa.dstate,aa.mid,aa.delocation,aa.odate,rownum rnum from(select * from  prodetail d , product p, orderdetail o,orders od where d.pnum = p.pnum and d.pdnum=o.pdnum and o.onum=od.onum and mid=? order by odate desc)aa) where rnum>=? and rnum<=?";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mid1);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			rs=pstmt.executeQuery();
			ArrayList<OrderListVo> list= new ArrayList<OrderListVo>();
			while(rs.next()) {
				int odnum=rs.getInt("odnum");
				String prosize=rs.getString("prosize");
				int dcount=rs.getInt("dcount");
				String pname=rs.getString("pname");
				int dstate=rs.getInt("dstate");
				String mid=rs.getString("mid");
				int dprice=rs.getInt("dprice");
				String delocation=rs.getString("delocation");
				Date odate=rs.getDate("odate");
				OrderListVo vo = new OrderListVo(odnum, prosize, dcount, pname, dstate, mid, dprice, delocation, odate);
				
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
		String sql="select aa.odnum,aa.prosize,aa.dcount,aa.pname,aa.dprice,aa.dstate,aa.mid,aa.delocation,aa.odate,rownum rnum from(select * from  prodetail d , product p, orderdetail o,orders od where d.pnum = p.pnum and d.pdnum=o.pdnum and o.onum=od.onum and mid=? and TO_CHAR(odate, 'YYYY-MM-DD') >= ? and TO_CHAR(odate, 'YYYY-MM-DD')  <= ? order by odate desc)aa";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mid1);
			pstmt.setDate(2, date1);
			pstmt.setDate(3, date2);
			
			
			rs=pstmt.executeQuery();
			ArrayList<OrderListVo> list= new ArrayList<OrderListVo>();
			while(rs.next()) {
				
				int odnum=rs.getInt("odnum");
				String prosize=rs.getString("prosize");
				int dcount=rs.getInt("dcount");
				String pname=rs.getString("pname");
				int dstate=rs.getInt("dstate");
				String mid=rs.getString("mid");
				int dprice=rs.getInt("dprice");
				String delocation=rs.getString("delocation");
				Date odate=rs.getDate("odate");
				OrderListVo vo = new OrderListVo(odnum, prosize, dcount, pname, dstate, mid, dprice, delocation, odate);
				
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
