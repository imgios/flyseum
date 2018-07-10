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
    <div class="container-fluid bg-light py-5">
      <div class="row">
        <div class="col-sm my-5">
          <p class="h1 text-center text-warning"><i class="fas fa-paper-plane"></i></p>
          <p class="text-justify px-5">orem ipsum dolor sit amet, consectetur adipiscing elit. Proin lacinia pharetra purus, sed cursus sem gravida sit amet. Donec cursus est sed lacus commodo faucibus. Fusce accumsan risus sed sodales pharetra. Praesent tempor quis leo sit amet imperdiet. Sed elementum felis sit amet quam maximus, id venenatis diam vestibulum. Quisque efficitur, turpis eu malesuada lacinia, augue est fringilla est, a sollicitudin mi neque ac nunc. Quisque cursus volutpat maximus. Duis dapibus convallis ante quis ultrices. Sed in erat sem. Fusce leo diam, pharetra at aliquet at, pretium et ante. Nam tincidunt imperdiet augue, ac accumsan tortor tempor nec. Suspendisse vulputate et felis nec ornare. Suspendisse nisi eros, convallis sit amet sem id, consequat porta mauris.</p>
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
              <input type="password" id="regPsw" class="form-control" aria-describedby="helpPsw" placeholder="Inserisci la password" required>
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
