package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductBean;
import model.ProductBeanDAO;

/**
 * Servlet implementation class ServletResearchDest
 */
@WebServlet("/ServletResearchDest")
public class ServletResearchDest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletResearchDest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String destination = request.getParameter("destination");
		//String dateDest = request.getParameter("aDate");
		ArrayList<ProductBean> pbeans = new ArrayList<ProductBean> ();
		
		try {
			ProductBeanDAO pbDAO= new ProductBeanDAO();
			pbeans = pbDAO.searchByDestination(destination);
			request.setAttribute("flightList", pbeans);
			
			RequestDispatcher rd = request.getRequestDispatcher("./search.jsp");
			rd.forward(request, response);
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
