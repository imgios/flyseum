<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <%@include file="./parts/meta.jsp"%>
    <%@include file="./parts/head.jsp"%>
    <title>Ricerca voli - Flyseum</title>
  </head>
  <body>
    <%@include file="./parts/navbar.jsp"%>
    <div class="container-fluid bg-light py-5">
      <% ArrayList<ProductBean> flights = (ArrayList<ProductBean>) request.getAttribute("flightList");%>
      <% Boolean onlygo = (request.getParameter("flightType").equals("ao")) ? true : false; %>
      <div class="alert" id="selectMessage" role="alert">
      </div>
      <div class="row">
        <div class="col-8">
          <div class="container-fluid bg-primary text-white py-3">Andata</div>
          	<table class="table table-hover" id="goTable">
            <thead class="thead-dark">
              <tr>
                <th scope="col">ID</th>
                <th scope="col">Compagnia</th>
                <th scope="col">Destinazione</th>
                <th scope="col">Data partenza</th>
                <th scope="col">Data arrivo</th>
                <th scope="col">Posti</th>
                <th scope="col">Prezzo</th>
                <th scope="col">&nbsp;</th>
              </tr>
            </thead>
            <tbody>
              <%if (!flights.isEmpty()) {
                for (ProductBean f : flights) {
                  if (f.getPartenza().equals("roma")) {
                	  out.print("<tr>");
                	  out.print("<th scope=\"row\" id=\"id-"+f.getId()+"\">"+f.getId()+"</th>");
                      out.print("<td id=\"company-"+f.getId()+"\">"+f.getCompagniaAerea()+"</td>");
                      out.print("<td id=\"destination-"+f.getId()+"\">"+f.getDestinazione()+"</td>");
                      out.print("<td id=\"dateDep-"+f.getId()+"\">"+f.getDataPartenza().toString()+"</td>");
                      out.print("<td id=\"dateArr-"+f.getId()+"\">"+f.getDataArrivo().toString()+"</td>");
                      out.print("<td>"+f.getPosti()+"</td>");
                      out.print("<td id=\"price-"+f.getId()+"\">"+f.getPrezzo()+"</td>");
                      out.print("<td><button type=\"button\" class=\"btn btn-success\" id=\"flight-"+f.getId()+"\" onclick=\"selectFlight("+f.getId()+", goTable)\">Seleziona</button></td>");
                      out.print("</tr>");
                  }
                }
               }%>
            </tbody>
          </table>
          </div>
          <div class="col-4" id="userFlights">
          	<div class="container-fluid bg-success text-white py-3">Prenotazione</div>
          </div>
       </div>
       <% if (!onlygo) { %>
       <div class="row">
       	<div class="col-8">
       		<div class="container-fluid bg-primary text-white py-3">Ritorno</div>
	          	<table class="table table-hover" id="backTable">
		            <thead class="thead-dark">
		              <tr>
		                <th scope="col">ID</th>
		                <th scope="col">Compagnia</th>
		                <th scope="col">Destinazione</th>
		                <th scope="col">Data partenza</th>
		                <th scope="col">Data arrivo</th>
		                <th scope="col">Posti</th>
		                <th scope="col">&nbsp;</th>
		              </tr>
		            </thead>
		            <tbody>
		            	<%if (!flights.isEmpty()) {
			                for (ProductBean f : flights) {
			                  if (f.getDestinazione().equals("roma")) {
			                	  out.print("<tr>");
			                      out.print("<th scope=\"row\" id=\"id-"+f.getId()+"\">"+f.getId()+"</th>");
			                      out.print("<td id=\"company-"+f.getId()+"\">"+f.getCompagniaAerea()+"</td>");
			                      out.print("<td id=\"destination-"+f.getId()+"\">"+f.getDestinazione()+"</td>");
			                      out.print("<td id=\"dateDep-"+f.getId()+"\">"+f.getDataPartenza().toString()+"</td>");
			                      out.print("<td id=\"dateArr-"+f.getId()+"\">"+f.getDataArrivo().toString()+"</td>");
			                      out.print("<td>"+f.getPosti()+"</td>");
			                      out.print("<td id=\"price-"+f.getId()+"\">"+f.getPrezzo()+"</td>");
			                      out.print("<td><button type=\"button\" class=\"btn btn-success\" id=\"flight-"+f.getId()+"\" onclick=\"selectFlight("+f.getId()+", backTable)\">Seleziona</button></td>");
			                      out.print("</tr>");
			                  }
			                }
			               }%>
		            </tbody>
	          </table>
          </div>
       	</div>
       </div>
       <% } %>
    <%@include file="./parts/footer.jsp"%>
  </body>
</html>
