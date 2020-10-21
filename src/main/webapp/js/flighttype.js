$(document).ready(function() {
 $('input[type=radio][name=flightType]').change(function() {
    if ($("#aoRadio").is(":checked")) {
      $("#rDate").prop('disabled', true);
      $("#rDate").prop('required', false);
    } else {
      $("#rDate").prop('disabled', false);
      $("#rDate").prop('required', true);
    }
  })
});
