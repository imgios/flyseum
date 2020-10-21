$("#submitFlight").on("click", function(event) {
	event.preventDefault();
	console.log("testing..");
	if (validateNewFlight()) {
		$.ajax({
		      type: "POST",
		      url: "ServletAdder",
		      data: "newDeparture="+$("#departureInput").val()+"&newDateDep="+$("#dateDepInput").val()+"&newTimeDep="+$("#timeDepInput").val()+"&newArrival="+$("#arrivalInput").val()+"&newDateArr="+$("#dateArrInput").val()+"&newTimeArr="+$("#timeArrInput").val()+"&newCompany="+$("#companyInput").val()+"&newMax="+$("#maxPassInput").val()+"&newPrice="+$("#priceInput").val(),
		      contentType: "application/x-www-form-urlencoded"
		  })
		  .done(function() {
			  	  $("#addMessage").show("fast");
		    	  $("#addMessage").addClass("alert-success");
		    	  $("#addMessage").text("Il volo è stato inserito con successo!");
		    	  $("#addMessage").delay(1000).fadeOut();
		    	  $("#addFlightForm")[0].reset();
		   })
		   .fail(function() {
			      $("#addMessage").show("fast");
		    	  $("#addMessage").addClass("alert-danger");
		    	  $("#addMessage").text("C'è stato un errore con l'inserimento del volo!");
		    	  $("#addMessage").delay(5000).fadeOut();
		      });
	}
});

function validateNewFlight() {
	var cityExp = /^[a-zA-Z\s]+$/;
	var destValid = $("#arrivalInput").val().match(cityExp); 
	console.log($("#arrivalInput").val());
	console.log("destvalid: "+destValid);
	var depValid = $("#departureInput").val().match(cityExp);
	console.log($("#departureInput").val());
	console.log("depvalid: "+depValid);
	
	console.log("validating..");
	if (!destValid) {
		$("#addMessage").show("fast");
		$("#addMessage").addClass("alert-danger");
		$("#addMessage").text("La città di destinazione non rispetta la sintassi! Ricordati che puoi utilizzare soltanto lettere e spazi.");
		$("#addMessage").delay(5000).fadeOut();
		return false;
	}
	if (!depValid) {
		$("#addMessage").show("fast");
		$("#addMessage").addClass("alert-danger");
		$("#addMessage").text("La città di partenza non rispetta la sintassi! Ricordati che puoi utilizzare soltanto lettere e spazi.");
		$("#addMessage").delay(5000).fadeOut();
		return false;
	}
	
	return true;
}