window.onload = function(){
    document.getElementById("form_inreg").onsubmit = function(){
        //returneaza true cand poate trimite datele la server
        if(document.getElementById("parl").value == document.getElementById("rparl").value)
            return true
        alert("Ati gresit la reintroducerea parolei"); //creare span ca sa afiseze langa eroarea
        return false;
    }
}