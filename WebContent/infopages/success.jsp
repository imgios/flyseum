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
  <body>
    <div class="container p-5 w-50 border border-success">
      <% Boolean register = (Boolean) request.getAttribute("register"); %>
      <p class="h1"><span class="small"><i class="fas fa-check-circle text-success"></i></span> Operazione eseguita
      </p>
      <p class="my-0">Stai per essere reindirizzato alla home.</p>
      <p class="small"><a href="./index.jsp">Nel caso in cui dovessero esserci problemi con il reindirizzameno, clicca per tornare alla home.</a></p>
    </div>
  </body>
</html>
