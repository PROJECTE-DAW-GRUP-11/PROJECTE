/*Mostra missatge per confirmar tancament.
* Valida si els camps estan omplerts.
*/

/*Constant en forma d'objecte per determinar estat de la reparacio*/
const ESTAT = {
    NOVA: "Nova",
    PROGRES: "En progres ",
    TANCADA: "Tancada"
};


function confirmAction() {

    var tecnic = document.getElementById("tecnic");
    var comentariTancament = document.getElementById("comentariTancament");
    var selectorEstat = document.getElementById("estat");

    valorSeleccionat = selectorEstat.value;

    if (tecnic.value == "") {
        alert("El camp tecnic no pot estar buit");
        return false
    }

    if (valorSeleccionat === ESTAT.TANCADA) {
        if (comentariTancament.value == "") {
            alert("El camp comentari tancament no pot estar buit");
            return false;
        }
        return confirm("Tancar la reparacio?");
    }

    return true;


}
//iniciar select2
$(document).ready(function () {
    $('.js-example-basic-single').select2();
});


function myFunction() {

    //  variables 
    var filterCodi, filterTecnic, filterEstat, table, tr, td, i, j, visibleCodi, visibleTecnic, visibleEstat;

    table = document.getElementById("mytable");
    tr = table.getElementsByTagName("tr");


    var indexCodi = document.getElementById("selCodi").selectedIndex;
    filterCodi = document.getElementById("selCodi").options[indexCodi].text;

    var indexTecnic = document.getElementById("selTecnic").selectedIndex;
    filterTecnic = document.getElementById("selTecnic").options[indexTecnic].text;

    var indexEstat = document.getElementById("selEstat").selectedIndex;
    filterEstat = document.getElementById("selEstat").options[indexEstat].text;


    for (i = 1; i < tr.length; i++) {


        visibleCodi = false;
        visibleEstat = false;
        visibleTecnic = false;

        /* Obtenemos todas las celdas de la fila, no sólo la primera */
        td = tr[i].getElementsByTagName("td");
        for (j = 0; j < td.length; j++) {

            if (visibleCodi === false) {
                if (td[j] && td[j].innerHTML.indexOf(filterCodi) > -1) {
                    visibleCodi = true;
                } else if (filterCodi === "Equip") {
                    visibleCodi = true;
                }
            }

            if (visibleTecnic === false) {
                if (td[j] && td[j].innerHTML.indexOf(filterTecnic) > -1) {
                    visibleTecnic = true;
                } else if (filterTecnic === "Tecnic") {
                    visibleTecnic = true;
                }
            }

            if (visibleEstat === false) {
                var estat = td[5].childNodes[0].textContent.trim();
                if (estat === filterEstat) {
                    visibleEstat = true;
                } else if (filterEstat ===  ESTAT.NOVA && estat === "") {
                    visibleEstat = true;
                } else if (filterEstat === "Estat") {
                    visibleEstat = true;
                }
            }


            if (visibleCodi && visibleEstat && visibleTecnic === true) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}
