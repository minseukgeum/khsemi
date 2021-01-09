package product.model.dao;

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

import product.model.vo.Attachment;
import product.model.vo.Category;
import product.model.vo.PageInfo;
import product.model.vo.Product;

public class ProductDAO {
	private Properties prop = new  Properties();
	
	public ProductDAO() {
		String fileName = ProductDAO.class.getResource("/sql/product/product-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		};
	}

	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}

	public ArrayList<Product> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<Product>();
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		String query = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Product p = new Product(rset.getInt("P_ID"),
						rset.getString("P_NAME"),
						rset.getString("P_PRICE"),
						rset.getString("P_CATEGORY"),
						rset.getString("P_DESCRIPTION"),
						rset.getString("P_ORIGIN"),
						rset.getString("P_CAPACITY"));
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Attachment> selectList(Connection conn, ArrayList<Product> list) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> fList = new ArrayList<Attachment>();
		
		String query = prop.getProperty("selectFList");
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Attachment a = new Attachment(rset.getInt("FILE_ID"),
						rset.getInt("P_ID"),
						rset.getString("ORIGIN_NAME"),
						rset.getString("CHANGE_NAME"),
						rset.getString("FILE_PATH"),
						rset.getInt("FILE_LEVEL"));
				
				fList.add(a);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return fList;
	}
	
	public ArrayList<Category> selectCList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Category> cList = new ArrayList<Category>();
		
		String query = prop.getProperty("selectCList");
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Category c = new Category(rset.getInt("CATE_ID"),
						rset.getString("CATE_NAME"));
				
				cList.add(c);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return cList;
	}

	public int insertProduct(Connection conn, Product p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertProduct");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getpName());
			pstmt.setString(2, p.getpPrice());
			pstmt.setString(3, p.getpCategory());
			pstmt.setString(4, p.getpDescription());
			pstmt.setString(5, p.getpOrigin());
			pstmt.setString(6, p.getpCapacity());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertAttachment(Connection conn, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				Attachment at = fileList.get(i);
				
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Product selectProduct(Connection conn, int pId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product product = null;
		
		String query = prop.getProperty("selectProduct");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				product = new Product(rset.getInt("P_ID"),
						rset.getString("P_NAME"),
						rset.getString("P_PRICE"),
						rset.getString("CATE_NAME"),
						rset.getString("P_DESCRIPTION"),
						rset.getString("P_ORIGIN"),
						rset.getString("P_CAPACITY"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return product;
	}

	public ArrayList<Attachment> selectThumbnail(Connection conn, int pId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> list = new ArrayList<Attachment>();
		
		String query = prop.getProperty("selectThumbnail");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setFileId(rset.getInt("FILE_ID"));
				at.setpId(rset.getInt("P_ID"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
				
				list.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
}
