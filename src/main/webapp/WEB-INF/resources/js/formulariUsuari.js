/*FormulariUsuaris.js
 * 
 * Actuarà sobre el formulari per crear o editar usuaris. 
 * 
 */

//Captura tots els camps del formulari
    var idUsuari = document.getElementById("idUsuari");
    var password = document.getElementById("password");
    var nom = document.getElementById("nom");
    var cognoms = document.getElementById("cognoms");
    var email = document.getElementById("email");
    var telefon = document.getElementById("telefon");
    var rol = document.getElementById("rol");


//Funcio per mostrar missatge de confirmació al eliminar un usuari.
function confirmAction() {
    return confirm("Segur que vols eliminar aquest usuari?");
}

//Comprova si tots els camps del formulari s'han omplert.
function validaFormulari() {

    if (idUsuari.value == "" || password.value == "" || nom.value == "" || cognoms.value == "" || email.value == "" || telefon.value =="" || rol.value == "") {
        alert("S'han d'omplir tots els camps");
        return false;
    }
    if (!validaDNI(idUsuari.value)){
        alert("El dni no és correcte");
        return false;
    }
    
    if (!validarEmail(email.value)){
        alert("El correu no té un format correcte");
        return false;
    }
    if (!validarTelefon(telefon.value)){
        alert("El telèfon no té un format correcte. Mínim 9 digits.");
        return false;
    }
    
    return true;

}

//Validar DNI
function validaDNI(idUsuari) {
  let numero, lletr, lletra;
  let expresio_regular_dni = /^[XYZ]?\d{5,8}[A-Z]$/;

  idUsuari = idUsuari.toUpperCase();

  if(expresio_regular_dni.test(idUsuari) === true){
    numero = idUsuari.substr(0,idUsuari.length-1);
    numero = numero.replace('X', 0);
    numero = numero.replace('Y', 1);
    numero = numero.replace('Z', 2);
    lletr = idUsuari.substr(idUsuari.length-1,1);
    numero = numero % 23;
    lletra = 'TRWAGMYFPDXBNJZSQVHLCKET';
    lletra = lletra.substring(numero,numero+1);
    if (lletra!=lletr) {
            alert("El dni no és correcte")
            return false;
    } else {
      return true;
    }
  } else {
    return false;
  }
}

//Validar email
function validarEmail(email) {
  var expresio_regular_email = /^[^@\s]+@[^@\s]+\.[^@\s]+$/;
  
  if(email.length > 0 && expresio_regular_email.test(email)){
    var partes = email.split("@");
    if(partes.length != 2) {
      return false;
    }
    var domini = partes[1].split(".");
    if(domini.length < 2) {
      return false;
    }
    for(var i = 0; i < domini.length; i++){
      if(domini[i] == "") {
        return false;
      }
      if(i > 0 && domini[i-1] == domini[i]) {
        return false;
      }
    }
    var ultima_lletra = domini[domini.length - 1].substr(-1);
    if(!(/[a-zA-Z]/).test(ultima_lletra)){
      return false;
    }
    return true;
  } else {
    return false;
  }
 
}

//Validar telefon
function validarTelefon(telefon) {
  var expresio_regular_telefon = /^\d{9}$/;
  return expresio_regular_telefon.test(telefon);
  
}

