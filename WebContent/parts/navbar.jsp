<!-- session -->
<span class="wb-sessto" data-wb-sessto='{
  "sessionalive": 86400000,
  "logouturl": "../index.jsp",
  "refreshCallbackUrl": "./"}'></span>
<!-- validation script -->
<script src="./js/user-form-validate.js"></script>
<!-- start navbar -->
<%@ include file="./cookie.jsp" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
  <a class="navbar-brand" href="#"><img src="./images/logo.png" width="30" height="30"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="./">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
    </ul>
    <ul class="navbar-nav text-inline my-2 my-lg-0">
      <% if (user != null) { %>
      <li class="nav-item">
        <a class="nav-link" href="./profile.jsp">Bentornato, <%out.print(user.getNome());%>!</a>
      </li>
      <li class="nav-item">
        <form class="form-inline" action="Logout" method="post">
          <button type="submit" id="logout" class="logbutton">
            <i class="fas fa-sign-out-alt nav-link"></i>
          </button>
        </form>
      </li>
      <%} else {%>
      <li class="nav-item">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#loginModal">Accedi <i class="fas fa-sign-in-alt"></i></button>
      </li>
      <%}%>
    </ul>
  </div>
</nav>
<!-- end navbar -->
<!-- start Login Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="loginModalLabel"><i class="fas fa-sign-in-alt"></i> Accedi</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<%Boolean denied = (Boolean) request.getAttribute("denied");%>
      	<% if (denied != null) { %>
        <div class="alert alert-danger" role="alert">I dati non sono corretti! Riprova.</div>
        <% } %>
        <form action="ServletLogin" method="post" name="loginForm">
          <div class="form-group">
            <label for="loginEmail">Indirizzo email</label>
            <input type="email" class="form-control" id="loginEmail" name="userEmail" aria-describedby="emailhHelp" placeholder="Email" required>
            <small id="emailHelp" class="form-text text-muted">Inserisci l'email utilizzata al momento della registrazione.</small>
          </div>
          <div class="form-group">
            <label for="loginPsw">Password</label>
            <input type="password" class="form-control" id="loginPsw" name="userPassword" aria-describedby="pswHelp" placeholder="Password" required>
            <small id="pswHelp" class="form-text text-muted">Inserisci la password utilizzata al momento della registrazione.</small>
          </div>
          <div class="row">
            <div class="col-sm">
              <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" id="rememberCheck">
                <label for="rememberCheck" class="form-check-label">Ricordami</label>
              </div>
            </div>
            <div class="col-sm text-right">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
              <button type="submit" onclick="return validate(this.form)" class="btn btn-success">Login</button>
            </div>
          </div>
        </form>
        <hr>
        <small><a href="./register.jsp">Nuovo utente? Clicca qui per registrarti! <i class="fas fa-user-plus"></i></a></small>
      </div>
    </div>
  </div>
</div>
<!-- end login modal -->
