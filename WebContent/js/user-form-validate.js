var regularMail = /^\w+([\._\-]?\w+)*@\w+([\.\-]?\w+)*(\.\w+)+$/;
var regularPassword =  /^[a-zA-Z 0-9 \@\._\!\?\-]{8,}$/;
var regularName = /^[a-zA-Z]+([\s\-]?[A-Za-z]+)*$/;
var regularSurname = /^[A-Za-z]+([\s\'\-]?[A-Za-z]+)*$/;
//var regularPhone = /^[0-9]{10}$/;

function validate(form) {
  var isMailValid = form.email.value.match(regularMail);
  var isPswValid = form.password.value.match(regularPassword);
  //var isNameValid = form.name.value.match(regularName);
  //var isSurnameValid = form.surname.value.match(regularSurname);
  // var isPhoneValid = form.phone.value.match(regularPhone);
  var valid = true;

  if (!isMailValid) { //mail non valida
    alert('La mail non è valida!');
    form.email.focus(); // imposta il focus al campo Email
    valid = false;
  }
  if (!isPswValid) { //psw non valida
    alert('La password non è valida!');
    form.password.focus(); // imposta il focus al campo password
    valid = false;
  }
  //if (!isNameValid) { // nome non valido
  //  alert('Il nome non è valido!');
  //  form.name.focus(); // imposta il focus al campo nome
  //  valid = false;
  //}
  //if (!isSurnameValid) { // cognome non valido
  //  alert('Il cognome non è valido!');
  //  form.surname.focus();
  //  valid = false;
  //}

  return valid;
}
