
let chapter = document.querySelector(".chapter_icon");
let chapter_ul = document.querySelector(".chapter>ul");
let y = 0;


document.addEventListener("DOMContentLoaded", function() {

    chapter.addEventListener("click", (e) => {
        switch(y) {
            case 0:
                chapter_ul.style="display:flex";
                y++;
                break;
            case 1:
                chapter_ul.style="display:none";
                y=0
                break;
        }
    })
})