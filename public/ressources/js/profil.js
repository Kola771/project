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
    article_one.innerHTML = "<h3>Vous n'avez pas de commentaires !!!</h3>"
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
    
    padding_notif.forEach(el => {
            el.addEventListener("click", (e) => {
                let el_split = el.className.split(" ");
                let name = el_split[el_split.length - 1];
                window.location.assign("/book-controller/" + name + "/view-book")
            })
    })

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
    
    click_button.addEventListener("click", (e) => {
        e.preventDefault();
        window.history.back();
    })
})