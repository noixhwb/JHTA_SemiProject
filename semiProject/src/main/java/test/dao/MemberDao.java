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
	
	
	//하나 계정의 모든 정보 찾기
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
	
	
	//회원 정보수정
	public int update(MemberVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;

		try {
		con = JdbcUtil.getCon();
		String sql="update member_s set mpwd=?,maddr=?,mphone=? where mid =?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, vo.getMpwd());
		pstmt.setString(2, vo.getMaddr());
		pstmt.setString(3, vo.getMphone());
		pstmt.setString(4, vo.getMid());
		return pstmt.executeUpdate();

		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}	
	}
	
	
	//회원탈퇴
	public int delete(String mid) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String gg="0";
		try {
		con = JdbcUtil.getCon();
		String sql="update member_s set mstate=? where mid =?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, gg);
		pstmt.setString(2, mid);

		return pstmt.executeUpdate();

		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}	
	}
	
	
	
	//페이징 전용
	public int getCount(String field,String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql="select NVL(count(mid),0) from member_s";
			if(field!=null && !field.equals("")) {
				sql += " where "+ field +" like '%"+ keyword + "%'";
			}
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
			return -1;
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}		
	}
	public ArrayList<MemberVo> list(int startRow,int endRow,String field,String keyword){
		String sql="";
		if(field==null || field.equals("")) { //검색조건이 없는 경우
				sql= "select * from "
					+ "("
					+ "    select aa.*,rownum rnum from"
					+ "    ("
					+ "	      select * from member_s "
					+ "	      order by mid desc"
					+ "    )aa"
					+ ")"
					+ "where rnum>=? and rnum<=?";
		}else { //검색조건이 있는 경우
				sql= "select * from "
					+ "("
					+ "    select aa.*,rownum rnum from"
					+ "    ("
					+ "	      select * from member_s where "+ field  +" like '%"+ keyword +"%'"
					+ "	      order by mid desc"
					+ "    )aa"
					+ ")"
					+ "where rnum>=? and rnum<=?";
		}
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			ArrayList<MemberVo> list=new ArrayList<MemberVo>();
			while(rs.next()) {
				String mid=rs.getString("mid");
				String mpwd=rs.getString("mpwd");
				String mname=rs.getString("mname");
				String maddr=rs.getString("maddr");
				String mphone=rs.getString("mphone");
				int mstate=rs.getInt("mstate");
				Date regdate=rs.getDate("regdate");
				
				MemberVo vo=new MemberVo(mid, mpwd, mname, maddr,mphone,mstate, regdate);
				list.add(vo);
			}
			return list;
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
	
	//어드민페이지>사용자관리>유저정보 조회
	public MemberVo adminselect(String mid) {
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
			JdbcUtil.close(con,pstmt,rs);
		}
		
		
		
	}
	
	//어드민페이지에서 유저정보수정
	public int adminupdate(MemberVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=JdbcUtil.getCon();
			String sql="update member_s set mpwd=? , mname=? , maddr=? , mphone=? , mstate=? where mid=? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getMpwd());
			pstmt.setString(2, vo.getMname());
			pstmt.setString(3, vo.getMaddr());
			pstmt.setString(4, vo.getMphone());
			pstmt.setInt(5, vo.getMstate());
			pstmt.setString(6, vo.getMid());
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	
}
