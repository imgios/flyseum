<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it" dir="ltr">
  <head>
    <%@include file="./parts/meta.jsp"%>
    <%@include file="./parts/head.jsp"%>
    <title>Flyseum</title>
    <!-- various index js 
    <script src="./js/flighttype.js"></script> -->
  </head>
  <body>
    <%@include file="./parts/navbar.jsp"%>
    <div class="container-fluid bg-light py-5">
	    <%Boolean checkout = (Boolean) request.getAttribute("checkout");%>
	    <div class="w-50 mx-auto">
	    <% if (!checkout) { %>
	    	<p class="h3">Errore!</p>
	    	<p class="text-small">Per poter effettuare un ordine devi prima effettuare l'accesso!</p>
	    	<p class="text-small text-right">Clicca in alto per effettuare il login, altrimenti clicca <a href="./register.jsp">QUI</a> per registrarti se sei un nuovo utente!</p>
	    <% } else if (checkout) {%>
	    	<p class="h3">Perfetto! <span class="text-small"><i class="em em-airplane"></i></span></p>
	    	<p class="text-small">L'ordine è stato effettuato con successo!</p>
	    	<p class="text-small text-right">Clicca <a href="./">QUI</a> per tornare alla home!</p>
	    <% } %>
	    </div>
    </div>
    <%@include file="./parts/footer.jsp"%>
  </body>
</html>