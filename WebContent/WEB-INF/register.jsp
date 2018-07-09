<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <%@include file="./parts/meta.jsp"%>
    <%@include file="./parts/head.jsp"%>
    <title>Flyseum - Registrati</title>
  </head>
  <body>
    <%Boolean duplicate = (Boolean) request.getAttribute("denied");%>
    <%@include file="./parts/navbar.jsp"%>
    <div class="container-fluid bg-light">
      <div class="row">
        <div class="col-sm">
          text
        </div>
        <div class="col-sm">
          <p class="h4">Registrati a Flyseum</p>
          <form action="Register" method="post">
            <div class="form-group">
              <% if (duplicate != null) { %>
              <div class="alert alert-danger" role="alert">Email già esistente!</div>
              <% } %>
              <label for="regName">Nome</label>
              <input type="text" id="regName" class="form-control" placeholder="Inserisci il nome" required>
            </div>
            <div class="form-group">
              <label for="regSurname">Cognome</label>
              <input type="text" id="regSurname" class="form-control" placeholder="Inserisci il cognome" required>
            </div>
            <div class="form-group">
              <label for="regEmail">Email</label>
              <input type="email" id="regEmail" class="form-control" placeholder="Inserisci l'email" required>
            </div>
            <div class="form-group">
              <label for="regPsw">Password</label>
              <input type="password" id="regPsw" class="form-control" aria-describedby="helpPsw" required>
              <small id="helpPsw" class="form-text text-muted">La password dev'essere di minimo 8 caratteri e non deve contenere lettere accentate.</small>
            </div>
            <div class="form-group form-check">
              <input type="checkbox" class="form-check-input" id="regRemember">
              <label class="form-check-label" for="regRemember">Ricordami</label>
            </div>
            <button type="submit" class="btn btn-dark">Registrati</button>
          </form>
          <small class="text-muted">Flyseum non condividerà con nessuno i dati inseriti dall'utente.</small>
        </div>
      </div>
    </div>
    <%@include file="./parts/footer.jsp"%>
  </body>
</html>
