$(document).ready(function() {
  var today = new Date();
  var dd = today.getDate();
  var mm = today.getMonth()+1; // i mesi partono da 0 (gennaio)
  var yyyy = today.getFullYear();

  if (dd < 10) {
    dd = '0'+dd;
  }

  if (mm<10) {
    mm = '0'+mm;
  }

  today = yyyy+"-"+mm+"-"+dd;
  $("#aDate").attr("value", today);
});
