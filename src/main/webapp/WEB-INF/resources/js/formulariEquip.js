/*FormulariEquipament.js
 * 
 * Actuarà sobre els formularis d'equip
 * 
 * 
 */


/*Constant en forma d'objecte per determinar estat de l'equip*/
const ESTAT = {
    SERVEI: "Servei",
    STOCK: "Stock",
    REPARACIO: "Reparacio"
};

/*Llegir tots els camps d'un equipo*/
var codi = document.getElementById("codi");
var tipus = document.getElementById("tipus");
var numSerie = document.getElementById("numserie");
var marca = document.getElementById("marca");
var model = document.getElementById("model");
var estat = document.getElementById("estat");


//Comprova si tots els camps del formulari s'han omplert.
function validaFormulari() {
    if (codi.value == "" || tipus.value == "" || numSerie.value == "" || marca.value == "" || model.value == "") {
        alert("S'han d'omplir tots els camps");
        return false;
    }
    return true;
}


document.addEventListener("DOMContentLoaded", function () {
    let estat = document.getElementById("estat");
    let btnDelete = document.getElementById("btnDelete");
    let btnSave = document.getElementById("btnSave");

    if (estat.value === ESTAT.REPARACIO) {
        estat.disabled = true;
        btnDelete.disabled = true;
        btnSave.disabled = true;
    }

    if (estat.value === ESTAT.SERVEI) {
        btnDelete.disabled = true;
    }
    /*Amaga selector llistat d'espais*/
    document.getElementById("espais").style.display = "none";

});



//Funcio per mostrar missatge de confirmació al eliminar un equip.
function confirmActionDelete() {
    return confirm("Segur que vols eliminar aquest element?");
}


/*CONFIRMA SI:
    - Assignar un equip a un espai.
    - Retirar un equip d'un espai */
estat.onchange = function () {
    let espai = document.getElementById("espai");
    if (estat.value === ESTAT.STOCK && espai.innerHTML !== "") {

        if (confirm("Aquest equip es troba assignat a un espai. Treure l'equip de l'espai?")) {
            espai.innerHTML = "";
        }

    }

    if (estat.value === ESTAT.SERVEI) {
        if (confirm("Assignar l'equip a un espai?")) {
            document.getElementById("espais").style.display = "block";
        }
    }
}
