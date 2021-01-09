package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId"); //�엯�젰�븳 id媛� 諛쏆븘�삤湲�
		String userPwd = request.getParameter("userPwd"); //�엯�젰 pwd諛쏆븘�삤湲�
		Member member = new Member(userId, userPwd);
		Member loginUser = new MemberService().loginMember(member);
		
		if(loginUser != null) {
			//濡쒓렇�씤 �쉶�썝�씠 �엳�떎硫�
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser); //濡쒓렇�씤�쑀���젙蹂대�� �솕硫댁뿉 嫄대궡二쇨린 �쐞�빐
			session.setMaxInactiveInterval(600*1000); //濡쒓렇�씤 �쑀吏��떆媛�
			
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("msg", "로그인 실패");
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
			
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
