package test.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import db.JdbcUtil;
import test.vo.MemberVo;

public class MemberDao {
	
	public MemberDao() {}
	
	
	//회원추가
	public int insert(MemberVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			String sql="insert into member_s values(?,?,?,?,?,1,sysdate)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,vo.getMid());
			pstmt.setString(2,vo.getMpwd());
			pstmt.setString(3,vo.getMname());
			pstmt.setString(4,vo.getMaddr());
			pstmt.setString(5,vo.getMphone());
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	
	
	//아디 패스워드 체크
	public boolean loginMember(String mid,String mpwd)
	{
	   Connection con=null;
	   PreparedStatement pstmt=null;
	   ResultSet rs=null;
	   boolean n=false;
	   String sql="select * from member_s where mid=?";
	   try
	   {
		   con=JdbcUtil.getCon();
		   pstmt=con.prepareStatement(sql);
		   pstmt.setString(1, mid);
		   rs=pstmt.executeQuery();
		   if(rs.next())
			{   String id1=rs.getString("mid");
			    String pwd1=rs.getString("mpwd");
				if(mid.equals(id1)&&mpwd.equals(pwd1))
				{
					n=true;
				}
			}	
		   return n;
	   }catch(SQLException se)
		{
			se.printStackTrace();
			return n;
		}finally
		{
			JdbcUtil.close(con, pstmt, rs);
		}
	}


	public boolean isMember(HashMap<String,String> map) {
		String mid=map.get("mid");
		String mpwd=map.get("mpwd");
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql="select * from member_s where mid=? and mpwd=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,mid);
			pstmt.setString(2,mpwd);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			return false;
		}catch(SQLException s) {
			s.printStackTrace();
			return false;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
	//아이디 찾기
	public String idselect(String mphone) {
		Connection con=null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		
		String mid="아이디가 존재하지 않아요";
		
		try {
			con=JdbcUtil.getCon();
			String sql="select mid from member_s where mphone=? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,mphone);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				mid=rs.getString("mid");
				return mid;
			}
			return mid;
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		
	}
	
	//비번찾기
	public String pwdselect(String mid ,String mphone) {
		Connection con=null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		
		String mpwd="";
		
		try {
			con=JdbcUtil.getCon();
			String sql="select mpwd from member_s where mid=? and mphone=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,mid);
			pstmt.setString(2,mphone);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				mpwd=rs.getString("mpwd");
				System.out.println("db 리턴값 : "+mpwd);
				return mpwd;
			}
			return "일치하는정보가 없습니다";
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		
	}
	
	
	
	public MemberVo select(String mid){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql="select * from member_s where mid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String mpwd=rs.getString("mpwd");
				String mname=rs.getString("mname");
				String maddr=rs.getString("maddr");
				String mphone=rs.getString("mphone");
				int mstate=rs.getInt("mstate");
				Date regdate=rs.getDate("regdate");
				MemberVo vo=new MemberVo(mid, mpwd, mname, maddr,mphone,mstate,regdate);
				return vo;
			}
			return null;
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
}
