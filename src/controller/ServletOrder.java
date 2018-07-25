package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CartBean;
import model.OrderBean;
import model.OrderBeanDAO;
import model.UserBean;

/**
 * Servlet implementation class ServletOrder
 */
@WebServlet("/checkout")
public class ServletOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession(true);
		UserBean ub = (UserBean) session.getAttribute("user");
		CartBean cart = (CartBean) session.getAttribute("cart");
		OrderBean ob = new OrderBean();
		
		try {
			
			ob.setEmail(ub.getEmail());
			ob.setID(cart.getProduct(0).getId());
			OrderBeanDAO obDAO = new OrderBeanDAO();
			
			if(ob == null || ub == null) {
				request.setAttribute("checkout", false);
				RequestDispatcher rq = request.getRequestDispatcher("./checkout.jsp");
				rq.forward(request, response);
			}else {
				request.setAttribute("checkout", true);
				obDAO.addOrder(ob.getEmail(), ob.getID());
				RequestDispatcher rq = request.getRequestDispatcher("./success.jsp");
				rq.forward(request, response);
			}
		}catch(Exception e) {
			request.setAttribute("exception", e);
			RequestDispatcher rq2 = request.getRequestDispatcher("./infopages/error.jsp");
			rq2.forward(request, response);
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
