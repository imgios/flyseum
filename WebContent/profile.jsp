<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it" dir="ltr">
  <head>
    <%@include file="./parts/meta.jsp"%>
    <%@include file="./parts/head.jsp"%>
    <meta charset="utf-8">
    <title>Profilo - Flyseum</title>
  </head>
  <body>
    <%@include file="./parts/navbar.jsp"%>
    <div class="container-fluid bg-light text-dark py-5">
    <% if (user != null) { %>
      <div class="row">
        <div class="col-sm-3">
          <div class="list-group" id="list-tab" role="tablist">
            <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">Dashboard</a>
            <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">Profilo</a>
            <a class="list-group-item list-group-item-action" id="list-orders-list" data-toggle="list" href="#list-orders" role="tab" aria-controls="orders">Prenotazioni</a>
            <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">Impostazioni</a>
            <% if ("admin".equals(user.getRole())) {%>
            <a class="list-group-item disabled bg-info" id="list-admin-list" data-toggle="list"role="tab">Amministrazione</a>
            <a class="list-group-item list-group-item-action" id="list-admin-list" data-toggle="list" href="#list-admin" role="tab" aria-controls="settings">Aggiungi volo</a>
            <% } %>
          </div>
        </div>
        <div class="col-sm-9">
          <div class="tab-content" id="nav-tabContent">
            <!-- dashboard -->
            <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
              <p class="h3">Bentornato, <%=user.getNome()%>! <span class="text-muted small">È un buon periodo per prenotare voli, non pensi? <i class="em em-sunglasses small"></i></span></p>
              <p class="my-0">Hai effettuato <span id="userOrders">(null)</span> prenotazioni con noi!</p>
              <br/>
              <p class="my-2"><i class="em em-ticket"></i> Ecco la tua prossima prenotazione:</p>
              <dl id="nextFlight">
                <dt>Destinazione</dt>
                <dd id="nextDestination">null</dd>
                <dt>Data</dt>
                <dd id="nextDate">null</dd>
              </dl>
            </div>
            <!-- end dashboard / start profile -->
            <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
              <div class="row">
                <div class="col-2 py-5 text-center">
                  <p class="h1 text-primary"><i class="fas fa-user-circle"></i></p>
                </div>
                <div class="col-8">
                  <p class="my-0"><span class="font-weight-bold">Nome:</span> <%=user.getNome()%> <%=user.getCognome()%></p>
                  <p class="my-0"><span class="font-weight-bold">Email:</span> <%=user.getEmail()%></p>
                  <p class="my-0"><span class="font-weight-bold">Telefono:</span> null</p>
                  <p class="my-0"><span class="font-weight-bold">Flyseum Points:</span> <span id="userPoints">(null)</span></p>
                  <p class="my-0"><span class="font-weight-bold">Prenotazioni effettuate:</span> <span id="userOrders">(null)</span></p>
                </div>
              </div>
            </div>
            <!-- end profile / start orders -->
            <div class="tab-pane fade" id="list-orders" role="tabpanel" aria-labelledby="list-orders-list">work in progress</div>
            <!-- end orders / start settings -->
            <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">work in progress</div>
            <!-- end settings -->
            <% if ("admin".equals(user.getRole())) {%>
            <!-- start admin -->
            <div class="tab-pane fade" id="list-admin" role="tabpanel" aria-labelledby="list-admin-list">
            	<!-- addflight form -->
            	<%@ include file="./parts/addflight.jsp" %>
            	<!-- end addflight form -->
            </div>
            <!-- end admin -->
            <% } %>
          </div>
        </div>
      </div>
    <%} else { %>
    <p class="h3">C'è qualcosa che non va!</p>
    <p>Non hai effettuato l'accesso! <i class="em em-confounded small"></i></p>
    <p class="text-muted small">Clicca sul bottone in alto per effettuare l'accesso!</p>
    <% } %>
    </div>
    <%@include file="./parts/footer.jsp"%>
  </body>
</html>
