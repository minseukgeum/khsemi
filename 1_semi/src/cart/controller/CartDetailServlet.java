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
 * Servlet implementation class CartDetailServlet
 */
@WebServlet("/detail.no")
public class CartDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		int cart_no = Integer.parseInt(request.getParameter("cart_no"));
//		Cart c = new CartService().selectCart(cart_no);
//		
//		String page = null;
//		if(c != null) {
//			page = "WEB-INF/views/cart/cartDetail.jsp";
//			request.setAttribute("cart", c);
//		} else {
//			page = "WEB-INF/views/common/errorPage.jsp";
//			request.setAttribute("msg", "상품 조회에 실패하였습니다.");
//		}
//		
//		request.getRequestDispatcher(page).forward(request, response);
		
		//여기서 상품 페이지에 맞게 넘겨줘야함!
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
