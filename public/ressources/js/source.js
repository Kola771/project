

function myFunction() {
    let input, filter, ul, li, a, i, inputValue;
    input = document.getElementById("search");
    filter = input.value.toUpperCase();
    ul = document.getElementById("search_ul");
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        if (a) {
            inputValue = a.textContent || a.innerText;
            if (inputValue.toUpperCase().indexOf(filter) > -1) {
                li[i].style.display = "";
            } else {
                li[i].style.display = "none";
            }
        }
    }
}

let input = document.querySelector("#search");

let search = document.querySelector('#input');
let form = document.querySelector('#form');
let closes = document.querySelector('#close');

// let test = "Welcome to Freek !!!";
// let tab = test.split("");
// let text = document.querySelector(".text");
// let compteur;
// let i = 0;


document.addEventListener("DOMContentLoaded", function() {

    // compteur = setInterval(function() {
    //     text.innerHTML += tab[i];
    //     text.style = "background-color: #eee";
    //     i++;
    //     if(i === tab.length) {
    //         clearInterval(compteur);
    //     }
    // }, 1000/6)

    input.addEventListener("keyup", (e) => {
        e.preventDefault();
        myFunction();
    })

    search.addEventListener("click", (e) => {
        e.preventDefault();
        search.style = "width:100%";
        form.style = "width:20%";
        closes.style = "display:block";
    })

    closes.addEventListener("click", (e) => {
        e.preventDefault();
        search.style = "width:80%";
        form.style = "width:10%";
        closes.style = "display:none";
    })
})
