

let input = document.querySelector("#search");

let search = document.querySelector('#input');
let form = document.querySelector('#form');
let closes = document.querySelector('#close');


document.addEventListener("DOMContentLoaded", function() {

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
