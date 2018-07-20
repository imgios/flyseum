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
 * Servlet implementation class RemoveSelectedFlight
 */
@WebServlet("/RemoveSelectedFlight")
public class RemoveSelectedFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveSelectedFlight() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		CartBean userCart = (CartBean) session.getAttribute("cart");
		Integer flightId = Integer.parseInt(request.getParameter("flightId"));
		System.out.println(flightId);
		
		ProductBeanDAO flightBeanDAO = new ProductBeanDAO();
		ProductBean flightBean = flightBeanDAO.searchByID(flightId);
		if (!userCart.isEmpty()) {
			userCart.removeProduct(flightBean);
			userCart.removeFlightDB(flightBean);
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
