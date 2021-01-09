//회원가입 14.
package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class CheckIdServlet
 */
@WebServlet("/checkId.me")
public class CheckIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String userId = request.getParameter("inputId");
		String userId = request.getParameter("userId");
		int result = new MemberService().checkId(userId);
		
//		request.setAttribute("result",  result);
//		request.setAttribute("checkedId", userId);
//		
//		RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/member/checkIdForm.jsp");
//		view.forward(request, response);
		
		PrintWriter out = response.getWriter();
		if(result > 0) {
			out.print("fail");
		} else {
			out.print("success");
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
