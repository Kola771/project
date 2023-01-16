
let topnav0 = document.querySelector(".topnav0");
let hidden = document.querySelector(".hidden");
let x = 0;

let task = document.querySelector('.task');

let bloc_task = document.querySelector('.bloc-task');

let y = 0;

let select = document.querySelector("#select");
let choose = document.querySelector("#choose");

let soumettre = document.querySelector(".soumettre");
let add_mc = document.querySelector(".add-mc");

let mangas = document.querySelector(".mangas");
let comics = document.querySelector(".comics");
let books = document.querySelector(".books");

let img = document.createElement("input");
let image = document.querySelector(".img");

let nota_biem = document.querySelector(".nota_biem");

document.addEventListener("DOMContentLoaded", function() {

    soumettre.addEventListener("click", (e) => {
        e.preventDefault()
        switch(choose.value) {
            case "mangas":
                add_mc.style = "display:block";
                add_mc.setAttribute("action", "/chapter-controller/add-chapter");

                nota_biem.style = "display:block";

                comics.style = "display:none";
                books.style = "display:none";

                img.setAttribute("type", "file");
                img.setAttribute("id", "image");
                img.setAttribute("multiple", "");
                img.setAttribute("name", "file[]");
                img.setAttribute("required", "");
                image.append(img);
                select.style="display:none"; 

            break;
            case "comics":
                add_mc.style = "display:block";
                add_mc.setAttribute("action", "/chapter-controller/add-chapter-comics")

                nota_biem.style = "display:block";

                mangas.style = "display:none";
                books.style = "display:none";

                img.setAttribute("type", "file");
                img.setAttribute("id", "image");
                img.setAttribute("multiple", "");
                img.setAttribute("name", "file[]");
                img.setAttribute("required", "");
                image.append(img);
                select.style = "display:none";     
            break;
            case "books":
                add_mc.style = "display:block";
                add_mc.setAttribute("action", "/chapter-controller/add-chapter-books");
                
                mangas.style = "display:none";
                comics.style = "display:none";

                image.style = "display:none"; 
                select.style="display:none";     
            break;
        }
        // console.log(choose.value);
    })

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
})