
 //iniciar select2
$(document).ready(function() {
    $('.js-example-basic-single').select2();
  });
function myFunction(){
    
    var indexSala=document.getElementById("idsala").selectedIndex ;
  var filterSala = document.getElementById("idsala").options[indexSala].text;

   if(filterSala!=="Reservar sala"){
     //  var x=document.getElementById("btnReservar");
       var myForm=document.getElementById("myform");
       myForm.submit();
    //   x.value=filterSala;
       return true;
   }else{
       alert("Selecciona una sala");
      return false;
   }  
   
}

function verificar(){
    var ok=confirm("Segur que vol eliminar la reserva?");
if (ok){
   return true ; 
}
else{
     return false ;
}
}
function selFunction(){
    
    var filterSetmanes,filterSales, table, tr, td, i, j,visibleSala,visibleSetmana;
    
     var indexSetmanes=document.getElementById("selSetmana").selectedIndex ;
    filterSetmanes = document.getElementById("selSetmana").options[indexSetmanes].text;
   
    var indexSales=document.getElementById("selSala").selectedIndex ;
   filterSales = document.getElementById("selSala").options[indexSales].text;
   
    table = document.getElementById("mytable");
  tr = table.getElementsByTagName("tr");
   
     for (i = 0; i < tr.length; i++) {
      
  
          visibleSala = false;
          visibleSetmana =false;
          
    
    /* Obtenemos todas las celdas de la fila, no sólo la primera */
    td = tr[i].getElementsByTagName("td");
    for (j = 0; j < td.length; j++) {
        
      if(visibleSala===false){
          if (td[j] && td[j].innerHTML.indexOf(filterSales) > -1 ) {
    visibleSala = true;
  }else if(filterSales==="Id Sala"){
      visibleSala = true;
  }
  }

  if(visibleSetmana===false){
      if (td[j] && td[j].innerHTML.indexOf(filterSetmanes) > -1 ) {
visibleSetmana = true;
}else if(filterSetmanes==="Setmana"){
  visibleSetmana = true;
}
}

    if (visibleSala&&visibleSetmana === true) {
      tr[i].style.display = "";
    } else {
      tr[i].style.display = "none";
    }
  }
}
   
}