package cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.model.service.CartService;
import cart.model.vo.Address;
import member.model.vo.Member;

/**
 * Servlet implementation class CartPurchaseServlet
 */
@WebServlet("/purchaseCart.me")
public class CartPurchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartPurchaseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] chkArr = request.getParameterValues("chk");
		String chkList ="";
		if(chkArr != null) {
			for(int i=0; i< chkArr.length; i++) {
				if(i == chkArr.length) {
				} else {
					chkList += chkArr[i]+",";
					
				}
			}
		}
		
		String chk = chkList.substring(0, chkList.length()-1);
		System.out.println("구매할 장바구니 번호 : "+chk);
		
		
		//address정보를 갖고오기 위해서 session에 저장되어있는 멤버 아이디로 address를 select할 것
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String loginUserId = loginUser.getMemberid();
		
		Address add = new CartService().selectAddress(loginUserId);

		request.setAttribute("chk", chk);
		request.setAttribute("add", add);
		
		request.getRequestDispatcher("WEB-INF/views/cart/cartPurchase.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
