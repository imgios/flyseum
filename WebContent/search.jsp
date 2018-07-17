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
      <%-- ArrayList<ProductBean> flights2 = (ArrayList<ProductBean>) request.getAttribute("flightList2");--%>
      <div class="row">
        <div class="col-8">
          <div class="container-fluid bg-primary text-white py-3">Andata</div>
          	<table class="table table-hover">
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
              <% if (!flights.isEmpty()) {
                for (ProductBean f : flights) {
                  out.print("<tr>");
                  out.print("<th scope=\"row\">"+f.getId()+"</th>");
                  out.print("<td>"+f.getCompagniaAerea()+"</td>");
                  out.print("<td>"+f.getDestinazione()+"</td>");
                  out.print("<td>"+f.getDataPartenza().toString()+"</td>");
                  out.print("<td>"+f.getDataArrivo().toString()+"</td>");
                  out.print("<td>"+f.getPosti()+"</td>");
                  out.print("<td>"+f.getPrezzo()+"</td>");
                  out.print("<td><button type=\"button\" class=\"btn btn-success\" id=\"flight-"+f.getId()+"\">Seleziona</button></td>");
                  out.print("</tr>");
                }
               }%>
            </tbody>
          </table>
          </div>
          <div class="col-4">
          	<div class="container-fluid bg-success text-white py-3">Prenotazione</div>
          </div>
       </div>
       <div class="row">
       	<div class="col-8">
       		<div class="container-fluid bg-primary text-white py-3">Ritorno</div>
          	<table class="table table-hover">
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
              <%-- if (!flights2.isEmpty()) {
                for (ProductBean f : flights2) {
                  out.print("<tr>");
                  out.print("<th scope=\"row\">"+f.getId()+"</th>");
                  out.print("<td>"+f.getCompagniaAerea()+"</td>");
                  out.print("<td>"+f.getDestinazione()+"</td>");
                  out.print("<td>"+f.getDataPartenza().toString()+"</td>");
                  out.print("<td>"+f.getDataArrivo().toString()+"</td>");
                  out.print("<td>"+f.getPosti()+"</td>");
                  out.print("<td>"+f.getPrezzo()+"</td>");
                  out.print("<td><button type=\"button\" class=\"btn btn-success\" id=\"flight-"+f.getId()+"\">Seleziona</button></td>");
                  out.print("</tr>");
                }
               }--%>
            </tbody>
          </table>
          </div>
       	</div>
       </div>
    <%@include file="./parts/footer.jsp"%>
  </body>
</html>
