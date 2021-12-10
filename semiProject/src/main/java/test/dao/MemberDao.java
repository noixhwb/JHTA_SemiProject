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
	public ArrayList<MemberVo> selectAll(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql="select * from member_s";
			pstmt=con.prepareStatement(sql);
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

				MemberVo member=new MemberVo(mid, mpwd, mname, maddr,mphone,mstate,regdate);
				list.add(member);
			}
			return list;
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
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
}
