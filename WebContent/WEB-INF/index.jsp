<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it" dir="ltr">
  <head>
    <%@include file="./parts/meta.jsp"%>
    <%@include file="./parts/head.jsp"%>
    <title>Flyseum</title>
    <!-- index js -->
    <!-- <script src="./js/randomflight.js"></script> -->
  </head>
  <body>
    <%@include file="./parts/navbar.jsp"%>
    <div class="container-fluid mainbox text-light text-center">
      <div class="w-50 p-3 mx-auto">
        <form action="searchFlight" method="get">
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
                <select class="custom-select" id "destination" name="destination" required>
                  <option value="amsterdam">Amsterdam</option>
                  <option value="cracovia">Cracovia</option>
                  <option value="parigi">Parigi</option>
                  <option value="dortmund">Dortmund</option>
                </select>
              </div>
              <div class="col-sm">
                <input type="date" id="aDate" name="aDate" required>
                <input type="date" id="rDate" name="rDate" required>
              </div>
            </div>
          </div>
          <button type="submit" class="btn btn-success btn-sm btn-block">Cerca</button>
        </form>
      </div>
    </div>
    <div class="container-fluid bg-white text-dark box-content mx-auto">
      <div class="row mx-auto">
        <div class="col-sm">
          <div class="card" style="width: 18rem;">
            <img class="card-img-top" id="cardimg1" src="./images/amsterdam.jpg" alt="Amsterdam">
            <div class="card-body">
              <h5 class="card-title text-capitalize" id="cardtitle1">Destination 1</h5>
              <button type="button" id="selectDest1" class="btn btn-primary btn-sm btn-block">Seleziona</button>
            </div>
          </div>
        </div>
        <div class="col-sm">
          <div class="card" style="width: 18rem;">
            <img class="card-img-top" id="cardimg2" src="./images/amsterdam.jpg" alt="Amsterdam">
            <div class="card-body">
              <h5 class="card-title text-capitalize" id="cardtitle2">Destination 2</h5>
              <button type="button" id="selectDest2" class="btn btn-primary btn-sm btn-block">Seleziona</button>
            </div>
          </div>
        </div>
        <div class="col-sm">
          <div class="card" style="width: 18rem;">
            <img class="card-img-top" id="cardimg3" src="./images/amsterdam.jpg" alt="Amsterdam">
            <div class="card-body">
              <h5 class="card-title text-capitalize" id="cardtitle3">Destination 3</h5>
              <button type="button" id="selectDest3" class="btn btn-primary btn-sm btn-block">Seleziona</button>
            </div>
          </div>
        </div>
        <div class="col-sm">
          <div class="card" style="width: 18rem;">
            <img class="card-img-top" id="cardimg4" src="./images/amsterdam.jpg" alt="Amsterdam">
            <div class="card-body">
              <h5 class="card-title text-capitalize" id="cardtitle4">Destination 4</h5>
              <button type="button" id="selectDest4" class="btn btn-primary btn-sm btn-block">Seleziona</button>
            </div>
          </div>
        </div>
      </div>
      <script src="./js/randomflight.js"></script>
    </div>
    <%@include file="./parts/footer.jsp"%>
  </body>
</html>
