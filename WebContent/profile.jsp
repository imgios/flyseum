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
      <div class="row">
        <div class="col-2">
          <div class="list-group" id="list-tab" role="tablist">
            <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">Dashboard</a>
            <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">Profilo</a>
            <a class="list-group-item list-group-item-action" id="list-orders-list" data-toggle="list" href="#list-orders" role="tab" aria-controls="orders">Prenotazioni</a>
            <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">Impostazioni</a>
          </div>
        </div>
        <div class="col-8">
          <div class="tab-content" id="nav-tabContent">
            <!-- dashboard -->
            <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
              <p class="h3">Bentornato, utente! <span class="text-muted small">È un buon periodo per prenotare voli, non pensi? <i class="em em-sunglasses small"></i></span></p>
              <p class="my-0">Hai effettuato x prenotazioni con noi, accumulando così y punti!</p>
              <p class="text-muted small">Ti mancano altri y punti per ricevere un bonus! <i class="em em-tada"></i></p>
              <p class="my-2"><i class="em em-ticket"></i> Ecco la tua prossima prenotazione:</p>
              <dl id="nextFlight">
                <dt>Destinazione</dt>
                <dd id="nextDestination">Dortmund</dd>
                <dt>Data</dt>
                <dd id="nextDate">18/10/2018</dd>
                <dt>Adulti <span class="text-muted small">(16+)</span></dt>
                <dd id="nextAdult">1</dd>
                <dt>Bambini <span class="text-muted small">(0-15)</span></dt>
                <dd id="nextKid">0</dd>
              </dl>
            </div>
            <!-- end dashboard / start profile -->
            <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
              <div class="row">
                <div class="col-2 py-5 text-center">
                  <p class="h1 text-primary"><i class="fas fa-user-circle"></i></p>
                </div>
                <div class="col-8">
                  <p class="my-0"><span class="font-weight-bold">Nome:</span> Nome Cognome</p>
                  <p class="my-0"><span class="font-weight-bold">Email:</span> email@flyseum.com</p>
                  <p class="my-0"><span class="font-weight-bold">Telefono:</span> (+39) 334 321 1234</p>
                  <p class="my-0"><span class="font-weight-bold">Flyseum Points:</span> 1234</p>
                  <p class="my-0"><span class="font-weight-bold">Prenotazioni effettuate:</span> 50</p>
                </div>
              </div>
            </div>
            <!-- end profile / start orders -->
            <div class="tab-pane fade" id="list-orders" role="tabpanel" aria-labelledby="list-orders-list">c</div>
            <!-- end orders / start settings -->
            <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">d</div>
            <!-- end settings -->
          </div>
        </div>
      </div>
    </div>
    <%@include file="./parts/footer.jsp"%>
  </body>
</html>
