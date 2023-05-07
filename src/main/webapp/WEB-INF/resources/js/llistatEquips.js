/*llistatEquips.js
 * 
 * ACTUARÀ SOBRE LA PÀGINA DE LLISTAR EQUIPS
 * 
 */

//iniciar select2
$(document).ready(function() {
  $('.js-example-basic-single').select2();
});


function myFunction() {
    
  //  variables 
  var filterTipus,filterEstat,filterCodi, table, tr, td, i, j, visibleEstat,visibleTipus,visibleCodi;

  table = document.getElementById("mytable");
  tr = table.getElementsByTagName("tr");

  var indexEstat = document.getElementById("selEstat").selectedIndex ;
  filterEstat = document.getElementById("selEstat").options[indexEstat].text;
  
  var indexTipus=document.getElementById("selTipus").selectedIndex ;
 filterTipus = document.getElementById("selTipus").options[indexTipus].text;

 var indexCodi=document.getElementById("selCodi").selectedIndex ;
 filterCodi = document.getElementById("selCodi").options[indexCodi].text;
 
 
  for (i = 1; i < tr.length; i++) {
      
          visibleEstat = false;
          visibleTipus = false;
          visibleCodi  = false;
    
    /* Obtenemos todas las celdas de la fila, no sólo la primera */
    td = tr[i].getElementsByTagName("td");
    for (j = 0; j < td.length; j++) {
        
       if(visibleEstat===false){
            if (td[j] && td[j].innerHTML.indexOf(filterEstat) > -1 ) {
        visibleEstat = true;
      }else if(filterEstat==="Estat"){
          visibleEstat = true;
      }
       }
     
      if(visibleTipus===false){
              if (td[j] && td[j].innerHTML.indexOf(filterTipus) > -1 ) {
        visibleTipus = true;
      }else if(filterTipus==="Tipus"){
          visibleTipus = true;
    }
      }

      if(visibleCodi===false){
        if (td[j] && td[j].innerHTML.indexOf(filterCodi) > -1 ) {
  visibleCodi = true;
}else if(filterCodi==="Codi"){
    visibleCodi = true;
}
}
    
    if (visibleEstat&&visibleTipus&&visibleCodi === true) {
      tr[i].style.display = "";
    } else {
      tr[i].style.display = "none";
    }
  }
}
}
