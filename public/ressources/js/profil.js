let topnav0 = document.querySelector(".topnav0");
let hidden = document.querySelector(".hidden");
let x = 0;

let click = document.querySelector('.click');
let padding = document.querySelectorAll('.padding');

let article_one = document.querySelector(".article_one");
let article_two = document.querySelector(".article_two");

let i, control_lenght = 2;

if(padding.length>0) {
for(i=0; i<padding.length; i++) {
    if(i>=2) {
        padding[i].style = 'display:none';
    }
} 
}else {
    article_one.innerHTML = "<h3>Vous n'avez fait pas de commentaires !!!</h3>"
    article_one.style = "color:red"
}

let click_button = document.querySelector(".click_button");

//pour afficher les commentaires dans lesquels se retrouvent le/les noms de certains utilisateurs
let notif = document.querySelector(".notif");
let notification = document.querySelector(".notification");
let k = 0;

//pour afficher les commentaires des utilisateurs
let padding_notif = document.querySelectorAll(".padding_notif");

if(padding_notif.length>0) {
    for(i=0; i<padding_notif.length; i++) {
            padding_notif[i].style = 'display:block';
    } 
}
else {
    article_two.innerHTML = "<h3>Vous n'avez pas de notifications !!!</h3>"
    article_two.style = "color:red"
}

let date = document.querySelectorAll(".date");

padding_notif.forEach(el => {
    let date = document.querySelectorAll(".date");
    date.forEach(element => {
        let el_p = el.querySelector(".date").textContent;
        let split = element.textContent.split(" ");
        //vérification du contenu de chaque élément pour savoir s'il y a une corcondance
        if (el_p == element.textContent) {
            let last = split[split.length-2];
            let last_reverse = last.split("-").reverse();
            //conversion en numéric d'un string
            let last_day = Number(last_reverse[0]);
            let date = new Date();
            let date_array = date.toLocaleDateString().split("/");
            //conversion en numéric d'un string
            let day = Number(date_array[0]);
            //différence entre la date d'aujourd'hui et la date du commentaire
            let diff = day - last_day;
            if(diff > 0) {
                el.style = "background-color: rgb(37, 37, 37);color:white;"
            } else {
                let p = document.querySelector(".point>p");
                p.classList.add("p_color")
                p.innerHTML = padding_notif.length;
            }
        } 
       
    })
})


document.addEventListener("DOMContentLoaded", function() {

    notification.addEventListener("click", (e) => {
        switch(k) {
            case 0:
                notif.style = "display:block";
                notification.style = "color:#2980b9";
                k++;
                break;
            case 1:
                notif.style = "display:none";
                notification.style = "color:black";
                k=0;
                break;
        }
    })
    
    //pour ouvrir une page lors d'un clique sur un portant la classe padding_notif
    padding_notif.forEach(el => {
            el.addEventListener("click", (e) => {
                let el_split = el.className.split(" ");
                let name = el_split[el_split.length - 1];
                window.location.assign("/book-controller/" + name + "/view-book")
            })
    })

    //pour ouvrir une page lors d'un clique sur un portant la classe padding
    padding.forEach(el => {
        el.addEventListener("click", (e) => {
            let el_split = el.className.split(" ");
            let name = el_split[el_split.length - 1];
            window.location.assign("/book-controller/" + name + "/view-book")
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
    
    //au clique, on repart sur la page précédente
    click_button.addEventListener("click", (e) => {
        e.preventDefault();
        window.history.back();
    })
})