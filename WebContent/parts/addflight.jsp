<div class="alert" id="addMessage" role="alert" hidden>
</div>
<p class="h3"><i class="fas fa-plane"></i> Aggiungi un nuovo volo</p>
      	<form action="ServletAdder" method="post" id="addFlightForm">
      		<div class="form-row">
     				<div class="col-md-6 form-group">
        		<label for="departureInput">Partenza da:</label>
				<input type="text" class="form-control" name="newDeparture" id="departureInput" aria-describedby="departureHelp" placeholder="Inserisci l'aereoporto di partenza">
				<small id="departureHelp" class="form-text text-muted">L'aereoporto di partenza non deve contenere numeri.</small>
       		</div>
       		<div class="col-md-3 form-group">
        		<label for="dateDepInput">Data partenza:</label>
				<input type="date" class="form-control" name="newDateDep" id="dateDepInput" aria-describedby="dateDepHelp">
				<small id="dateDepHelp" class="form-text text-muted">La data di partenza non può essere antecedente a quella odierna.</small>
      			</div>
      			<div class="col-md-3 form-group">
        		<label for="timeDepInput">Orario partenza:</label>
				<input type="time" class="form-control" name="newTimeDep" id="timeDepInput" aria-describeby="timeDepHelp">
				<small id="timeDepHelp" class="form-text text-muted">Sintassi: 12:59 AM</small>
      			</div>
      		</div>
      		<div class="form-row">
      			<div class="col-md-6 form-group">
        		<label for="arrivalInput">Arrivo a:</label>
				<input type="text" class="form-control" name="newArrival" id="arrivalInput" aria-describedby="arrivalHelp" placeholder="Inserisci l'aereoporto di arrivo">
				<small id="arrivalHelp" class="form-text text-muted">L'aereoporto di arrivo non deve contenere numeri.</small>
      			</div>
      			<div class="col-md-3 form-group">
        		<label for="dateArrInput">Data arrivo:</label>
				<input type="date" class="form-control" name="newDateArr" id="dateArrInput" aria-describedby="dateArrHelp">
				<small id="dateArrHelp" class="form-text text-muted">La data di partenza non può essere antecedente a quella di partenza.</small>
      			</div>
      			<div class="col-md-3 form-group">
        		<label for="timeArrInput">Orario arrivo:</label>
				<input type="time" class="form-control" name="newTimeArr" id="timeArrInput" aria-describedby="timeArrHelp">
				<small id="timeArrHelp" class="form-text text-muted">Sintassi: 12:59 AM</small>
      			</div>
      		</div>
      		<div class="form-row">
      			<div class="col-md-6 form-group">
        		<label for="companyInput">Compagnia:</label>
				<input type="text" class="form-control" name="newCompany" id="companyInput" placeholder="Inserisci la compagnia che offre il volo">
      			</div>
      			<div class="col-md-3 form-group">
      				<label for="maxPassInput">Posti massimi:</label>
      				<input type="number" class="form-control" name="newMax" id="maxPassInput" aria-describedby="maxPassHelp" min="0" max="200">
      				<small id="maxPassHelp" class="form-text text-muted">I posti massimi associabili ad un volo sono 200.</small>
      			</div>
      			<div class="col-md-3 form-group">
      				<label for="priceInput">Prezzo:</label>
      				<input type="number" class="form-control" name="newPrice" id="priceInput" min="0" step="0.01">
      			</div>
      		</div>
      		<p class="text-right"><button type="submit" class="btn btn-primary" id="submitFlight">Aggiungi volo</button></p>
      	</form>
<script src="./js/adminutil.js"></script>