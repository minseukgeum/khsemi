package cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.model.service.CartService;
import cart.model.vo.Cart;

/**
 * Servlet implementation class CartDeleteServlet
 */
@WebServlet("/deleteCart.me")
public class CartDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String chk = request.getParameter("checkArr");
		
		int result = new CartService().deleteCart(chk); 
		

		if(result > 0) {
			response.sendRedirect("cart.me");
		} else {
			request.setAttribute("msg", "장바구니 삭제에 실패하였습니다. ");
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
