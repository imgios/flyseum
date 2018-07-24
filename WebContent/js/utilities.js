// add a new flight inside the user cart
function selectFlight(id, tablename) {
	$.ajax({
	      type: "POST",
	      url: "selectFlight",
	      data: "flightId="+id+"&type=post",
	      contentType: "application/x-www-form-urlencoded"
	  })
	  .done(function() {
		  	  $("#"+tablename).find("button").attr("disabled", "disabled");
	    	  if (tablename === "goTable") {
	    		  var plane = '<i class="fas fa-plane-departure"></i>';
	    	  } else {
	    		  var plane = '<i class="fas fa-plane-arrival"></i>';
	    	  }
	    	  var flightHeader = '<div class="row px-3 py-2" id="selected-'+id+'"><div class="col"><p class="text-capitalize">'+plane+' '+$("#destination-"+id).text()+'</p>';
	    	  var flightBody = '<p><span class="font-weight-bold">Partenza:</span> '+$("#dateDep-"+id).text()+'<br/><span class="font-weight-bold">Arrivo:</span> '+$("#dateArr-"+id).text()+'</p><p class="text-right"><span class="font-weight-bold">Totale: </span>'+$("#price-"+id).text()+'</p>';
	    	  var flightFooter = '<p class="text-center"><button type="button" class="btn btn-danger btn-sm" onclick="removeFlight(\''+id+'\', \''+tablename+'\')">Rimuovi</button>  <a href="./" class="btn btn-success btn-sm">Procedi</a></p></div></div>';
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
	      data: "flightId="+id+"&type=post",
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