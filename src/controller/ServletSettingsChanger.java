package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserBean;
import model.UserBeanDAO;

/**
 * Servlet implementation class ServletSettingsChanger
 */
@WebServlet("/ServletSettingsChanger")
public class ServletSettingsChanger extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletSettingsChanger() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		UserBean user = (UserBean) session.getAttribute("UserBean");
		
		if (user == null) {
			response.setStatus(500);
		} else {
			try {
				String type = request.getParameter("type");
				String oldVar = request.getParameter("old");
				String newVar = request.getParameter("new");
				UserBeanDAO ubd = new UserBeanDAO();
				if(type.equals("email")) {
					ubd.changeEmail(user, oldVar, newVar);
					response.setStatus(200);
				}
				else if(type.equals("psw")) {
					ubd.changePsw(user, oldVar, newVar);
					response.setStatus(200);
				}
				else {
					response.setStatus(500);
				}
			}catch(Exception e) {
				response.setStatus(500);
			}
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
