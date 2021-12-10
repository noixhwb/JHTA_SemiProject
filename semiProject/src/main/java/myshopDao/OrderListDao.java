package myshopDao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import myshopVo.OrderDetailVo;
import myshopVo.OrderListVo;
import myshopVo.OrdersVo;

public class OrderListDao {
	
	public OrderListDao() {}
	public ArrayList<OrdersVo> orders(){
		Connection con =null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement("select * from orders");
			rs=pstmt.executeQuery();
			ArrayList<OrdersVo> list =new ArrayList<OrdersVo>();
			while(rs.next()) {
				int onum=rs.getInt("onum");
				String mid=rs.getString("mid");
				int totalsales=rs.getInt("totalsales");
				String delocation=rs.getString("delocation");
				Date odate =rs.getDate("odate");
				OrdersVo vo =new OrdersVo(onum, mid, totalsales, delocation, odate);
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

	public ArrayList<OrderDetailVo> orderdetail(){
		Connection con =null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement("select * from orderdetail");
			rs=pstmt.executeQuery();
			ArrayList<OrderDetailVo> list =new ArrayList<OrderDetailVo>();
			while(rs.next()) {
				int odnum=rs.getInt("odnum");
				int onum=rs.getInt("onum");
				int pdnum=rs.getInt("pdnum");
				int dcount=rs.getInt("dcount");
				int dprice=rs.getInt("dprice");
				int dstate=rs.getInt("dstate");
				OrderDetailVo vo =new OrderDetailVo(onum, odnum, pdnum, dcount, dprice, dstate);
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
	public ArrayList<OrderListVo> orderlist(){
		Connection con =null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement("select * from orders o,orderdetail d where o.onum = d.onum");
			rs=pstmt.executeQuery();
			ArrayList<OrderListVo> list =new ArrayList<OrderListVo>();
			while(rs.next()) {
				int onum=rs.getInt("onum");
				String mid=rs.getString("mid");
				int totalsales=rs.getInt("totalsales");
				String delocation=rs.getString("delocation");
				Date odate =rs.getDate("odate");
				int odnum=rs.getInt("odnum");
				
				int pdnum=rs.getInt("pdnum");
				int dcount=rs.getInt("dcount");
				int dprice=rs.getInt("dprice");
				int dstate=rs.getInt("dstate");
				OrderListVo vo =new OrderListVo(onum, odnum, pdnum, dcount, dprice, dstate, mid, totalsales, delocation, odate);
				System.out.println(onum);
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
