window.onload = function(){

    var articole = document.getElementsByClassName("produs");
    var btn = document.getElementById("b1");

    var range = document.getElementById("i_range"); //selectez range-ul meu

    var min_range = document.createElement("span"); //crez span pt elem meu
    min_range.innerHTML = range.min; //setez continut span cu val minim
    range.parentNode.insertBefore(min_range, range); //inserez valoarea minima inainte de range

    var max_range= document.createElement("span");
    max_range.innerHTML = range.max;
    range.parentNode.appendChild(max_range);

    range.onchange = function(){
        var info_range = document.getElementById("info-range");//daca exista il gaseste, daca nu il gaseste va intoarce null si intra pe if pt creare
        if(!info_range){
            info_range = document.createElement("span");
            info_range.id = "info-range";
            //document.body.appendChild(info_range); se adauga la finalul doc
            //this.parentNode.insertBefore(info_range, this); se adauga in stanga
            this.parentNode.appendChild(info_range);
        }
        info_range.innerHTML = "(" + this.value + ")";
    }
    var rangeMax = document.getElementById("i_rangeMax");

    var min_rangeMax = document.createElement("span"); //crez span pt elem meu
    min_rangeMax.innerHTML = rangeMax.min; //setez continut span cu val minim
    rangeMax.parentNode.insertBefore(min_rangeMax, rangeMax); //inserez valoarea minima inainte de range

    var max_rangeMax = document.createElement("span");
    max_rangeMax.innerHTML = rangeMax.max;
    rangeMax.parentNode.appendChild(max_rangeMax);

    rangeMax.onchange = function(){
        var info_rangeMax = document.getElementById("info-rangeMax");
        if(!info_rangeMax){
            info_rangeMax = document.createElement("span"); //cream elem unde sa scrie
            info_rangeMax.id = "info-rangeMax";
            //document.body.appendChild(info_rangeMax); //se adauga la finalul doc
            //this.parentNode.insertBefore(info_rangeMax, this);
            this.parentNode.appendChild(info_rangeMax);
        }
        info_rangeMax.innerHTML = "(" + this.value + ")";        
    }

    btn.onclick = function(){
        for(let art of articole){
            var spn_nume = art.getElementsByClassName("val-nume")[0];
            var spn_pret = art.getElementsByClassName("val-pret")[0];
            var spn_categorie = art.getElementsByClassName("val-categorie")[0];
            var spn_garantie = parseInt(art.getElementsByClassName("val-termen_garantie")[0].innerHTML);
            var spn_reducere = art.getElementsByClassName("val-reducere")[0];
            var spn_descriere = art.getElementsByClassName("val-descriere")[0];
            var spn_culoare = art.getElementsByClassName("culoare")[0]; //iau culoarea din produs.ejs pt ca nu apare in produse.ejs, cum fac sa vada
            art.style.display = "none";

            conditie1_pret_min = parseInt(spn_pret.innerHTML) >= parseInt(document.getElementById("i_range").value);
            conditie2_pret_max = parseInt(spn_pret.innerHTML) <= parseInt(document.getElementById("i_rangeMax").value);
            conditie3_nume = spn_nume.innerHTML.toUpperCase().startsWith(document.getElementById("i_text").value.toUpperCase());
            conditie6_descriere = spn_descriere.innerHTML.startsWith(document.getElementById("i_textarea").value);
            var val_categorie = document.getElementById("i_sel_simplu").value; //selectez valoarea din select simplu
            if(val_categorie == "toate"){
                conditie7_categorie = true;
            }
            else 
                conditie7_categorie =  (spn_categorie.innerHTML == val_categorie)
                
            var optiuni = document.getElementById("i_sel_multiplu").options; 
            sir = [];
		    for(let opt of optiuni){
			    if(opt.selected)
				    sir.push(opt.value.trim());
		    }
            if(sir.includes(spn_culoare.innerHTML.trim()))
                conditie8_culoare = true;
            else
                conditie8_culoare = false;

            var chk = document.getElementById("i_check1");
            if(chk.checked){
                cond = "true";
            }
            else cond = "false";

            conditie5_reducere = (spn_reducere.innerHTML==cond);
          
            var radbtns = document.getElementsByName("gr_rad");
            for(let rad of radbtns){
                if(rad.checked){
                    var val_rad = rad.value; //poate fi 1 2 sau 3(value din input)
                    break;
                }
            }
            var conditie4_garantie;
            switch(val_rad){
                case "1": conditie4_garantie = (spn_garantie<10); break;
                case "2": conditie4_garantie = (spn_garantie>10 && spn_garantie<20); break;
                case "3": conditie4_garantie = (spn_garantie>=20); break;
                default: conditie4_garantie=true
            }
            console.log(conditie1_pret_min, conditie2_pret_max, conditie3_nume, conditie4_garantie, conditie5_reducere, 
                conditie6_descriere, conditie7_categorie, conditie8_culoare);
            if(conditie1_pret_min && conditie2_pret_max && conditie3_nume && conditie4_garantie && conditie5_reducere && 
                conditie6_descriere && conditie7_categorie && conditie8_culoare){
                art.style.display = "block";
            }
            
        }
    }
    function sortare(semn){
        var v_articole = Array.from(articole); //il trasnform in array ca sa folosesc metoda sort(), altel nu se putea pt ca colectia nu are
        v_articole.sort(function(a, b){
            //a si b sunt articolele, ne trebuie span-urile
            val_a1 = a.getElementsByClassName("val-nume")[0].innerHTML;
            val_b1 = b.getElementsByClassName("val-nume")[0].innerHTML;

            val_a2 = a.getElementsByClassName("val-descriere")[0].innerHTML.length;
            val_b2 = b.getElementsByClassName("val-descriere")[0].innerHTML.length;

            if(val_a1 < val_b1)
                return semn*1;
            else if(val_a1 > val_b1)
                return semn*(-1);
            else
                return semn*(val_a2 - val_b2);
        })
        for(let art of v_articole){
            art.parentNode.appendChild(art); //il mutam la final
        }
    }
    var btn_cresc = document.getElementById("crescator");
    btn_cresc.onclick = function(){
        sortare(-1);
    }

    var btn_descresc = document.getElementById("descrescator");
    btn_descresc.onclick = function(){
       sortare(1);
    }

    var btn_reseteaza = document.getElementById("reset");
    btn_reseteaza.onclick = function(){
        document.getElementById("i_text").value = '';
        document.getElementById("i_textarea").value = '';
        document.getElementById("i_rad4").checked = true;
        document.getElementById("i_check1").checked = true;
        document.getElementById("i_range").value = document.getElementById("i_range").min;
        document.getElementById("i_rangeMax").value = document.getElementById("i_rangeMax").max;
        document.getElementById("i_sel_simplu").value = document.getElementById("Toate").value;
        var optiuni = document.getElementById("i_sel_multiplu").options; 
		    for(let opt of optiuni){
			    opt.selected = true;
				
		    }
        //document.getElementById("info-range").innerHTML = "(" + document.getElementById("info-range").min + ")";
        //document.getElementById("info-rangeMax").innerHTML = "(" + document.getElementById("info-rangeMax").max + ")";
        for(let art of articole){
            art.style.display = "block";
        }
    }

    //selectare cos
    function isItemInArray(array, item, cautaTot) { /// cautaTot= True (cauta si dupa id si dupa cantitate) cautaTot= False (cauta dupa id )
        for (var i = 0; i < array.length; i++) {
            if(cautaTot){
                if (array[i][0] == item[0] && array[i][1] == item[1]) {
                    return i;   
                }
            } else if (array[i][0] == item[0]) {
                        return i;   
                    }
        }
        return -1;
    }
    function getIdsProduse(){
        let ids_produse=[];
            aux_produse=localStorage.getItem("produse_selectate")
            if(aux_produse){  // Presupunem ca in localStorage ar trebui salvate in modul urmator "1:5,2:3,3:1,4:1" // 5 produse de tipul 1, 3 produse de tipul 2, 1 produs de tipul 3...
                aux_produse=aux_produse.split(","); // ['1:5','2:3',..]
                for( let p of aux_produse){
                     let per=p.split(":");
                     ids_produse.push([parseInt(per[0]),parseInt(per[1])])
                }
            }
            else ids_produse=[]
        return ids_produse;        
    }

    function StorageIdsProduse(ids_produse){
        v_sir_prod=[];
            for(let prod of ids_produse){// prod o lista cu id si cantitate
                let sir_prod=prod[0]+":"+prod[1];
                v_sir_prod.push(sir_prod); //v_sir_prod va fi de forma ['1:5','2:3',..]
            } 
            localStorage.setItem("produse_selectate",v_sir_prod.join(",")) 
    }

    ids_produse_init = getIdsProduse();
    var checkboxuri_cos = document.getElementsByClassName("select-cos");
    var cantitate_cos=document.getElementsByClassName("cantitate_cos");
    for (let ch=0; ch< checkboxuri_cos.length; ch++){
        const s=[];
        s.push(parseInt(checkboxuri_cos[ch].value));
        s.push(parseInt(cantitate_cos[ch].value));
        poz=isItemInArray(ids_produse_init,s,false);
        if (poz!=-1){
            checkboxuri_cos[ch].checked=true;
            cantitate_cos[ch].value=ids_produse_init[poz][1]
        }
        checkboxuri_cos[ch].onchange=function(){
            ids_produse=getIdsProduse();
            console.log("Selectie veche:", ids_produse);
            //ids_produse.map(function(elem){return parseInt(elem)});
            //console.log(ids_produse);
            const s=[];
            s.push(parseInt(checkboxuri_cos[ch].value));
            s.push(parseInt(cantitate_cos[ch].value));
            if(checkboxuri_cos[ch].checked){
                ids_produse.push(s);//adaug elementele noi, selectate (bifate)
            }
            else{
                ids_produse.splice(isItemInArray(ids_produse, s, false),1); //sterg elemente debifate
            }
            console.log("Selectie noua:",ids_produse);
            StorageIdsProduse(ids_produse);

        }
        cantitate_cos[ch].onchange=cantitate_cos[ch].onkeydown=function(){
            if(checkboxuri_cos[ch].checked){
                let ids_produse=getIdsProduse();
                console.log("Selectie veche:", ids_produse);
                const s=[];
                s.push(parseInt(checkboxuri_cos[ch].value));
                s.push(parseInt(cantitate_cos[ch].value));
                poz=isItemInArray(ids_produse,s,false);
                console.log(s,"            ",poz);
                if (poz!=-1){
                    ids_produse[poz][1]=parseInt(cantitate_cos[ch].value);
                    console.log("Selectie noua:",ids_produse);
                    StorageIdsProduse(ids_produse);
                } 
            }
        }
    }

    /*
    ids_produse_init=localStorage.getItem("produse_selectate");
    if(ids_produse_init)
        ids_produse_init=ids_produse_init.split(",");//obtin vectorul de id-uri ale produselor selectate  (din cosul virtual)
    else
        ids_produse_init=[]

    var checkboxuri_cos = document.getElementsByClassName("select-cos");
    var cantitate_cos = document.getElementsByClassName("cantitate_cos");
    for (let ch of checkboxuri_cos){
        if (ids_produse_init.indexOf(ch.value)!=-1)
            ch.checked=true;
        ch.onchange=function(){
            ids_produse=localStorage.getItem("produse_selectate")
            if(ids_produse)
                ids_produse=ids_produse.split(",");
            else
                ids_produse=[]
            console.log("Selectie veche:", ids_produse);
            //ids_produse.map(function(elem){return parseInt(elem)});
            //console.log(ids_produse);
            if(ch.checked){
                ids_produse.push(ch.value);//adaug elementele noi, selectate (bifate)
            }
            else{
                ids_produse.splice(ids_produse.indexOf(ch.value), 1) //sterg elemente debifate
            }
            console.log("Selectie noua:",ids_produse);
            localStorage.setItem("produse_selectate",ids_produse.join(","))
        }
    }*/
}

window.onkeydown = function(e){
    console.log(e);
    if(e.key == 'c' && e.altKey == true){
        var suma = 0;
        var articole = document.getElementsByClassName("produs");
        for(let art of articole){
            if(art.style.display != "none")
            suma += parseFloat(art.getElementsByClassName("val-pret")[0].innerHTML);
        }

        var spanSuma;
        spanSuma = document.getElementById("numar-suma");
        if(!spanSuma){
            spanSuma = document.createElement("span");
            spanSuma.innerHTML = "Suma: " + suma;
            spanSuma.id = "numar-suma";
            document.getElementById("p-suma").appendChild(spanSuma); //adaug la final
            setTimeout(function(){document.getElementById("numar-suma").remove()}, 1500);
        }
    }
}