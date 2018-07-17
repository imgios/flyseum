<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="it" dir="ltr">
  <head>
    <%@include file="../parts/meta.jsp" %>
    <%@include file="../parts/head.jsp" %>
    <meta charset="utf-8">
    <title>Errore - Flyseum</title>
  </head>
  <body class="bg-light">
  	<%@include file="../parts/navbar.jsp" %>
  	<div class="container">
	    <div class="card w-50 text-white bg-damage my-5 mx-auto">
		  <div class="card-header">
		    <span class="small"><i class="fas fa-exclamation-circle"></i></span> Errore
		  </div>
		  <div class="card-body">
		    <h5 class="card-title">Non è stato possibile eseguire la richiesta.</h5>
		    <p class="card-text">Exception:</p>
		    <% Exception e = (Exception) request.getAttribute("exception");%>
		    <p class="card-text small text-muted"><% e.printStackTrace(); %></p>
		    <p class="card-text text-right"><a href="./index.jsp" class="text-white font-weight-bold">Torna alla home</a></p>
		  </div>
		</div>    
    </div>
    <%@include file="../parts/footer.jsp" %>
  </body>
</html>
