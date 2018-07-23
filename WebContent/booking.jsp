<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it" dir="ltr">
	<head>
		<%@include file="./parts/meta.jsp"%>
		<%@include file="./parts/head.jsp"%>
		<title>Booking in progress - Flyseum</title>
	</head>
	<body>
		<%@include file="./parts/navbar.jsp"%>
		<div class="container-fluid py-5 bg-light">
			<% if (session == null || cart == null || cart.isEmpty()) { %>
			<p class="font-weight-bold">Non hai selezionato alcun volo!</p>
			<% } else {%>
			<div class="container w-75 table-responsive"><table class="table table-borderless">
			  <thead>
			    <tr>
			      <th scope="col">ID</th>
			      <th scope="col">Compagnia</th>
			      <th scope="col">Partenza</th>
			      <th scope="col">Destinazione</th>
			      <th scope="col">Data di partenza</th>
			      <th scope="col">Data di arrivo</th>
			      <th scope="col">Prezzo</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<% if (cart.getUser() != null && cart.getUser() != "") {
			  		cart = cart.restoreCart();
			  	}
			  	ArrayList<ProductBean> flights = cart.getAllProduct();
			  	for (ProductBean flight : flights) {
			  		out.println("<tr>");
			  		out.println("<th scope=\"row\">"+flight.getId()+"</th>");
			  		out.println("<td class=\"text-capitalize\">"+flight.getCompagniaAerea()+"</td>");
			  		out.println("<td class=\"text-capitalize\">"+flight.getPartenza()+"</td>");
			  		out.println("<td class=\"text-capitalize\">"+flight.getDestinazione()+"</td>");
			  		out.println("<td>"+flight.getDataPartenza().toString().split("\\.")[0]+"</td>");
			  		out.println("<td>"+flight.getDataArrivo().toString().split("\\.")[0]+"</td>");
			  		out.println("<td>"+flight.getPrezzo()+"</td>");
			  		out.println("</tr>");
			  	}
			  	%>
			  </tbody>
			</table>
			<p class="text-right"><button type="button" class="btn btn-sm btn-success">Procedi all'acquisto!</button></p></div>
			<% } %>
		</div>
		<%@include file="./parts/footer.jsp"%>
	</body>
</html>