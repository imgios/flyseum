package controller;

import java.io.IOException;

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
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String dest = request.getParameter("destination");
		String depart = request.getParameter("departure");
		String ID = request.getParameter("id");
		String company = request.getParameter("compagnia");
		float prezzo = Float.parseFloat(request.getParameter("prezzo"));
		String date = request.getParameter("data");
		
		try {
			ProductBeanDAO pbDAO = new ProductBeanDAO();
			ProductBean pb = pbDAO.newProduct(dest, depart, ID, company, prezzo, date);
			
			if(pb != null) {
				request.setAttribute("failed", false);
				RequestDispatcher rd = request.getRequestDispatcher("./AddProduct.jsp");
				rd.forward(request, response);
			}
			else {
				request.setAttribute("failed", true);
				RequestDispatcher rq = request.getRequestDispatcher("./AddProduct.jsp");
				rq.forward(request, response);
			}
		}catch(Exception e) {
			request.setAttribute("exception", true);
			RequestDispatcher rq2 = request.getRequestDispatcher("./Exception.jsp");
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
