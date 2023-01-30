let topul2 = document.getElementById("topul2");
let icon0 = document.querySelector(".icon0");

let topnav0 = document.querySelector(".topnav0");
let hidden = document.querySelector(".hidden");
let x = 0;

let fermer = document.querySelector(".fermer");
let form = document.querySelector(".none");
let y= 0;

//pour les chapitres (au cas où les chapitres seront de trop)
let chapter_media = document.querySelector(".chapter_media");
let chapter = document.querySelector(".chapter_icon");
let chapter_ul = document.querySelector(".chapter>ul");
let z = 0;

//pour afficher un nombre donné de commentaires suite à un click
let click = document.querySelector('.click');
let article = document.querySelectorAll('.article');
let container_article = document.querySelector('.container_article');
let i, control_lenght = 2;

if(article.length>0) {
    for(i=0; i<article.length; i++) {
        if(i>=2) {
            article[i].style = 'display:none';
        }
    }
} else {
    container_article.innerHTML = "<h3>Il n'y a pas de commentaires actuellement pour ce poste!!!</h3>"
    container_article.style = "height:100px; color:red"
}


//pour aller sur l'avant dernière page qu'un utilisateur a parcourri
let click_button = document.querySelector(".click_button");

//pour les likes que les utilisateurs font sur les oeuvres
//utilisation de l'ajax
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

// pour mettre en gras les mots contenant un @
let exp_reg = /@\w+/;
let article_p = document.querySelectorAll('.article>div>p');
article_p.forEach(el => {
    if(el.textContent.match(exp_reg)) {
        let join = el.textContent.match(exp_reg).join("");
        let article_new = el.textContent.replace(join, "<span class='bold'>"+join+"</span>");
        let text = '<pre>' + article_new + '</pre>';
        el.innerHTML = text;
    }
    else {
        el.innerHTML = '<pre>' + el.textContent + '</pre>';
    }
})

document.addEventListener("DOMContentLoaded", () => {

    //au clique, des requêtes vers la bd seront effectuées
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

    //au clique de l'élément certains commentaires commenceront à s'afficher
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

    //au clique, non seulement on affiche les chapitres qu'il dans cette oeuvre mais on donne aussi une taille à l'élément qui contient ces chapitres
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

    //au clique, on repart sur la page précédente
    click_button.addEventListener("click", (e) => {
        e.preventDefault();
        window.history.back();
    })
})