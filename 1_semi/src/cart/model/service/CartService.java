package cart.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import cart.model.dao.CartDAO;
import cart.model.vo.Address;
import cart.model.vo.Cart;

public class CartService {
	
	
	

	public ArrayList<Cart> selectList(String memberId) {
		
		Connection conn = getConnection();
		
		ArrayList<Cart> list  = new CartDAO().selectList(conn, memberId);
		
		close(conn);
		
		return list;
	}

	public int deleteCart(String chk) {
		
		Connection conn = getConnection();
		
		int result = new CartDAO().deleteCart(conn, chk);
		
		close(conn);
		
		return result;
	}


	public int modifyCart(Cart cart) {
		
		Connection conn = getConnection();
		
		int result = new CartDAO().modifyCart(conn, cart);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Cart selectCart(int cart_no) {
		
		Connection conn = getConnection();
		
		Cart cart = new CartDAO().selectCart(conn, cart_no);
		
		close(conn);
		
		return cart;
	}

	public int insertAddress(Address address) {
		
		Connection conn = getConnection();
		
		int result = new CartDAO().insertAddress(conn, address);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public Address selectAddress(String loginUserId) {
		
		Connection conn = getConnection();
		Address add = new CartDAO().selectAddress(conn, loginUserId);
		
		close(conn);
		
		return add;
	}


	
	
}
