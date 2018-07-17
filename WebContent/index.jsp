<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it" dir="ltr">
  <head>
    <%@include file="./parts/meta.jsp"%>
    <%@include file="./parts/head.jsp"%>
    <title>Flyseum</title>
    <!-- various index js -->
    <script src="./js/flighttype.js"></script> <!-- flight type switch -->
    <script src="./js/slider.js"></script> <!-- suggested destination slider -->
  </head>
  <body>
    <%@include file="./parts/navbar.jsp"%>
    <div class="container-fluid mainbox py-5 bg-light text-light text-center">
      <div class="w-50 p-3 mx-auto">
        <form action="search" method="get">
          <div class="form-group custom-control custom-radio custom-control-inline">
            <input type="radio" id="arRadio" value="ar" name="flightType" class="custom-control-input">
            <label class="custom-control-label" for="arRadio">Andata e ritorno</label>
          </div>
          <div class="form-group custom-control custom-radio custom-control-inline">
            <input type="radio" id="aoRadio" value="ao" name="flightType" class="custom-control-input">
            <label class="custom-control-label" for="aoRadio">Solo andata</label>
          </div>
          <div class="form-group">
            <div class="row">
              <div class="col-sm">
                <select class="custom-select" id="destination" name="destination" required>
                  <option value="amsterdam">Amsterdam</option>
                  <option value="cracovia">Cracovia</option>
                  <option value="parigi">Parigi</option>
                  <option value="dortmund">Dortmund</option>
                </select>
              </div>
              <div class="col-sm">
                <input type="date" id="aDate" name="aDate" required>
                <script src="./js/todaydate.js"></script>
                <input type="date" id="rDate" name="rDate" required>
              </div>
            </div>
          </div>
          <button type="submit" class="btn btn-success btn-sm btn-block">Cerca</button>
        </form>
      </div>
    </div>
    <div class="py-5 container-fluid bg-light text-dark text-center">
      <p class="h3"><span class="text-danger"><i class="fas fa-map-marker-alt"></i></span> Mete consigliate per te</p>
      <div class="card-deck">
        <div class="card" style="width: 18rem;">
          <img class="card-img-top" id="cardimg1" src="./images/amsterdam.jpg" alt="Amsterdam">
          <div class="card-body">
            <h5 class="card-title text-capitalize" id="cardtitle1">Destination 1</h5>
          </div>
          <div class="card-footer">
            <button type="button" id="selectDest1" class="btn btn-primary btn-sm btn-block">Seleziona</button>
          </div>
        </div>
        <div class="card" style="width: 18rem;">
          <img class="card-img-top" id="cardimg2" src="./images/amsterdam.jpg" alt="Amsterdam">
          <div class="card-body">
            <h5 class="card-title text-capitalize" id="cardtitle2">Destination 2</h5>
          </div>
          <div class="card-footer">
            <button type="button" id="selectDest2" class="btn btn-primary btn-sm btn-block">Seleziona</button>
          </div>
        </div>
        <div class="card" style="width: 18rem;">
          <img class="card-img-top" id="cardimg3" src="./images/amsterdam.jpg" alt="Amsterdam">
          <div class="card-body">
            <h5 class="card-title text-capitalize" id="cardtitle3">Destination 3</h5>
          </div>
          <div class="card-footer">
            <button type="button" id="selectDest3" class="btn btn-primary btn-sm btn-block">Seleziona</button>
          </div>
        </div>
        <div class="card" style="width: 18rem;">
          <img class="card-img-top" id="cardimg4" src="./images/amsterdam.jpg" alt="Amsterdam">
          <div class="card-body">
            <h5 class="card-title text-capitalize" id="cardtitle4">Destination 4</h5>
          </div>
          <div class="card-footer">
            <button type="button" id="selectDest4" class="btn btn-primary btn-sm btn-block">Seleziona</button>
          </div>
        </div>
      </div>
      <!-- random destination -->
      <script src="./js/randomflight.js"></script>
      <!-- end random destination -->
    </div>
    <div class="py-5 container-fluid text-center bg-light text-dark">
      <p class="h3"><span class="text-warning"><i class="fas fa-paper-plane"></i></span> Perché Flyseum?</p>
      <div class="row px-5">
        <div class="col-sm">
          <p class="mb-0 h2 text-center text-danger"><i class="far fa-question-circle"></i></p>
          <p class="mb-0 text-justify">Flyseum è il motore di ricerca di viaggi che trova il volo più adatto a te, da Roma verso qualsiasi capitale europea, mostrandoti la miglior offerta presenta sul mercato!</p>
        </div>
        <div class="col-sm">
          <p class="mb-0 h2 text-center text-primary"><i class="far fa-thumbs-up"></i></p>
          <p class="mb-0 text-justify">Scegli la destinazione, la data ed il volo. Al resto ci pensa Flyseum! Flyseum trova il volo più adatto a te, semplificando l'intero processo di prenotazione!</p>
        </div>
        <div class="col-sm">
          <p class="mb-0 h2 text-center text-success"><i class="fas fa-share-alt"></i></p>
          <p class="mb-0 text-justify">Seguici su Facebook, Twitter, Instagram e Youtube per scoprire tutte le novità su Flyseum, trovare spunti e consigli di viaggio e per raccontarci un po' della tua vita da viaggiatore!</p>
        </div>
      </div>
    </div>
    <%@include file="./parts/footer.jsp"%>
  </body>
</html>
