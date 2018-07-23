function randomDestination() {
	var destination = ["amsterdam", "cracovia", "parigi", "dortmund"];
  for (i = 1; i < destination.length + 1; i++) {
    var random = destination[Math.floor(Math.random() * destination.length)];
    document.getElementById("cardtitle"+i).innerHTML = random;
    document.getElementById("cardimg"+i).src = "./images/"+random+".jpg";
    document.getElementById("selectDest"+i).addEventListener("click", function(){
      document.getElementById("destination").value = random;
    });
  }
}

window.onload = randomDestination();