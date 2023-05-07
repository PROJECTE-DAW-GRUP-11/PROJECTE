/*LlistatUsuaris.js
 * 
 * ACTUARÀ SOBRE LA PÀGINA DE LLISTAR USUARIS
 * 
 */

//iniciar select2
$(document).ready(function() {
  $('.js-example-basic-single').select2();
});

//Funcio per confirmacio al eliminar un usuari.
function confirmAction() {
    return confirm("Segur que vols eliminar aquest element?");
}

function myFunction() {
    
  //  variables 
  var filterCodi,filterNom,filterRol, table, tr, td, i, j, visibleCodi,visibleNom,visibleRol;

  table = document.getElementById("mytable");
  tr = table.getElementsByTagName("tr");


 var indexCodi=document.getElementById("selCodi").selectedIndex ;
 filterCodi = document.getElementById("selCodi").options[indexCodi].text;

 var indexNom=document.getElementById("selNom").selectedIndex ;
 filterNom = document.getElementById("selNom").options[indexNom].text;

 var indexRol = document.getElementById("selRol").selectedIndex ;
filterRol = document.getElementById("selRol").options[indexRol].text;
 
 
  for (i = 1; i < tr.length; i++) {
      
  
          visibleCodi  = false;
          visibleNom =false;
          visibleRol=false;
    
    /* Obtenemos todas las celdas de la fila, no sólo la primera */
    td = tr[i].getElementsByTagName("td");
    for (j = 0; j < td.length; j++) {
        
      if(visibleCodi===false){
          if (td[j] && td[j].innerHTML.indexOf(filterCodi) > -1 ) {
    visibleCodi = true;
  }else if(filterCodi==="Codi"){
      visibleCodi = true;
  }
  }

  if(visibleNom===false){
      if (td[j] && td[j].innerHTML.indexOf(filterNom) > -1 ) {
visibleNom = true;
}else if(filterNom==="Nom"){
  visibleNom = true;
}
}



      if(visibleRol===false){
          if (td[j] && td[j].innerHTML.indexOf(filterRol) > -1 ) {
      visibleRol = true;
    }else if(filterRol==="Rol"){
        visibleRol = true;
    }
     }


    if (visibleCodi&&visibleNom&&visibleRol === true) {
      tr[i].style.display = "";
    } else {
      tr[i].style.display = "none";
    }
  }
}
}

