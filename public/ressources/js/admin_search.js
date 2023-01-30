//fonction permettant de faire la recherche dans un tableau(une colonne spécifique d'un tableau)
function myFunction() {
    let input, filter, table, tr, td, i, inputValue;
    input = document.getElementById("search");
    filter = input.value.toUpperCase();
    table = document.getElementById("myTable");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[1];
        if (td) {
            inputValue = td.textContent || td.innerText;
            if (inputValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

//pour les recherches dans un tableau
let input = document.querySelector("#search");

//pour les modals
let mettre = document.querySelectorAll('.mettre');
let remettre = document.querySelector('.remettre');

let supprimer = document.querySelectorAll('.supprimer');
let deletes = document.querySelector('.delete');

let ligne = document.querySelectorAll('.ligne');
let attente = document.querySelector('.attente');

let retirer = document.querySelectorAll('.retirer');
let retire = document.querySelector('.retire');

let closes = document.querySelector('#recherche1>div>form>.closes');
let closes0 = document.querySelector('#recherche0>div>form>.closes');
let closes1 = document.querySelector('#recherche2>div>form>.closes');
let closes2 = document.querySelector('#recherche3>div>form>.closes');

let search0 = document.getElementById('recherche0');
let search1 = document.getElementById('recherche1');
let search2 = document.getElementById('recherche2');
let search3 = document.getElementById('recherche3');

let topnav0 = document.querySelector(".topnav0");
let hidden = document.querySelector(".hidden");
let x = 0;

//nav partie administrateur
let task = document.querySelector('.task');

let bloc_task = document.querySelector('.bloc-task');

let y = 0;

//pour voir le modal contenant les informations des oeuvres
let watch = document.querySelectorAll('.watch');
let modal = document.querySelectorAll('.recherche4');

let click_button = document.querySelector(".click_button");

document.addEventListener("DOMContentLoaded", function() {

    task.addEventListener("click", (e) => {
        switch(y) {
            case 0:
                bloc_task.style="display:block";
                y++;
                break;
            case 1:
                bloc_task.style="display:none";
                y=0
                break;
        }
    })

    input.addEventListener("keyup", (e) => {
        e.preventDefault();
        myFunction();
    })

    retirer.forEach((el) => {
        el.addEventListener('click', (e) => {
                search1.style = 'display:block';
                retire.setAttribute('value', el.value)
                closes.addEventListener('click', (e) => {
                    search1.style = 'display:none';
                })
        })
    })

    mettre.forEach((el) => {
        el.addEventListener('click', (e) => {
                search2.style = 'display:block';
                remettre.setAttribute('value', el.value)
                closes1.addEventListener('click', (e) => {
                    search2.style = 'display:none';
                })
        })
    })

    ligne.forEach((el) => {
        el.addEventListener('click', (e) => {
                search3.style = 'display:block';
                attente.setAttribute('value', el.value)
                closes2.addEventListener('click', (e) => {
                    search3.style = 'display:none';
                })
        })
    })

    supprimer.forEach((el) => {
        el.addEventListener('click', (e) => {
                search0.style = 'display:block';
                deletes.setAttribute('value', el.value)
                closes0.addEventListener('click', (e) => {
                    search0.style = 'display:none';
                })
        })
    })

    watch.forEach((element) => {
        element.addEventListener('click', (e) => {
                element_value = element.value
                modal.forEach((el) => {
                    className = el.className;
                    split = className.split(" ");
                    if(split.includes(element_value)) {
                        el.style = 'display:block'
                        clos = el.childNodes[1].childNodes[3];
                        clos.addEventListener('click', (e) => {
                            el.style = 'display:none';
                        })
                    }
                })
        })
    })

    hidden.addEventListener("click", (e) => {
        switch(x) {
            case 0:
                topnav0.style="display:block";
                x++;
                break;
            case 1:
                topnav0.style="display:none";
                x=0
                break;
        }
    })

    //au clique, on repart sur la page précédente
    click_button.addEventListener("click", (e) => {
        e.preventDefault();
        window.history.back();
    })
})
