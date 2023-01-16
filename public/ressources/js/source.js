

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

let topul2 = document.getElementById("topul2");
let topnav0 = document.querySelector(".topnav0");
let hidden = document.querySelector(".hidden");
let icon0 = document.querySelector(".icon0");
let x = 0;

let input = document.querySelector("#search");


document.addEventListener("DOMContentLoaded", function() {

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


    icon0.addEventListener("click", (e) => {
        e.preventDefault();
        if(topul2.className === "topul flex list") {
            topul2.className += " responsive";
        } else {
            topul2.className = "topul flex list";
        }
    })

    input.addEventListener("keyup", (e) => {
        e.preventDefault();
        myFunction();
    })
})
