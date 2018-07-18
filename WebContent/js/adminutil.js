$("#addFlightForm").on("submit", function(event) {
	event.preventDefault();
	console.log("testing..");
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
	    	  $("#addMessage").delay(1000).fadeOut();
	      });
});