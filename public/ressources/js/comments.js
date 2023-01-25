let topul2 = document.getElementById("topul2");
let icon0 = document.querySelector(".icon0");

let topnav0 = document.querySelector(".topnav0");
let hidden = document.querySelector(".hidden");
let x = 0;

let fermer = document.querySelector(".fermer");
let form = document.querySelector(".none");
let y= 0;


let chapter_media = document.querySelector(".chapter_media");
let chapter = document.querySelector(".chapter_icon");
let chapter_ul = document.querySelector(".chapter>ul");
let z = 0;

let click = document.querySelector('.click');
let article = document.querySelectorAll('.article');

let i, control_lenght = 2;

for(i=0; i<article.length; i++) {
    if(i>=2) {
        article[i].style = 'display:none';
    }
}

let click_button = document.querySelector(".click_button");

let input = document.querySelectorAll(".like>form>input");
let forms = document.querySelector("#like_form");
let response = document.querySelector("#response");
let like = document.querySelector(".like>form>.like_div>button");

function likes() {
    let arrayLike = [];
    let requete;
    input.forEach(el => {
        arrayLike.push(el.name+ "=" +el.value)
    })
    requete = arrayLike.join("&");
    return requete;
}

document.addEventListener("DOMContentLoaded", () => {

    forms.addEventListener("submit", (e) => {
        e.preventDefault();

        let xmlhttp = new XMLHttpRequest();
        let param = likes();


        xmlhttp.open("POST", "/like-controller/insert-likes", true);

        xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        xmlhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
            
             response.innerHTML = this.responseText;
          }
        };
        xmlhttp.send(param);
    })

    click.addEventListener("click", (e) => {
        e.preventDefault();
        
        control_lenght += 2;
        
        if (control_lenght > article.length) {
            control_lenght -= 1;
            if(control_lenght > article.length) {
                control_lenght = "";
            }
        }

        for(i=0; i<control_lenght; i++) {
            article[i].style='display:flex';
            
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

    fermer.addEventListener("click", (e) => {
        switch(y) {
            case 0:
                form.style="display:block";
                y++;
                break;
            case 1:
                form.style="display:none";
                y=0
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

    icon0.addEventListener("click", (e) => {
        e.preventDefault();
        if(topul2.className === "topul flex list") {
            topul2.className += " responsive";
        } else {
            topul2.className = "topul flex list";
        }
    })

    click_button.addEventListener("click", (e) => {
        e.preventDefault();
        window.history.back();
    })
})