
let chapter_media = document.querySelector(".chapter_media");
let chapter = document.querySelector(".chapter_icon");
let chapter_ul = document.querySelector(".chapter>ul");
let z = 0;

let topnav0 = document.querySelector(".topnav0");
let hidden = document.querySelector(".hidden");
let x = 0;

let click_button = document.querySelector(".click_button");

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

    chapter.addEventListener("click", (e) => {
        switch(z) {
            case 0:
                chapter_media.style = "height:400px";
                chapter_ul.style="display:flex";
                z++;
                break;
            case 1:
                chapter_media.style = "height:auto";
                chapter_ul.style="display:none";
                z=0
                break;
        }
    })
    
    //au clique, on repart sur la page précédente
    click_button.addEventListener("click", (e) => {
        e.preventDefault();
        window.history.back();
    })
})