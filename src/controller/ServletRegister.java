package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserBean;
import model.UserBeanDAO;

/**
 * Servlet implementation class ServletRegister
 */
@WebServlet("/ServletRegister")
public class ServletRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String ID = request.getParameter("email");
		String password = request.getParameter("password");
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		
		try {
			UserBeanDAO ubDAO = new UserBeanDAO();
			UserBean ub = ubDAO.UserRegistration(ID,password,nome,cognome);
			
			if(ub.getEmail() != "duplicato" &&  ub.getPsw() != "duplicato" ) {
				RequestDispatcher rq = request.getRequestDispatcher("./success.jsp");
				rq.forward(request, response);
			}
			else {
				request.setAttribute("duplicato", true);
				RequestDispatcher rq2 = request.getRequestDispatcher("./Registration.jsp");
				rq2.forward(request, response);
			}
		}catch(Exception e) {
			request.setAttribute("exception", true);
			RequestDispatcher rq3 = request.getRequestDispatcher("./Exception.jsp");
			rq3.forward(request, response);
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
