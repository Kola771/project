

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

let closes1 = document.querySelector('#recherche1>div>form>.closes');
let closes2 = document.querySelector('#recherche2>div>form>.closes');
let closes3 = document.querySelector('#recherche3>div>form>.closes');

let remove = document.getElementById('remove');
let inside = document.getElementById('inside');
let put = document.getElementById('put');

let search1 = document.getElementById('recherche1');
let search2 = document.getElementById('recherche2');
let search3 = document.getElementById('recherche3');

document.addEventListener("DOMContentLoaded", function() {

    input.addEventListener("keyup", (e) => {
        e.preventDefault();
        myFunction();
    })

    remove.addEventListener('click', function () {
        search1.style = "display: block";
    })

    inside.addEventListener('click', function () {
        search2.style = "display: block";
    })

    put.addEventListener('click', function () {
        search3.style = "display: block";
    })

    closes1.addEventListener('click', function () {
        search1.style = "display: none";
    })

    closes2.addEventListener('click', function () {
        search2.style = "display: none";
    })

    closes3.addEventListener('click', function () {
        search3.style = "display: none";
    })


})