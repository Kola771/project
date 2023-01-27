let left = document.querySelector(".left");
let right = document.querySelector(".right");

let show = 1;
Slides(show);

function solute(number) {
    Slides(show += number);
}

//fonction pour faire le carrousel
function Slides(number) {
    let i;
    let absolute = document.getElementsByClassName('absolute');
    if(number > absolute.length) {
        show = 1
    }
    if(number < 1) {
        show = absolute.length
    }
    for(i = 0; i<absolute.length; i++) {
        absolute[i].style.display = "none";            
    }
    absolute[show-1].style.display = "block"; 
}

document.addEventListener("DOMContentLoaded", function() {

    left.addEventListener("click", (e) => {
        e.preventDefault();
        solute(-1);
    })

    right.addEventListener("click", (e) => {
        e.preventDefault();
        solute(1);
    })

})


