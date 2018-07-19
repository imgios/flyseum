// add a new flight inside the user cart
function selectFlight(id, table) {
	$.ajax({
	      type: "POST",
	      url: "selectFlight",
	      data: "flightId="+id,
	      contentType: "application/x-www-form-urlencoded"
	  })
	  .done(function() {
		  	  $("#"+table).find("button").attr("disabled", "disabled");
	    	  if (table === "goTable") {
	    		  var plane = '<i class="fas fa-plane-departure"></i>';
	    	  } else {
	    		  var plane = '<i class="fas fa-plane-arrival"></i>';
	    	  }
	    	  var flightHeader = '<div class="row"><p class="small">'+plane+' '+$("#destination-"+id).text()+'<span class="text-right">&euro;'+$("#price-"+id).text()+'</span></p>';
	    	  var flightBody = '<p class="small"><span class="font-weight-bold">Partenza:</span> '+$("#dateDep-"+id).text()+'<br/><span class="font-weight-bold">Arrivo:</span> '+$("#dateArr-"+id).text()+'</p>';
	    	  var flightFooter = '<button type="button" class="btn btn-danger btn-sm btn-block">Rimuovi</button></div>';
	    	  $("#userFlights").append(flightHeader+flightBody+flightFooter);
	   })
	   .fail(function() {
	    	  $("#selectMessage").addClass("alert-danger");
	    	  $("#selectMessage").text("C'è stato un errore con la selezione del volo!");
	    	  $("#selectMessage").show("fast");
	    	  $("#selectMessage").delay(1000).fadeOut();
      });
}

//remove an existing flight from the user cart
//function removeFlight(id) {}