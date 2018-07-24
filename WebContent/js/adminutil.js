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

function adminForm (form) {

	var meta = form.newArrival.value;
	var partenza = form.newDateDep.value;
	var arrivo = form.newDateArr.value;
  var today = new Date(); 
  var check_one = false; 
  var check_two = false; 
  
  var dep = Date.parse(partenza.value); 
  var arr = Date.parse(arrivo.value); 
  
  
  var mete = ["Tirana","Andorra la Vella","Vienna","Bruxelles","Minsk","Sarajevo","Sofia",
        "Nicosia","Zagabria","Copenaghen","Tallinn","Helsinki","Parigi","Berlino",
        "Atene","Dublino","Reykjavík","Roma","Pristina","Riga","Vaduz","Vilnius",
        "Lussemburgo","Skopje","La Valletta","Chisinau","Monaco","Podgorica","Oslo",
        "Amsterdam","Varsavia","Lisbona","Londra","Praga","Bucarest","Mosca","Città di San Marino",
        "Belgrado","Bratislava","Lubiana","Madrid","Stoccolma","Berna","Kiev","Budapest","Città del Vaticano"];
        
        for (var i=0 ; i<mete.lenght; i++) 
        {
          if (meta.toLowerCase() === mete[i].toLowerCase()) 
          { 
           console.log("meta corretta"); 
           check_one = true; 
          } 
        } 
        
        if ( today.getTime() < dep.getTime() && 
           dep.getTime() < arr.getTime() ) 
           {
        	check_two = true; 
           }
        
        
      if (check_one == true && check_two == true)
      {
    	  return true; 
      } else {
    	  return false; 
      }
}