let topnav0 = document.querySelector(".topnav0");
let hidden = document.querySelector(".hidden");
let x = 0;

let click = document.querySelector('.click');
let padding = document.querySelectorAll('.padding');

let i, control_lenght = 2;

for(i=0; i<padding.length; i++) {
    if(i>=2) {
        padding[i].style = 'display:none';
    }
}

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

    click.addEventListener("click", (e) => {
        e.preventDefault();
        
        control_lenght += 2;
        
        if (control_lenght > padding.length) {
            control_lenght -= 1;
            if(control_lenght > padding.length) {
                control_lenght = "";
            }
        }

        for(i=0; i<control_lenght; i++) {
            padding[i].style='display:block';
            
        }
        
    })
    
    click_button.addEventListener("click", (e) => {
        e.preventDefault();
        window.history.back();
    })
})