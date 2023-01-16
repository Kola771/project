
let topul2 = document.getElementById("topul2");
let topnav0 = document.querySelector(".topnav0");
let hidden = document.querySelector(".hidden");
let icon0 = document.querySelector(".icon0");
let x = 0;


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
})