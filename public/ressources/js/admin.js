
let topnav0 = document.querySelector(".topnav0");
let hidden = document.querySelector(".hidden");
let x = 0;

let task = document.querySelector('.task');

let bloc_task = document.querySelector('.bloc-task');

let y = 0;

let click_button = document.querySelector(".click_button");

document.addEventListener("DOMContentLoaded", function() {

    task.addEventListener("click", (e) => {
        switch(y) {
            case 0:
                bloc_task.style="display:block";
                y++;
                break;
            case 1:
                bloc_task.style="display:none";
                y=0
                break;
        }
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

    click_button.addEventListener("click", (e) => {
        e.preventDefault();
        window.history.back();
    })
})