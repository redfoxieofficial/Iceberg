let responseString;
var yanlisSorular = [];

var baglan = new XMLHttpRequest;
baglan.onreadystatechange=function(){
    if (this.readyState == 4 && this.status == 200){
        responseString = JSON.parse(baglan.responseText);
        console.log(responseString);
        sorularigetir();
    } 
    return responseString
};

baglan.open("GET","data.json","true");
baglan.send();

const soruAlani = document.getElementsByClassName("soruAlani")[0];
const soru = document.getElementById("soru");
const secenekler = document.getElementsByName("secenek");

const secenekA = document.getElementById("SecenekA");
const secenekB = document.getElementById("SecenekB")
const secenekC = document.getElementById("SecenekC")
const secenekD = document.getElementById("SecenekD")

const aciklamaA = document.getElementById("aciklamaA");
const aciklamaB = document.getElementById("aciklamaB")
const aciklamaC = document.getElementById("aciklamaC")
const aciklamaD = document.getElementById("aciklamaD")

const gonderButonu = document.getElementById("gonder")

let puan = 0;
let sira = 0;

function sorularigetir(){
    secimiTemizle();
    

    let siradakisoru = responseString.sorular[sira];    
    soru.innerHTML = siradakisoru.Soru;
    aciklamaA.innerText= siradakisoru.SecenekA;
    aciklamaB.innerText= siradakisoru.SecenekB;
    aciklamaC.innerText= siradakisoru.SecenekC;
    aciklamaD.innerText= siradakisoru.SecenekD;

}


function secimiTemizle(){
    secenekler.forEach(secenek => secenek.checked = false)
}

function secimiAl(){
    let secim;

    secenekler.forEach(secenek=>{
        if (secenek.checked === true){
            secim = secenek.id;
        }
    }
    );
    return secim;}
    

gonderButonu.addEventListener("click", ()=>{
    const secilen = secimiAl();

    if(secilen == responseString.sorular[sira].dogru){
        
        puan++;

    }
    sira++;
    if (sira < responseString.sorular.length){
        sorularigetir();
    }else{
        soruAlani.innerHTML = `<h2>${responseString.sorular.length} soru içerisinden ${puan} doğru yaptınız<h2>
        <button onclick="location.reload()">Tekrar Çöz</button>`;
        gonderButonu.remove();

    }
}
)