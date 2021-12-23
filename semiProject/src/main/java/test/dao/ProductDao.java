package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import test.vo.CategoryVo;
import test.vo.ProductVo;
import test.vo.ProimageVo;
import test.vo.prodetailVo;

public class ProductDao {

	private static ProductDao instance=new ProductDao();
	private ProductDao() {}
	public static ProductDao getInstance()
	{
		return instance;
	}
	
	//상품 등록 insert
	public int insertProduct(ProductVo vo)
	{
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="insert into product values(seq_product.nextval,?,?,?,0,?)";
		try
		{
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getpName());
			pstmt.setString(2, vo.getpContent());
			pstmt.setInt(3,vo.getpPrice());
			pstmt.setString(4,vo.getcName());
			int n=pstmt.executeUpdate();
			return n;
		}catch (SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	//마지막 pk값 가져오기
	public int getpNum()
	{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select pnum from( select * from product order by pnum desc) where rownum=1";
		try
		{
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			int n=rs.getInt("pNum");
			return n;
		}catch(SQLException se)
		{
			se.printStackTrace();
			return 0;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	//상품 전체 리스트 가져오기
	public ArrayList<ProductVo> selectAll()
	{

		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from product";
		ArrayList<ProductVo> list=new ArrayList<ProductVo>();
		try
		{
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				int pnum=rs.getInt("pnum");
				String pname=rs.getString("pname");
				String pconten=rs.getString("pcontent");
				int pprice=rs.getInt("pprice");
				int pbuycount= rs.getInt("pbuycount");
				String cname=rs.getString("cname");
				ProductVo vo=new ProductVo(pnum, pname, pconten, pprice, pbuycount, cname);
			    list.add(vo);
			}
	
			return list;
		}catch(SQLException se)
		{
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
	//상세정보
	public ProductVo selectDetail(int pnum)
	{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from product where pnum=?";
		try
		{
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pnum);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				String pname=rs.getString("pname");
				String pconten=rs.getString("pcontent");
				int pprice=rs.getInt("pprice");
				int pbuycount= rs.getInt("pbuycount");
				String cname=rs.getString("cname");
				ProductVo vo=new ProductVo(pnum, pname, pconten, pprice, pbuycount, cname);
				return vo;
			}
	
			return null;
		}catch(SQLException se)
		{
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	//전체 목록 카운트 가져오기
	public int getCount_all(int startRow,int endRow)
	{

		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select NVL(count(pnum),0) ccount from (select product.*,rownum rnum from(select * from product order by pnum DESC )product)";
		
		try
		{
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			int count=rs.getInt("ccount");
			return count;
		}catch(SQLException se)
		{
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
	
	//페이징처리 
	public ArrayList<CategoryVo> selectAll_page(int startRow,int endRow)
	{

		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from (select product.*,rownum rnum from(select * from product order by pnum DESC )product) where rnum>=? and rnum<=?";
		ArrayList<CategoryVo> list=new ArrayList<CategoryVo>();
		try
		{
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				int pnum=rs.getInt("pnum");
				String pname=rs.getString("pname");	
				int pprice=rs.getInt("pprice");
				CategoryVo vo =new CategoryVo(pnum, pname, pprice, null);
			    list.add(vo);
			}
	
			return list;
		}catch(SQLException se)
		{
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
	
	//페이징처리+카테고리 리스트출력
	public ArrayList<CategoryVo> selectcategory(int startRow,int endRow,String code)
	{

		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from (select pnum,pname,pprice,code, rownum rnum from(select pnum,pname,pprice,code from product p,category c where p.cname=c.cname and c.code=? order by p.pnum DESC)product) where rnum>=? and rnum<=?";
		ArrayList<CategoryVo> list=new ArrayList<CategoryVo>();
		try
		{
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, code);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				int pnum=rs.getInt("pnum");
				String pname=rs.getString("pname");
				int pprice=rs.getInt("pprice");
		        String ccode=rs.getString("code");
				CategoryVo vo=new CategoryVo(pnum, pname, pprice, ccode);
			    list.add(vo);
			}
	
			return list;
		}catch(SQLException se)
		{
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	//카테고리별 전체 글수 가져오기
	public int getCount_category(int startRow,int endRow,String code)
	{

		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select NVL(count(pnum),0) ccount from (select pnum,pname,pprice,code, rownum rnum from(select pnum,pname,pprice,code from product p,category c where p.cname=c.cname and c.code=? order by p.pnum DESC)product)";
		try
		{
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, code);
	
			rs=pstmt.executeQuery();
			rs.next();
			int count=rs.getInt("ccount");
			return count;
		}catch(SQLException se)
		{
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	//페이징처리+cname별 출력
	public ArrayList<CategoryVo> selectcategory_cname(int startRow,int endRow,String code,String cname)
	{

		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from (select pnum,pname,pprice,code, rownum rnum from(select pnum,pname,pprice,code from product p,category c where p.cname=c.cname and c.code=? and p.cname=? order by p.pnum DESC)product) where rnum>=? and rnum<=?";
		ArrayList<CategoryVo> list=new ArrayList<CategoryVo>();
		try
		{
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, code);
			pstmt.setString(2, cname);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				int pnum=rs.getInt("pnum");
				String pname=rs.getString("pname");

				int pprice=rs.getInt("pprice");
				String ccode=rs.getString("code");
				
				CategoryVo vo=new CategoryVo(pnum, pname, pprice, ccode);
				list.add(vo);
			}
	
			return list;
		}catch(SQLException se)
		{
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	//cname별 count 가져오기
	public int getCount_cname(int startRow,int endRow,String code,String cname)
	{

		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select NVL(count(pnum),0) ccount from (select pnum,pname,pprice,code, rownum rnum from(select pnum,pname,pprice,code from product p,category c where p.cname=c.cname and c.code=? and p.cname=? order by p.pnum DESC)product)";
		try
		{
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, code);
			pstmt.setString(2, cname);
			rs=pstmt.executeQuery();
			rs.next();
			int count=rs.getInt("ccount");
			return count;
		}catch(SQLException se)
		{
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	//업데이트
	public int updateProduct(ProductVo vo)
	{
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="update product set pname=?,pcontent=?,pprice=?,cname=? where pnum=?";
		try
		{
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getpName());
			pstmt.setString(2, vo.getpContent());
			pstmt.setInt(3,vo.getpPrice());
			pstmt.setString(4,vo.getcName());
			pstmt.setInt(5,vo.getpNum());
			int n=pstmt.executeUpdate();
			return n;
		}catch (SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	
	}
	//삭제
	public int deleteProduct(int pnum)
	{
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="delete from product where pnum=?";
		try
		{
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,pnum);
			int n=pstmt.executeUpdate();
			return n;
		}catch (SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	
	}
}

	

