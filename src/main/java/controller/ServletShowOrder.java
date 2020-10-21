package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.OrderBean;
import model.OrderBeanDAO;
import model.UserBean;

/**
 * Servlet implementation class ServletShowOrder
 */
@WebServlet("/ServletShowOrder")
public class ServletShowOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletShowOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<OrderBean> ordini = new ArrayList<OrderBean> ();
		HttpSession session = request.getSession(true);
		UserBean ub = (UserBean) session.getAttribute("UserBean");
		
		try {
			OrderBeanDAO obDAO = new OrderBeanDAO();
			ordini = obDAO.getOrders(ub.getEmail());
			request.setAttribute("orderList", ordini);
			RequestDispatcher rq = request.getRequestDispatcher("./parts/orders.jsp");
			rq.forward(request, response);
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
