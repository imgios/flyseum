package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CartBean;
import model.ProductBean;
import model.ProductBeanDAO;

/**
 * Servlet implementation class SelectFlight
 */
@WebServlet("/selectFlight")
public class SelectFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFlight() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		Integer flightId = Integer.parseInt(request.getParameter("flightId"));
		CartBean userCart = (CartBean) session.getAttribute("cart");
		if (userCart == null) {
			userCart = new CartBean();
		}
		ProductBeanDAO flightDAO = new ProductBeanDAO();
		ProductBean flightBean = flightDAO.searchByID(flightId);
		userCart.addProduct(flightBean);
		if (!userCart.isEmpty() && !userCart.getUser().equals("")) {
			userCart.saveCart(userCart, flightBean);
		}
		session.removeAttribute("cart");
		session.setAttribute("cart", userCart);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
