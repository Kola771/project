
let table_tr = document.querySelectorAll("#myTable>tbody>tr");

console.log(table_tr);

let previous = document.querySelector(".previous");

let next = document.querySelector(".next");

let i, control_lenght = 5;
let sum = 0;

for(let i=0; i<table_tr.length; i++) {
    if(i>4) {
        table_tr[i].style = "display:none";
    }
}

document.addEventListener("DOMContentLoaded", function() {

    next.addEventListener("click", (e) => {
        e.preventDefault();
        
        control_lenght += 5;
        
        if (control_lenght > table_tr.length) {

                control_lenght -= table_tr.length;

                if(control_lenght<table_tr.length) {

                    control_lenght = table_tr.length
                    
                }

        }

        sum = control_lenght - 5;
        console.log(sum);
        console.log(control_lenght);


        for(i=0; i<control_lenght; i++) {
            if(i<sum) {
                table_tr[i].style = "display:none";
            } 
            else {
                table_tr[i].style='display:flex flex-basis:100%';
            }
        }
    })


})
