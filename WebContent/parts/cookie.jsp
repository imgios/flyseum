<%--<%
Cookie [] cookies = request.getCookies();
	      Cookie emailcookie=null;
	      Cookie rolecookie=null;
	      Cookie namecookie=null;
	      Cookie surnamecookie=null;

		      if (cookies != null) {
		      	for (Cookie tmp : cookies) {
		      		if("email".equals(tmp.getName())) {
		      		 	 emailcookie = tmp;
              }
		      		if("role".equals(tmp.getName())) {
		      		 	 rolecookie = tmp;
              }
              if("name".equals(tmp.getName())) {
   		      		 	 namecookie = tmp;
              }
		      		if("surname".equals(tmp.getName())) {
		      			surnamecookie = tmp;
              }
		        }
	        }
%>
--%>

<%-- userbean to add --%>
<%@page import="model.UserBean"%>
<% UserBean user = (UserBean) session.getAttribute("UserBean"); %>
<%-- cartbean to add --%>
<%@page import="model.CartBean"%>
<% CartBean cart = (CartBean) session.getAttribute("cart"); %>
<%-- flightbean to add --%>
<%@page import="model.ProductBean"%>
<%-- flightbeanDAO to add --%>
<%@page import="model.ProductBeanDAO"%>