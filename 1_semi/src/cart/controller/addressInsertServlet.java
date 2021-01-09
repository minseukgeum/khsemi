package cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.model.service.CartService;
import cart.model.vo.Address;

/**
 * Servlet implementation class addressUpdateServlet
 */
@WebServlet("/addressInsert.me")
public class addressInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addressInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String address_name = request.getParameter("myName");
		String myId = request.getParameter("myId");
		String receiver = request.getParameter("receiver");
		String myPhone = request.getParameter("myPhone");
		String myPostal = request.getParameter("myPostal");
		String myAddress1 = request.getParameter("myAddress1");
		String myAddress2 = request.getParameter("myAddress2");
		
		
		
		//System.out.println(address_name+ myId+ receiver+ myPhone+ myPostal+ myAddress1+ myAddress2);
		
		Address address = new Address(address_name, myId, receiver, myPhone, myPostal, myAddress1, myAddress2);
		
		int result = new CartService().insertAddress(address);
		
		if(result > 0) {
			response.sendRedirect("purchaseCart.me");
		} else {
			request.setAttribute("msg", "주소지 변경에 실패하였습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response); 
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
