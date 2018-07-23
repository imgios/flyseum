// add a new flight inside the user cart
function selectFlight(id, tablename) {
	$.ajax({
	      type: "POST",
	      url: "selectFlight",
	      data: "flightId="+id,
	      contentType: "application/x-www-form-urlencoded"
	  })
	  .done(function() {
		  	//console.log("done function!");
		  	  $("#"+tablename).find("button").attr("disabled", "disabled");
	    	  if (tablename === "goTable") {
	    		  var plane = '<i class="fas fa-plane-departure"></i>';
	    	  } else {
	    		  var plane = '<i class="fas fa-plane-arrival"></i>';
	    	  }
	    	  var flightHeader = '<div class="row" id="selected-'+id+'"><p>'+plane+' '+$("#destination-"+id).text()+'<span class="text-right">&euro;'+$("#price-"+id).text()+'</span></p>';
	    	  var flightBody = '<p><span class="font-weight-bold">Partenza:</span> '+$("#dateDep-"+id).text()+'<br/><span class="font-weight-bold">Arrivo:</span> '+$("#dateArr-"+id).text()+'</p>';
	    	  var flightFooter = '<button type="button" class="btn btn-danger btn-sm btn-block" onclick="removeFlight(\''+id+'\', \''+tablename+'\')">Rimuovi</button></div>';
	    	  $("#userFlights").append(flightHeader+flightBody+flightFooter);
	   })
	   .fail(function() {
		   //console.log("fail function!");
		   	if ($("#selectedMessage").hasClass("d-none")) {
		   		$("#selectedMessage").removeClass("d-none");
		   	}
	    	  $("#selectMessage").text("C'è stato un errore con la selezione del volo!");
	    	  $("#selectMessage").show("fast");
	    	  $("#selectMessage").delay(1000).fadeOut();
      });
}

//remove an existing flight from the user cart
function removeFlight(id, tablename) {
	$.ajax({
	      type: "POST",
	      url: "RemoveSelectedFlight",
	      data: "flightId="+id,
	      contentType: "application/x-www-form-urlencoded"
	  })
	  .done(function() {
		  	  $("#selected-"+id).remove();
		  	  $("#"+tablename).find("button").removeAttr("disabled");
	   })
	   .fail(function() {
	    	  $("#selectMessage").text("C'è stato un errore con la rimozione del volo!");
	    	  $("#selectMessage").show("fast");
	    	  $("#selectMessage").delay(1000).fadeOut();
    });
}