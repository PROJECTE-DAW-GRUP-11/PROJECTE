
 //iniciar select2
$(document).ready(function() {
    $('.js-example-basic-single').select2();
  });

function myFunction(){
    
    var indexSala=document.getElementById("idsala").selectedIndex ;
  var filterSala = document.getElementById("idsala").options[indexSala].text;

   if(filterSala!=="SALES"){
       var x=document.getElementById("btnReservar");
       x.value=filterSala;
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

function reservesSetmana(){
    var indexSetmanes=document.getElementById("setmanes").selectedIndex ;
   var filterSetmanes = document.getElementById("setmanes").options[indexSetmanes].text;
   
    var setmana=document.getElementById("setmana");
   setmana.value=filterSetmanes;
   
  table = document.getElementById("reservesSala");
  tr = table.getElementsByTagName("tr"); 
  
  tableReservas = document.getElementById("mytable");
  trDiasReservas = tableReservas.getElementsByTagName("tr"); 
  
   for(var k=0;k<trDiasReservas.length;k++){
           tdDiasReservas = trDiasReservas[k].getElementsByTagName("td");
           
          for(var j=1;j<tdDiasReservas.length;j++){
              
               tdDiasReservas[j].style.backgroundColor="white";
          }}
   
  for(var i=0;i<tr.length;i++){
      
      td = tr[i].getElementsByTagName("td");
      var setmana=td[0].getAttribute("setmana");
      var dia=td[0].getAttribute("dia");
      var hora=td[0].getAttribute("hora");
       var temps=td[0].getAttribute("temps");
      
      if(setmana==filterSetmanes){
          
          for(var k=0;k<trDiasReservas.length;k++){
           tdDiasReservas = trDiasReservas[k].getElementsByTagName("td");
           
          for(var j=1;j<tdDiasReservas.length;j++){
              var filaValueDia=tdDiasReservas[0].getAttribute("dia");
              if(filaValueDia==dia){

                  var filaValueHora=tdDiasReservas[j].getAttribute("hora");
                  if(filaValueHora==hora){
                     tdDiasReservas[j].style.backgroundColor="red";
                     
                       if("2"==temps){
                          
                           tdDiasReservas[j+1].style.backgroundColor="red";
                           
                       }
                  }
              }
          }
      }
 
  }
   
}

}
function validaFormulari(){
    var usuari=document.getElementById("idusuari");
    if(usuari.value=="null"){
        alert("Usuari no registrat");
        return false;
    }
    
    
 var indexSetmanes=document.getElementById("setmanes").selectedIndex ;
   var filterSetmanes = document.getElementById("setmanes").options[indexSetmanes].text;

    var indexDias=document.getElementById("selDia").selectedIndex ;
   var filterDias = document.getElementById("selDia").options[indexDias].text;
   
    var indexHoras=document.getElementById("selHora").selectedIndex ;
   var filterHoras = document.getElementById("selHora").options[indexHoras].text;
   
    var indexTemps=document.getElementById("selTemps").selectedIndex ;
   var filterTemps = document.getElementById("selTemps").options[indexTemps].text;
   
   if(filterSetmanes!=="Setmanes"&&filterDias!=="Dia"&&filterHoras!=="Hora"&&filterTemps!=="Temps"){
  return true    ; 
   }else{
       alert("Cal omplir tots els camps");
       return false;
   }
   
   
}
function comprobarDisponibilidad(){
      var indexDias=document.getElementById("selDia").selectedIndex ;
   var filterDias = document.getElementById("selDia").options[indexDias].text;
   
    var indexHoras=document.getElementById("selHora").selectedIndex ;
   var filterHoras = document.getElementById("selHora").options[indexHoras].text;
   
    var indexTemps=document.getElementById("selTemps").selectedIndex ;
   var filterTemps = document.getElementById("selTemps").options[indexTemps].text;
   
    var indexSetmanes=document.getElementById("setmanes").selectedIndex ;
   var filterSetmanes = document.getElementById("setmanes").options[indexSetmanes].text;
   
   if(filterDias!=="Dia"&&filterHoras!=="Hora"&&filterTemps!=="Temps"&&filterSetmanes!=="Setmanes"){
       
     
    
  table = document.getElementById("reservesSala");
  tr = table.getElementsByTagName("tr"); 
  
  tableReservas = document.getElementById("mytable");
  trDiasReservas = tableReservas.getElementsByTagName("tr"); 
  
   for(var k=0;k<trDiasReservas.length;k++){
           tdDiasReservas = trDiasReservas[k].getElementsByTagName("td");
           
          for(var j=1;j<tdDiasReservas.length;j++){
              if(tdDiasReservas[j].style.backgroundColor!=="red")
               tdDiasReservas[j].style.backgroundColor="white";
          }}
   

          
          for(var k=0;k<trDiasReservas.length;k++){
           tdDiasReservas = trDiasReservas[k].getElementsByTagName("td");
           
          for(var j=1;j<tdDiasReservas.length;j++){
              var filaValueDia=tdDiasReservas[0].getAttribute("dia");
              if(filaValueDia==filterDias){

                  var filaValueHora=tdDiasReservas[j].getAttribute("hora");
                  if(filaValueHora==filterHoras){
                      if(tdDiasReservas[j].style.backgroundColor=="white"&&"1"==filterTemps){
                         
                          tdDiasReservas[j].style.backgroundColor="green";
                           document.getElementById("setmanes").disabled=true;
                      }
                      
             
                         else if( tdDiasReservas[j].style.backgroundColor=="white"&&
                                 "2"==filterTemps&&j<tdDiasReservas.length-1&& tdDiasReservas[j+1].style.backgroundColor=="white"){
             
                             tdDiasReservas[j].style.backgroundColor="green"; 
                           tdDiasReservas[j+1].style.backgroundColor="green";
                           
                           document.getElementById("setmanes").disabled=true;
                           
                       }else{  //       tdDiasReservas[j+1].style.backgroundColor="white";
                           alert("Reserva no disponible.");
                       }
                  
     
      }
 
  }
   
}
       
   }
}
}
