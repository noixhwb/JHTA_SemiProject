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
		String sql="select * from(select aa.odnum,aa.prosize,aa.dcount,aa.pname,aa.totalsales,aa.dstate,aa.mid,aa.delocation,aa.odate,rownum rnum from(select * from  prodetail d , product p, orderdetail o,orders od where d.pnum = p.pnum and d.pdnum=o.pdnum and o.onum=od.onum order by odate desc)aa) where rnum>=? and rnum<=?";
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
				
				int odnum=rs.getInt("odnum");
				String prosize=rs.getString("prosize");
				int dcount=rs.getInt("dcount");
				String pname=rs.getString("pname");
				int dstate=rs.getInt("dstate");
				String mid=rs.getString("mid");
				int totalsales=rs.getInt("totalsales");
				String delocation=rs.getString("delocation");
				Date odate=rs.getDate("odate");
				OrderListVo vo = new OrderListVo(odnum, prosize, dcount, pname, dstate, mid, totalsales, delocation, odate);
				
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
	public ArrayList<OrderListVo> refundList(){
		String sql="select * from(select aa.odnum,aa.prosize,aa.dcount,aa.pname,aa.totalsales,aa.dstate,aa.mid,aa.delocation,aa.odate from(select * from  prodetail d , product p, orderdetail o,orders od where d.pnum = p.pnum and d.pdnum=o.pdnum and o.onum=od.onum and dstate=6 order by odate desc)aa)";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			ArrayList<OrderListVo> list= new ArrayList<OrderListVo>();
			while(rs.next()) {
				
				int odnum=rs.getInt("odnum");
				String prosize=rs.getString("prosize");
				int dcount=rs.getInt("dcount");
				String pname=rs.getString("pname");
				int dstate=rs.getInt("dstate");
				String mid=rs.getString("mid");
				int totalsales=rs.getInt("totalsales");
				String delocation=rs.getString("delocation");
				Date odate=rs.getDate("odate");
				OrderListVo vo = new OrderListVo(odnum, prosize, dcount, pname, dstate, mid, totalsales, delocation, odate);
				
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
	
	
	
}
