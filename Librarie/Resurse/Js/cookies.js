/*
Functii preluate de pe 
https://www.w3schools.com/js/js_cookies.asp
si modificate */
window.addEventListener("DOMContentLoaded", function(){
    checkCookie();
    console.log("aici");

})

function setCookie(cname, cvalue, timp_expirare) {//nume cookie, valoare cookie,timp_expirare masurat in milisecunde
    const d = new Date();
    d.setTime(d.getTime() + timp_expirare); //getTime() nr de milisec din 1970; dupa ce trece timp exipirare dispare cookie
    let expires = "expires="+d.toUTCString();//pentru a avea format special
    let stringCookie=cname + "=" + cvalue + ";" + expires + ";path=/"; //forma cookie
    console.log(stringCookie);
    document.cookie = stringCookie; //setam cookie;nu suprascrie un cookie existent, ci adauga la cele existente, un +=
    console.log(document.cookie)
  }
  
  function getCookie(cname) {//returneaza valoarea cookie-ului cu numele cname
    let name = cname + "=";
    let ca = document.cookie.split(';');//vectorul de stringuri de forma nume_cookie=valoare_cookie
    for(let i = 0; i < ca.length; i++) {
      let c = ca[i];//elementul curent
      while (c.charAt(0) == ' ') {
        c = c.substring(1);
      }//c.trim()
      if (c.indexOf(name) == 0) {//se putea folosi si startsWith
        return c.substring(name.length, c.length);//preia subsirul cu valoarea
      }
    }
    return "";
  }
  
  function checkCookie() { //se foloseste cand dau click pe buton
    let acc_cookie = getCookie("acceptat_banner");
    if (acc_cookie) { //sirul vid e evaluat la fals intr-o expresie booleana
      document.getElementById("banner").style.display="none"; //nu afisam banner 
    } else {
        document.getElementById("banner").style.display="block"; //afisam banner
        document.getElementById("ok_cookies").onclick=function(){ //luam butonul si la click 
            setCookie("acceptat_banner", true, 5000); //setem cookie ca acceptat si timpul de expirare
            console.log('in click')
            //setCookie("test", "ceva", 5000);
            document.getElementById("banner").style.display="none"; //ascundem cookie
          }
      
    }
  } 

function deleteCookie(nume){//presupunem path =/
    document.cookie=nume+"="+";expires=" + new Date().toUTCString() + ";path=/"
}
