/*function addflight(){
	var departure = $("#addFlightForm").find('input[name="newDeparture"]').val();
	var dateDeparture = $("#addFlightForm").find('input[name="newDateDep"]').val();
	var timeDeparture = $("#addFlightForm").find('input[name="newTimeDep"]').val();
	var arrival = $("#addFlightForm").find('input[name="newArrival"]').val();
	var dateArrival = $("#addFlightForm").find('input[name="newDateArr"]').val();
	var timeArrival = $("#addFlightForm").find('input[name="newTimeArr"]').val();
	var company = $("#addFlightForm").find('input[name="newCompany"]').val();
	var seats = $("#addFlightForm").find('input[name="newMax"]').val();
	var price = $("#addFlightForm").find('input[name="newPrice"]').val();
	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4 && xhttp.status == 200){
			$("#addMessage").addClass("alert-success");
			$("#addMessage").text("Il volo è stato inserito con successo!");
			$("#addMessage").fadeIn(700);
			$("#addMessage").fadeOut(2100);
			$('#addFlightForm')[0].reset();
		}
	};
	xhttp.open("POST", "ServletAdder", true);
	xhttp.send("?newDeparture="+departure+"&newDateDep="+dateDeparture+"&newTimeDep="+timeDeparture+"&newArrival="+arrival+"&dateDeparture="+dateArrival+"&newTimeDep="+timeArrival+"&newCompany="+company+"&newPrice="+price);
}*/

$("#addFlightForm").submit(function() {
		$.ajax({
		      type: "POST",
		      url: "ServletAdder",
		      data: "?newDeparture="+encodeURIComponent($("#departureInput").val())+"&newDateDep="+encodeURIComponent($("#dateDepInput").val())+"&newTimeDep="+encodeURIComponent($("#timeDepInput").val())+"&newArrival="+encodeURIComponent($("#arrivalInput").val())+"&newDateArr="+encodeURIComponent($("#dateArrInput").val())+"&newTimeDep="+encodeURIComponent($("#timeArrInput").val())+"&newCompany="+encodeURIComponent($("#companyInput").val())+"&newMax="+encodeURIComponent($("#maxPassInput").val())+"&newPrice="+encodeURIComponent($("#priceInput").val()),
		      dataType: "html"
		  })
		  .done(function() {
		    	  $("#addMessage").addClass("alert-success");
		    	  $("#addMessage").text("Il volo è stato inserito con successo!");
		    	  $("#addMessage").fadeIn(700);
		    	  $("#addMessage").fadeOut(2100);
		   })
		   .fail(function() {
		    	  $("#addMessage").addClass("alert-danger");
		    	  $("#addMessage").text("C'è stato un errore con l'inserimento del volo!");
		    	  $("#addMessage").fadeIn(700);
		    	  $("#addMessage").fadeOut(2100);
		      });
});