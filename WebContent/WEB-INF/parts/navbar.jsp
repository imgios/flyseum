<!-- session -->
<span class="wb-sessto" data-wb-sessto='{
  "sessionalive": 86400000,
  "logouturl": "../index.jsp",
  "refreshCallbackUrl": "./"}'></span>
<!-- start navbar -->
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
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
    <ul class="navbar-nav text-inline my-2 my-lg-0">
      <!-- including cookies -->
      <%@include file="./cookie.jsp"%>
      <% if (namecookie != null) { %>
      <li class="nav-item">
        <a class="nav-link" href="./profile.jsp">Bentornato, <% out.print(namecookie.getValue()); %>!</a>
      </li>
      <li class="nav-item">
        <form class="form-inline" action="Logout" method="post">
          <button type="submit" id="logout" class="logbutton">
            <i class="fas fa-sign-out-alt nav-link"></i>
          </button>
        </form>
      </li>
      <% } else { %>
      <li class="nav-item">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#loginModal">Accedi <i class="fas fa-sign-in-alt"></i></button>
      </li>
      <% } %>
    </ul>
  </div>
</nav>
<!-- end navbar -->
<!-- start Login Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="loginModalLabel">Accedi</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="Login" method="post">
          <div class="form-group">
            <label for="loginEmail">Indirizzo email</label>
            <input type="email" class="form-control" id="loginEmail" aria-describedby="emailhHelp" placeholder="Email">
            <small id="emailHelp" class="form-text text-muted">Inserisci l'email utilizzata al momento della registrazione.</small>
          </div>
          <div class="form-group">
            <label for="loginPsw">Password</label>
            <input type="password" class="form-control" id="loginPsw" aria-describedby="pswHelp" placeholder="Password">
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
              <button type="submit" class="btn btn-success">Login</button>
            </div>
          </div>
        </form>
        <hr>
        <small><a href="./register.jsp">Nuovo utente? Clicca qui per registrarti! <i class="fas fa-sign-in-alt"></i></a></small>
      </div>
    </div>
  </div>
</div>
<!-- end login modal -->
