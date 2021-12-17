package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;
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
	
	
}
