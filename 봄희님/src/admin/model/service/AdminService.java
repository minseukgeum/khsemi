package admin.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import admin.model.dao.AdminDAO;
import board.model.dao.BoardDAO;
import board.model.vo.Board;
import admin.model.vo.BAttachment;
import admin.model.vo.Banner;
import admin.model.vo.PageInfo;
import buy.model.vo.Buy;
import member.model.vo.Member;

public class AdminService {

	// 총 게시물 갯수
	public int getListCount() {
		Connection conn = getConnection();
		
		int result = new AdminDAO().getListCount(conn);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Buy> selectList(admin.model.vo.PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Buy> list = new AdminDAO().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}

	public int getMemberListCount() {
		Connection conn = getConnection();
		
		int result = new AdminDAO().getMemberListCount(conn);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Member> selectMemberList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new AdminDAO().selectMemberList(conn, pi);
		
		close(conn);
		
		return list;
	}

	public int insertMainBanner(Banner b, ArrayList<BAttachment> fileList) {
		Connection conn = getConnection();
		
		AdminDAO dao = new AdminDAO();
		
		int result1 = dao.insertMainBanner(conn, b);
		int result2 = dao.insertAttachment(conn, fileList);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1;
	}


	public ArrayList selectTTlist(int i) {
		Connection conn = getConnection();
		
		ArrayList list = null;
		
		AdminDAO dao = new AdminDAO();
		
		if(i == 1) {
			list = dao.selectBlist(conn);
		} else {
			list = dao.selectFlist(conn);
		}
		close(conn);
		
		return list;
	}



}
