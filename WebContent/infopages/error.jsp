<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="it" dir="ltr">
  <head>
    <%@include file="../parts/meta.jsp" %>
    <%@include file="../parts/head.jsp" %>
    <meta charset="utf-8">
    <title>Errore - Flyseum</title>
  </head>
  <body>
    <div class="container w-50 p-5 border border-danger">
      <p class="h3"><span class="small"><i class="em em-exclamation"></i></span> Errore!</p>
      <p class="my-0">Non è stato possibile eseguire la richiesta.</p>
      <p class="small">Exception:</p>
      <% Exception e = (Exception) request.getAttribute("exception");%>
      <p class="small text-muted">
        <% e.toString(); %>
      </p>
      <p class="text-right"><a href="../index.jsp">Torna alla home</a></p>
    </div>
  </body>
</html>
