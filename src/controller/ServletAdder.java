package controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductBean;
import model.ProductBeanDAO;

/**
 * Servlet implementation class ServletAdder
 */
@WebServlet("/ServletAdder")
public class ServletAdder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAdder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String dest = request.getParameter("newArrival");
		String depart = request.getParameter("newDeparture");
		String company = request.getParameter("newCompany");
		Float prezzo = Float.parseFloat(request.getParameter("newPrice"));
		Timestamp dateDeparture = Timestamp.valueOf(request.getParameter("newDateDep")+" "+request.getParameter("newTimeDep")+":00");
		Timestamp dateArrival = Timestamp.valueOf(request.getParameter("newDateArr")+" "+request.getParameter("newTimeArr")+":00");
		Integer posti = Integer.parseInt(request.getParameter("newMax"));
		
		try {
			ProductBeanDAO pbDAO = new ProductBeanDAO();
			ProductBean pb = pbDAO.newProduct(dest, depart, company, prezzo, dateDeparture, dateArrival);
			
			if(pb != null) {
				//request.setAttribute("failed", false);
				//RequestDispatcher rd = request.getRequestDispatcher("./AddProduct.jsp");
				//rd.forward(request, response);
				//response.sendRedirect("./infopages/success.jsp");
				response.setStatus(200);
			}
			else {
				//request.setAttribute("failed", true);
				//RequestDispatcher rq = request.getRequestDispatcher("./AddProduct.jsp");
				//rq.forward(request, response);
				//response.sendRedirect("./infopages/error.jsp");
				response.setStatus(400);
			}
		}catch(Exception e) {
			//request.setAttribute("exception", e);
			//RequestDispatcher rq2 = request.getRequestDispatcher("./infopages/error.jsp");
			//rq2.forward(request, response);
			response.setStatus(500);
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
