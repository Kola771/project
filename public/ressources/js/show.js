
let left = document.querySelector(".left");
let right = document.querySelector(".right");

let show = 1;
Slides(show);

function solute(n) {
    Slides(show += n);
}

function Slides(n) {
    let i;
    let absolute = document.getElementsByClassName('absolute');
    if(n > absolute.length) {
        show = 1
    }
    if(n < 1) {
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





