
let task = document.querySelector('.task');

let bloc_task = document.querySelector('.bloc-task');

let y = 0;


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
})