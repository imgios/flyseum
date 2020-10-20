<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang=it dir="ltr">
  <head>
    <%@include file="../parts/meta.jsp" %>
    <%@include file="../parts/head.jsp" %>
    <meta charset="utf-8">
    <title>Flyseum</title>
    <meta http-equiv="refresh" content="5; url=./index.jsp" />
  </head>
  <body class="bg-light">
  <%@include file="../parts/navbar.jsp"%>
    <div class="container">
	    <div class="card w-50 text-white bg-success my-5 mx-auto">
		  <div class="card-header">
		    <span class="small"><i class="fas fa-check-circle"></i></span> Operazione eseguita
		  </div>
		  <div class="card-body">
		    <h5 class="card-title">Stai per essere reindirizzato alla home.</h5>
		    <p class="card-text small"><a href="./index.jsp" class="text-white">Nel caso in cui dovessero esserci problemi con il reindirizzameno, clicca per tornare alla home.</a></p>
		  </div>
		</div>    
    </div>
    <%@include file="../parts/footer.jsp"%>
  </body>
</html>
