
let topnav0 = document.querySelector(".topnav0");
let hidden = document.querySelector(".hidden");
let x = 0;


let task = document.querySelector('.task');

let bloc_task = document.querySelector('.bloc-task');

let y = 0;

let watch = document.querySelectorAll('.watch');
let modal = document.querySelectorAll('.recherche4');

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

    watch.forEach((element) => {
        element.addEventListener('click', (e) => {
                element_value = element.value
                modal.forEach((el) => {
                    className = el.className;
                    split = className.split(" ");
                    if(split.includes(element_value)) {
                        el.style = 'display:block'
                        clos = el.childNodes[1].childNodes[3];
                        clos.addEventListener('click', (e) => {
                            el.style = 'display:none';
                        })
                    }
                })
        })
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
