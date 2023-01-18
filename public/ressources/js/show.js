
let left = document.querySelector(".left");
let right = document.querySelector(".right");

let topnav0 = document.querySelector(".topnav0");
let hidden = document.querySelector(".hidden");
let x = 0;

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

})


