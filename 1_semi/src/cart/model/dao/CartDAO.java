package cart.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import cart.model.vo.Address;
import cart.model.vo.Cart;

public class CartDAO {
	
	private Properties prop = new Properties();
	
	public CartDAO() {
		String fileName = CartDAO.class.getResource("/sql/cart/cart-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	


	public ArrayList<Cart> selectList(Connection conn, String memberId) {
		
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		ArrayList<Cart> list = new ArrayList<Cart>();
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,memberId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Cart c = new Cart(rset.getInt("CART_NO"),
								  rset.getString("P_ID"),
								  rset.getString("MEMBERID"),
								  rset.getString("PNAME"),
								  rset.getInt("CART_PPRICE"),
								  rset.getInt("AMOUNT"));
				list.add(c);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int deleteCart(Connection conn, String chk) {
		
//		PreparedStatement pstmt = null;
		Statement stmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteCart");
		query += "(" + chk + ")";
		
		try {
//			pstmt = conn.prepareStatement(query);
			stmt = conn.createStatement();
//			pstmt.setString(1, chk);
			
//			result = pstmt.executeUpdate();
			result = stmt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		
		return result;
	}



	public int modifyCart(Connection conn, Cart cart) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("modifyCart");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cart.getAmount());
			pstmt.setInt(2, cart.getCart_no());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}

		return result;
	}




	public Cart selectCart(Connection conn, int cart_no) {
		
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Cart c = null;
		
		String query = prop.getProperty("selectCartDetail");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cart_no);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				 c = new Cart(rset.getInt("CART_NO"),
							  rset.getString("P_ID"),
							  rset.getString("MEMBERID"),
							  rset.getString("PNAME"),
							  rset.getInt("CART_PPRICE"),
							  rset.getInt("AMOUNT"));				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return c;
	}




	public int insertAddress(Connection conn, Address address) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateAddress");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, address.getAddress_name());
			pstmt.setString(2, address.getMemberid());
			pstmt.setString(3, address.getReceiver());
			pstmt.setString(4, address.getRe_phone());
			pstmt.setString(5, address.getPostal());
			pstmt.setString(6, address.getAddress1());
			pstmt.setString(7, address.getAddress2());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}




	public Address selectAddress(Connection conn, String loginUserId) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Address add = null;
		
		String query = prop.getProperty("selectAddress");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginUserId);
			
			rset = pstmt.executeQuery();
			
			//결과는 0개아님 1개일것.. 아마두?
			if(rset.next()) {
				add = new Address(rset.getString("address_name"),
								  rset.getString("memberid"),
								  rset.getString("receiver"),
								  rset.getString("re_phone"),
								  rset.getString("postal"),
								  rset.getString("address1"),
								  rset.getString("address2"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return add;
	}





}
