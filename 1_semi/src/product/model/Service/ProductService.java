package product.model.Service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import product.model.dao.ProductDAO;
import product.model.vo.Attachment;
import product.model.vo.Category;
import product.model.vo.PageInfo;
import product.model.vo.Product;

public class ProductService {

	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new ProductDAO().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Product> selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDAO().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Attachment> selectFList(ArrayList<Product> list) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> fList = new ProductDAO().selectList(conn, list);
		
		close(conn);
		
		return fList;
	}
	
	public ArrayList<Category> selectCList() {
		Connection conn = getConnection();
		
		ArrayList<Category> cList = new ProductDAO().selectCList(conn);
		
		close(conn);
		
		return cList;
	}

	public int insertProduct(Product p, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		ProductDAO dao = new ProductDAO();
		
		int result1 = dao.insertProduct(conn, p);
		int result2 = dao.insertAttachment(conn, fileList);
		int result3 = 0;
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
			result3 = 1;
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result3;
	}

	public Product selectProduct(int pId) {
		Connection conn = getConnection();
		
		Product board = new ProductDAO().selectProduct(conn, pId);
		
		close(conn);
		
		return board;
	}

	public ArrayList<Attachment> selectThumbnail(int pId) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> list = new ProductDAO().selectThumbnail(conn, pId);
		
		close(conn);
		
		return list;
	}

}
