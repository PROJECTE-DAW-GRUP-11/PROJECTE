



/* Confirmacio per treure un equip d'un espai */
function confirmActionDel(url) {
  if (confirm("Eliminar l'equip de l'espai?")) {
    window.location = url;
  }
}

/* Confirmacio per afegir un equip a un espai */
function confirmActionAdd(url) {
  if (confirm("Afegir l'equip a l'espai?")) {
    window.location = url;
  }
}

//iniciar select2
$(document).ready(function() {
  $('.js-example-basic-single').select2();
});

/* Permet filtrar espais per característiques */
function myFunctionEspais() {
    
  //  variables 
  var filterCodi,filterPlanta,filterZona,filterPosicio, table, tr, td, i, j,visibleCodi,visiblePlanta,visibleZona,visiblePosicio;

  table = document.getElementById("mytable");
  tr = table.getElementsByTagName("tr");

 var indexCodi=document.getElementById("selCodi").selectedIndex ;
 filterCodi = document.getElementById("selCodi").options[indexCodi].text;
 
 var indexPlanta=document.getElementById("selPlanta").selectedIndex ;
 filterPlanta = document.getElementById("selPlanta").options[indexPlanta].text;
 
 var indexZona=document.getElementById("selZona").selectedIndex ;
 filterZona = document.getElementById("selZona").options[indexZona].text;
 
 var indexPosicio=document.getElementById("selPosicio").selectedIndex ;
 filterPosicio = document.getElementById("selPosicio").options[indexPosicio].text;
 
 
 
  for (i = 1; i < tr.length; i++) {
      
         
          visibleCodi  = false;
          visiblePlanta= false;
          visibleZona  = false;
          visiblePosicio= false;
    
    /* Obtenemos todas las celdas de la fila*/
    td = tr[i].getElementsByTagName("td");
    

      if(visibleCodi===false){
        if (td[0] && td[0].innerHTML.indexOf(filterCodi) > -1 ) {
  visibleCodi = true;
}else if(filterCodi==="Codi"){
    visibleCodi = true;
}
}
      if(visiblePlanta===false){
        if (td[1] && td[1].innerHTML.indexOf(filterPlanta) > -1 ) {
  visiblePlanta = true;
}else if(filterPlanta==="Planta"){
    visiblePlanta = true;
}
}
      if(visibleZona===false){
        if (td[2] && td[2].innerHTML.indexOf(filterZona) > -1 ) {
  visibleZona = true;
}else if(filterZona==="Zona"){
    visibleZona = true;
}
}
      if(visiblePosicio===false){
        if (td[3] && td[3].innerHTML.indexOf(filterPosicio) > -1 ) {
  visiblePosicio = true;
}else if(filterPosicio==="Posicio"){
    visiblePosicio = true;
}
}
    
    if (visibleCodi&&visiblePlanta&&visibleZona&&visiblePosicio === true) {
      tr[i].style.display = "";
    } else {
      tr[i].style.display = "none";
    }
}
}
