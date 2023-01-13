

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

let input = document.querySelector("#search");

let mettre = document.querySelectorAll('.mettre');
let remettre = document.querySelector('.remettre');

let ligne = document.querySelectorAll('.ligne');
let attente = document.querySelector('.attente');

let retirer = document.querySelectorAll('.retirer');
let retire = document.querySelector('.retire');

let closes = document.querySelector('#recherche1>div>form>.closes');
let closes1 = document.querySelector('#recherche2>div>form>.closes');
let closes2 = document.querySelector('#recherche3>div>form>.closes');

let search1 = document.getElementById('recherche1');
let search2 = document.getElementById('recherche2');
let search3 = document.getElementById('recherche3');

document.addEventListener("DOMContentLoaded", function() {

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



})