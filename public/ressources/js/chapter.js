
let chapter_media = document.querySelector(".chapter_media");
let chapter = document.querySelector(".chapter_icon");
let chapter_ul = document.querySelector(".chapter>ul");
let z = 0;


document.addEventListener("DOMContentLoaded", function() {

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
})