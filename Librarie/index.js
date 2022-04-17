const express = require("express"); //includem librarie pt server
const { Client } = require("pg");
const fs = require('fs');
const sharp = require('sharp') //resize imagini mici
const path = require('path');
const ejs = require("ejs");
const sass = require("sass");
const formidable = require("formidable");
const crypto = require("crypto");
const nodemailer = require("nodemailer");
const session = require("express-session")
const html_to_pdf = require("html-pdf-node");
var QRCode = require("qrcode"); 
const request = require('request');
const xmljs = require('xml-js');
const helmet=require('helmet');
const socket = require("socket.io");
app = express(); //ob de tip server
const http=require('http');
const { dirname } = require("path");

const server = new http.createServer(app); 
var  io= socket(server)
io = io.listen(server);//asculta pe acelasi port ca si serverul

io.on("connection", function (socket)  {  
    console.log("Conectare!");
	//if(!conexiune_index)
	//	conexiune_index=socket
    socket.on('disconnect', function() {conexiune_index=null;console.log('Deconectare')});
});

app.post('/mesaj', function(req, res) {
    
    var form = new formidable.IncomingForm();
    form.parse(req, function(err, fields, files) {
        console.log("primit mesaj")
        //if(conexiune_index){

            //trimit catre restul de utilizatori mesajul primit
            io.sockets.emit('mesaj_nou', fields.nume, fields.culoare, fields.mesaj,fields.emoj,fields.data, fields.culoare_fundal, fields.format_data);
            console.log('Mesaju', fields.nume, fields.culoare, fields.mesaj,fields.emoj,fields.data, fields.culoare_fundal)
        //}
    res.send("ok");
    });
});


console.log(__dirname);
/* get cere ceva, post transmite date de obicei in formualre
put modificare, delete stergere*/

//vrem ca css de la etapa 2 sa fie folosit pe toate paginile (generat automat) => setam view engine
app.set("view engine", "ejs");

//pagini speciale pentru care cererile post nu se preiau cu formidable
app.use(["/produse_cos","/cumpara", "/sterge_poza"],express.json({limit:'2mb'}));//obligatoriu de setat pt request body de tip json
app.use(["/contact"], express.urlencoded({extended:true}));

app.use(helmet.frameguard());//pentru a nu se deschide paginile site-ului in frame-uri

//session este proprietate a lui request (req)
app.use(session({ //nu am dat cale deci e pt orice cerere
    secret: //parola de sesiune,
    resave: true,
    saveUninitialized: false
}));
//app.use(helmet.frameguard()); //sa nu se deschida in iframe
//locals este proprietate a lui response (res)
app.use("/*", function(req, res, next){
    //pt ca toate pag sa contina locals.utilizator {utilizator:req.session.utilizator} 
    res.locals.utilizator = req.session.utilizator;
    //bonus si pentru meniu
    res.locals.categProduse = v_optiuniCategMare
    //next ajuta sa treaca la urm app.use
    next();
});


if(process.env.SITE_ONLINE){
    protocol="https://";
    numeDomeniu = "radiant-shelf-24402";
    var client = new Client({
        //data about client
}
else{
    protocol="http://";
    var client = new Client({ //client });
    numeDomeniu = "localhost:8080";
}
client.connect();

cale_qr="./Resurse/Imagini/qrcode";
if (fs.existsSync(cale_qr))
  fs.rmSync(cale_qr, {force:true, recursive:true});
fs.mkdirSync(cale_qr);
client.query("select id from produse", function(err, rez){
    for(let prod of rez.rows){
        let cale_prod=protocol+numeDomeniu+"/produs/"+prod.id;
        //console.log(cale_prod);
        QRCode.toFile(cale_qr+"/"+prod.id+".png",cale_prod);
    }
});

function getIp(req){//pentru Heroku
    var ip = req.headers["x-forwarded-for"];
    if (ip){
        let vect=ip.split(",");
        return vect[vect.length-1];
    } 
    else if (req.ip){
        return req.ip;
    }
    else{
     return req.connection.remoteAddress;
    }
}

sirAlphaNum = "";
v_intervale = [[66,68], [70, 72], [74, 78], [80, 84], [86, 90]]; //coduri ascii pentru intervalele 0-9 a-z A-Z
for (let interval of v_intervale){
    for (let i = interval[0]; i <= interval[1]; i++)
        sirAlphaNum += String.fromCharCode(i);
}

function genereazaToken(lungime){
    sirAleator = "";
    for(let i = 0;i < lungime; i++){
        sirAleator += sirAlphaNum[Math.floor(Math.random() * sirAlphaNum.length)];
    }
    return sirAleator
}

async function trimiteMail(username, email, token1, token2){
    var transp = nodemailer.createTransport({
        service: "gmail",
        secure: false,
        auth:{
            //data about mail
        },
        tls:{
            rejectUnauthorized: false
        }
    });
    //generam htm pt mail
    await transp.sendMail({
        from: //mail,
        to: email,
        subject: "Mesaj inregistrare",
        text: `Pe RalUnivers ai username-ul: ${username}, începând de azi, `+ new Date(),
        html:`<h1>Salut!</h1><p style='color:blue'>Pe RalUnivers ai username-ul ${username}, începând de azi, <span style='color: purple; text-decoration: underline;'>`+ new Date()+`</span>.</p> <p><a href='http://${numeDomeniu}/confirmare_mail/${token1}/${username}/${token2}'>Click aici pentru confirmare</a></p>`,
    })
    console.log("trimis mail");
}

async function trimitefactura(username, email,numefis){
	var transp= nodemailer.createTransport({
		service: "gmail",
		secure: false,
		auth:{//date login 
			
		},
		tls:{
			rejectUnauthorized:false
		}
	});
	//genereaza html
	await transp.sendMail({
		from://mail,
		to:email,
		subject:"Factură",
		text:"Stimate "+username+", aveți atașată factura",
		html:"<h1>Salut!</h1><p>Stimate "+username+", aveți atașată factura</p>",
        attachments: [
            {   // utf-8 string as an attachment
                filename: 'factura.pdf',
                content: fs.readFileSync(numefis)
            }
        ]
	})
	console.log("trimis mail");
}

var ipuri_active={};
app.use(function(req,res,next){
    let ipReq=getIp(req);
    let ip_gasit=ipuri_active[ipReq+"|"+req.url];
    timp_curent=new Date();
    if(ip_gasit){
    
        if( (timp_curent-ip_gasit.data)< 5*1000) {//diferenta e in milisecunde; verific daca ultima accesare a fost pana in 10 secunde
            if (ip_gasit.nr>10){//mai mult de 10 cereri 
                res.send("<h1>Prea multe cereri intr-un interval scurt. Ia te rog sa fii cuminte, da?!</h1>");
                ip_gasit.data=timp_curent
                return;
            }
            else{  
                
                ip_gasit.data=timp_curent;
                ip_gasit.nr++;
            }
        }
        else{
            ip_gasit.data=timp_curent;
            ip_gasit.nr=1;//a trecut suficient timp de la ultima cerere; resetez
        }
    }
    else{
        ipuri_active[ipReq+"|"+req.url]={nr:1, data:timp_curent};
    }
    let comanda_param= `insert into accesari(ip, user_id, pagina) values ($1::text, $2,  $3::text)`;
    //console.log(comanda);
    if (ipReq){
        var id_utiliz=req.session.utilizator?req.session.utilizator.id:null;
        console.log("id_utiliz", id_utiliz);
        client.query(comanda_param, [ipReq, id_utiliz, req.url], function(err, rez){
            if(err) console.log('rau',err);
        });
    }
    next();   
}); 

function stergeAccesariVechi(){
    let comanda= `delete from accesari where now() - data_accesare > interval '10 minutes'`;
    //console.log(comanda);
    client.query(comanda, function(err, rez){
        if(err) console.log(err);
    });
    let timp_curent=new Date();
    for( let ipa in ipuri_active){
        if (timp_curent-ipuri_active[ipa].data>2*60*1000){ // daca sunt mai vechi de 2 minute le deblochez
            console.log("Am deblocat ", ipa);
            delete ipuri_active[ipa];
        }
    }
}


setInterval(stergeAccesariVechi,10*60*1000);

app.get('/confirmare_mail/:token1/:user/:token2', function(req, res){
    token = req.params.token1 + '/' + req.params.user + '/' + req.params.token2;
    var queryUpdate = `update utilizatori set confirmat_mail = 'true' where username = $1::text and cod=$2::text`;
    client.query(queryUpdate, [req.params.user, token], function(err, rez){
        if (err){
            console.log(err);
            res.render("Pagini/403",{err:"Eroare baza date"});
            return;
        }
        if (rez.rowCount > 0){
            res.render("Pagini/confirmare");
        }
        else{
            res.render("Pagini/403",{err:"Eroare link"});
        }
    });
});

client.query("select * from unnest(enum_range(null::tipuri_produse))", function(errCategMare, rezCategMare){
    v_optiuniCategMare = [];
    for(let elem of rezCategMare.rows){
        v_optiuniCategMare.push(elem.unnest);
    }
    //console.log(v_optiuniCategMare);
});

//intra pe use pt orice tip de cerere
//toate fisierele din /Resurse sunt statice adica express.static transforma o cale in cale normala, nu ca o cerere
app.use("/Resurse", express.static(__dirname + "/Resurse"));
app.use("/poze_uploadate", express.static(__dirname + "/poze_uploadate"));

app.get("/produse", function(req, res) {
    console.log(req.query);
    var conditie = "where 1=1";
    if (req.query.tip) {
        conditie += `and categ_mare = '${req.query.tip}'`;
    }
    client.query(`select * from produse ${conditie}`, function(err, rez) {
        console.log(err);
        /* enum_range(null::tipuri_mici) intoarce vector cu valorile enum, iar unnest il face chiar vector*/
        client.query("select * from unnest(enum_range(null::tipuri_mici))", function(errCateg, rezCateg){
            v_optiuni = [];
            for(let elem of rezCateg.rows){
                v_optiuni.push(elem.unnest);
            }
            console.log(v_optiuni);

            client.query("select * from unnest(enum_range(null::culori))", function(errCul, rezCul){
                v_optiuniCul = [];
                for(let elem of rezCul.rows){
                    v_optiuniCul.push(elem.unnest);
                }
                console.log(v_optiuniCul);

                res.render("Pagini/produse", { produse: rez.rows, optiuni: v_optiuni, culori: v_optiuniCul});
            });
        });
    });
});

app.get("/produs/:id", function(req, res) {
    console.log(req.params);
    prod = `select * from produse where id = $1`;
    client.query(prod, [req.params.id], function(err, rez) {
        console.log(err);
        res.render("Pagini/produs", { prod: rez.rows[0]});
    });
});

//functia asta se executa cand porneste server-ul
function creeazaImagini() {
    //---galerie
    //fs.readFile -> nu citeste pe loc fisierul, doar o programeaza dupa ce se executa instructiunea urmatoare
    //fs.readFileSync -> citire pe loc, rezultat imediat
    var buf = fs.readFileSync(__dirname + '/Resurse/json/galerie.json').toString('utf-8'); //returneaza un buffer ce trb transformat in string
    obImagini = JSON.parse(buf); //transformam json in obiect, global ca nu e var
    for (let imag of obImagini.imagini) {
        //separam extensia de numele fisierului
        let aux = imag.fisier.split('.');
        let nume_imag = aux[0];
        let extensie = aux[1];
        //[nume_imag, extensie] = imag.fisier.split('.')
        let dim_mica = 100
        let dim_medie = 250
        imag.mic = `${obImagini.cale_galerie}/Mic/${nume_imag}-${dim_mica}.webp`; //Resurse/Imagini/Pag1/nume-150.webp
        imag.mare = `${obImagini.cale_galerie}/${nume_imag}.png`;
        imag.mediu = `${obImagini.cale_galerie}/Mediu/${nume_imag}-${dim_medie}.webp`;
        //populam folder-ul mic de imagini mici
        if (!fs.existsSync(path.join(__dirname, imag.mic)))
            sharp(path.join(__dirname, imag.mare)).resize(dim_mica).toFile(path.join(__dirname, imag.mic));
        if (!fs.existsSync(path.join(__dirname, imag.mediu)))
            sharp(path.join(__dirname, imag.mare)).resize(dim_medie).toFile(path.join(__dirname, imag.mediu));
    }
}
creeazaImagini() //dupa apel se creeaza obImagini

function anotimpuri() {
    let iarna = [];
    let toamna = [];
    let primavara = [];
    let vara = [];
    const d = new Date();
    let month = d.getMonth();

    for (let imag of obImagini.imagini) {
        if (imag.anotimp == 'iarna')
            iarna.push(imag);
        else if (imag.anotimp == 'toamna')
            toamna.push(imag);
        else if (imag.anotimp == 'vara')
            vara.push(imag);
        else(imag.anotimp == 'primavara')
        primavara.push(imag);
    }
    if (month == 0 || month == 1 || month == 11)
        return iarna
    else if (month == 2 || month == 3 || month == 4)
        return primavara
    else if (month == 5 || month == 6 || month == 7)
        return vara
    else
        return toamna
}
var nr_imag_aleatoare_calculat;

function get_imag_animate() {
    var lista_imagini = [];
    var numere = [9, 12, 15];
    nr_imag_aleatoare_calculat = numere[Math.floor(Math.random() * numere.length)];
    for (let imag of obImagini.imagini) {
        if (imag.galerieAnimata == 'true') {
            lista_imagini.push(imag);
            if (lista_imagini.length == nr_imag_aleatoare_calculat) {
                break;
            }
        }
    }
    return lista_imagini;
}
/*
//primul parametru este cererea, urm este o functie care se va apela pentru cererea resp
app.get(["/", "/index", "/home"], function(req, res) {
    console.log(req.ip); //afiseaza doar ce e dupa numele domneiului
    
    var rezultat;
    client.query("select username, nume, prenume from utilizatori where id in (select distinct user_id from accesari where now() - data_accesare < interval '5 minutes' )").then(function(rezultat){
    console.log("rezultat", rezultat.rows);
    var evenimente=[]
    var locatie=""; 
    request('https://secure.geobytes.com/GetCityDetails?key=7c756203dbb38590a66e01a5a3e1ad96&fqcn=109.99.96.15', //se inlocuieste cu req.ip; se testeaza doar pe Heroku
        function (error, response, body) {
        if(error) {console.error('error:', error)}
        else{
            var obiectLocatie=JSON.parse(body);
            //console.log(obiectLocatie);
            locatie=obiectLocatie.geobytescountry+" "+obiectLocatie.geobytesregion
            
        }
        res.render("Pagini/index", { ip: req.ip, imagini: anotimpuri(), cale: obImagini.cale_galerie, imagini_animate: get_imag_animate(), locatie:locatie, utiliz_online: rezultat.rows}); //calea e rel la folder views
    });
    }, function(err){console.log("eroare",err)});
    

});
*/
var lastday = function(y,m){
    return  new Date(y, m +1, 0).getDate();
}
app.get(["/","/index","/home"], function(req,res){
    var rezultat;
    client.query("select username, nume, prenume from utilizatori where id in (select distinct user_id from accesari where now() - data_accesare < interval '5 minutes' )").then(function(rezultat){
        console.log("rezultat", rezultat.rows);
        var evenimente=[]
        var locatie="";
        
        request('https://secure.geobytes.com/GetCityDetails?key=7c756203dbb38590a66e01a5a3e1ad96&fqcn=109.99.96.15', //se inlocuieste cu req.ip; se testeaza doar pe Heroku
            function (error, response, body) {
            if(error) {console.error('error:', error)}
            else{
                var obiectLocatie=JSON.parse(body);
                //console.log(obiectLocatie);
                locatie=obiectLocatie.geobytescountry+" "+obiectLocatie.geobytesregion
            }

            //generare evenimente random pentru calendar 
            
            var texteEvenimente=["Eveniment important", "Festivitate", "Prajituri gratis", "Zi cu soare", "Aniversare"];
            dataCurenta=new Date();

            primaZiLuna=new Date(dataCurenta.getFullYear(), dataCurenta.getMonth(), 1);
            nrZileLuna = lastday(dataCurenta.getFullYear(), dataCurenta.getMonth());
            ultimaZiLuna = new Date(dataCurenta.getFullYear(), dataCurenta.getMonth(), nrZileLuna);
            ultimaDuminica = [{data: new Date(dataCurenta.getFullYear(), dataCurenta.getMonth(), nrZileLuna - ultimaZiLuna.getDay() ),text: 'Reduceri finale'},{data: new Date(dataCurenta.getFullYear(), dataCurenta.getMonth(), nrZileLuna - ultimaZiLuna.getDay()-1 ),text: 'Reduceri finale'}]
            //if(primaZiLuna.getDay() == 6)
                //ziLuni = [{data: new Date(dataCurenta.getFullYear(), dataCurenta.getMonth(), 1 ),text: 'Primul produs gratis'}];
            for(i=0;i<3;i++){
                evenimente.push({data: new Date(dataCurenta.getFullYear(), dataCurenta.getMonth(), Math.ceil(Math.random()*27) ), text:texteEvenimente[i]});
            }
            //console.log(ziLuni)
            res.render("Pagini/index", { ip: req.ip, imagini: anotimpuri(), cale: obImagini.cale_galerie, imagini_animate: get_imag_animate(), locatie:locatie, utiliz_online: rezultat.rows, evenimente: evenimente, ip:getIp(req),  duminica: ultimaDuminica}); //calea e rel la folder views
            //res.render("pagini/index", {evenimente: evenimente, locatie:locatie,utiliz_online: rezultat.rows, ip:getIp(req),imagini:obImagini.imagini, cale:obImagini.cale_galerie, mesajLogin:req.session.mesajLogin});
            req.session.mesajLogin=null;
            
            });
            
        //res.render("pagini/index", {evenimente: evenimente, locatie:locatie,utiliz_online: rezultat.rows, ip:req.ip,imagini:obImagini.imagini, cale:obImagini.cale_galerie, mesajLogin:req.session.mesajLogin});
             
    }, function(err){console.log("eroare",err)});

   // res.render("pagini/index",{ip:req.ip, imagini:obImagini.imagini, cale:obImagini.cale_galerie});//calea relativa la folderul views
});

app.get("/despre", function(req, res) {
    console.log(req.ip); //afiseaza doar ce e dupa numele domneiului
    res.render("Pagini/despre", { ip: req.ip, imagini: anotimpuri(), cale: obImagini.cale_galerie}); //calea e rel la folder views
});

app.get("*/galerie_animata.css", function(req, res) {
    res.setHeader("Content-Type", "text/css");
    console.log(nr_imag_aleatoare_calculat);
    let sirScss = fs.readFileSync(path.join(__dirname, "Resurse", "Css", "galerie_animata.scss")).toString('utf-8');
    /*numere = [9, 12, 15]; //nr imagini  random*/
    /*let nrAleator = numere[Math.floor(Math.random()*numere.length)]; //generare random nr imag*/
    let rezScss = ejs.render(sirScss, { numar: nr_imag_aleatoare_calculat}); //atribui in scss un nr unde e <% .. %>
    fs.writeFileSync(path.join(__dirname, "temp", "galerie_animata.scss"), rezScss); //scriem fisierul obtinut din ejs render pt a fi luat de scss

    let cale_css = path.join(__dirname, "temp/galerie_animata.css");
    let cale_scss = path.join(__dirname, "temp/galerie_animata.scss");
    sass.render({ file: cale_scss, sourceMap: true }, function(err, rezCompilare) {
        if (err) {
            console.log(`eroare: ${err.message}`);
            res.end();
            return;
        }
        fs.writeFileSync(cale_css, rezCompilare.css, function(err) {
            if (err) { console.log(err); }
        });
        res.sendFile(cale_css);
    })
});

app.get("/inregistrare", function(req, res){
    res.render("Pagini/inregistrare"); 
});

parolaCriptare = "curs_tehnici_web";
app.post("/inreg", function(req, res){
    var formular = new formidable.IncomingForm(); //retunreaza un obiect prin care primesc date, iar ob are metode si evenimente asociate 
    var username;
    var caleImagine ='';
    formular.parse(req, function(err, campuriText, campuriFile){
        console.log(campuriText);

        //verificari campuri
        var eroare = "";
        if(campuriText.username.length == 0) //sa nu fie username sir vid
            eroare += "Username nu poate fi vid. ";
        if(campuriText.parola.length == 0) //sa nu fie parola sir vid
            eroare += "Parola nu poate fi vid. ";
        if(campuriText.nume.length == 0) //sa nu fie nume sir vid
            eroare += "Campul nume nu poate fi vid. ";
        if(campuriText.prenume.length == 0) //sa nu fie prenume sir vid
            eroare += "Campul prenume nu poate fi vid. ";
        if(campuriText.email.length == 0) //sa nu fie email sir vid
            eroare += "Campul email nu poate fi vid. ";
        
        //expresii regulate. TO DO DE VERIF TOATE PATTERN-URILE
        if(!campuriText.username.match("^[A-Za-z0-9]+$"))
            eroare += "Username-ul poate contine doar litere mici/mari si cifre. ";
        if(eroare == ""){
            //verif mare?!?!
            var queryUsernameUnic = `select * from utilizatori where username = $1::text`;
            client.query(queryUsernameUnic, [campuriText.username], function(err, rez){
                if(err){
                    res.render("Pagini/inregistrare", {err: "Eroare baza date"}); 
                    return;
                }
                if(rez.rows.length == 0){
                    var criptareParola = crypto.scryptSync(campuriText.parola, parolaCriptare, 32).toString('ascii');
                    var token2 = genereazaToken(100);
                    var data = new Date();
                    var token1 = '' + data.getFullYear() + data.getMonth() + data.getDay() + data.getHours() + data.getMinutes() + data.getSeconds();
                    var token = token1 + '/' + campuriText.username + '/' + token2;  
                    //parametrizare!!!
                    var queryUtiliz = `insert into utilizatori (username, nume, prenume, parola, email, culoare_chat, fotografie, cod) values
                        ($1::text, $2::text, $3::text, $4::text, $5::text, $6::text, $7::text, $8::text)`;
                    console.log(queryUtiliz);
                    client.query(queryUtiliz, [campuriText.username, campuriText.nume, campuriText.prenume, criptareParola, campuriText.email, 
                        campuriText.culoareText, caleImagine, token], function(err, rez){
                        console.log(err);
                        if(err){
                            res.render("Pagini/inregistrare", {err: "Eroare baza date"}); 
                        }
                        else{
                            trimiteMail(campuriText.username, campuriText.email, token1, token2);
                            res.render("Pagini/inregistrare", {err: "", raspuns: "date introduse cu succes"}); 
                        }
                    });
                }
                else{
                    eroare += "Username deja folosit. "
                    res.render("Pagini/inregistrare", {err: eroare}); 
                }
            });
        }
        else{
            res.render("Pagini/inregistrare", {err: eroare}); 
        }
    }); 
    formular.on("field", function(nume, val){
        //console.log('--->', nume, val);
        if(nume == 'username')
            username = val; 
    });
    //preluam nume fisier incarcat cu fileBegin
    formular.on("fileBegin", function(nume, fisier){
        console.log(nume, fisier); 
       //spunem unde sa salveze fisierul
       folderUtilizator = __dirname + "/poze_uploadate/" + username + '/';
       if(!fs.existsSync() && fisier.originalFilename){
           fs.mkdirSync(folderUtilizator);
           v = fisier.originalFilename.split('.');
           fisier.filepath = folderUtilizator + 'poza.' + v[v.length-1];
           console.log(fisier.filepath);
           caleImagine = "/poze_uploadate/" + username + '/' +'poza.' + v[v.length-1];
           //console.log('caleImag--->',caleImagine)
       }
    });
    formular.on("file", function(nume,fisier){
        //s-a terminat de uploadat
        //putem verif dim fisierului si sa dam restrictii
        //console.log('fisier uploadat');
    });
});

app.post('/sterge_poza', function(req, res){
    //se poate face cu formidable sau cu body parser dar merge folosit body parser pentru ca nu incarca imagini
    //1 stergere baza de date; 
    client.query("select fotografie from utilizatori where id = " + req.body.userId, function(err, rez){
        if(rez.rowCount != 0){
             //2 stergere fisier de pe disc
            fs.rmSync(__dirname + '/' + rez.rows[0].fotografie)
            client.query("update utilizatori set fotografie= '' where id="+ req.body.userId, function(err, rez){
                if(err){
                    console.log(err);
                }
            });
        }
    });

});

app.post("/login", function(req, res){
    var formular = new formidable.IncomingForm();
    formular.parse(req, function(err, campuriText, campuriFile){
        console.log(campuriText);
        var queryLogin = `select * from utilizatori where username = $1::text`;
        client.query(queryLogin, [campuriText.username],function(err, rez){
            if(err){ //eroare baza date nu neaparat de la user
                res.render("Pagini/403", {mesaj: "Eroare baza date. Incercati mai tarziu"}); 
                return ;
            }
            if(rez.rows.length != 1){ //daca ne returneaza mai multe linii sau nicio linie 
                //res.render("Pagini/403", {mesaj: "Username nu exista"}); 
                res.render("Pagini/index", { ip: req.ip, imagini: anotimpuri(), cale: obImagini.cale_galerie, imagini_animate: get_imag_animate(), mesajLogin: 'Login esuat'});
                return 
            }
            //daca afcem bonus cu salt diferit la fiecare user trebuie avut grija sa preluam salt din tabel HEX CRIPTARE!!!!
            var criptareParola = crypto.scryptSync(campuriText.parola, parolaCriptare, 32).toString('ascii');
            if(criptareParola == rez.rows[0].parola){
                if( !rez.rows[0].confirmat_mail){
                    res.render("Pagini/index", { ip: req.ip, imagini: anotimpuri(), cale: obImagini.cale_galerie, imagini_animate: get_imag_animate(), mesajLogin: 'Mail-ul nu a fost confirmat!'});
                    return
                }
                console.log("tot ok");
                //logam pe user
                if(req.session){
                    //daca am facut acel app use putem folosi pt toate request-urile
                    req.session.utilizator={
                        username: rez.rows[0].username,
                        nume: rez.rows[0].nume,
                        prenume: rez.rows[0].prenume,
                        culoare_chat: rez.rows[0].culoare_chat,
                        id: rez.rows[0].id,
                        email: rez.rows[0].email,
                        rol: rez.rows[0].rol,
                        data_adaugare: rez.rows[0].data_adaugare,
                        problema_vedere: rez.rows[0].problema_vedere
                    }
                }
                res.redirect("/index");
            }
            else{
                res.render("Pagini/index", { ip: req.ip, imagini: anotimpuri(), cale: obImagini.cale_galerie, imagini_animate: get_imag_animate(), mesajLogin: 'Login esuat'});
            }
        });
    });
});

app.get('/logout', function(req, res){
    req.session.destroy();
    res.locals.utilizator = null;
    //res.render("Pagini/index", { ip: req.ip, imagini: anotimpuri(), cale: obImagini.cale_galerie, imagini_animate: get_imag_animate()});
    //res.render("Pagini/index", { ip: req.ip, imagini: anotimpuri(), cale: obImagini.cale_galerie, imagini_animate: get_imag_animate(), utiliz_online: rezultat.rows, evenimente: evenimente, ip:getIp(req), luni: ziLuni, duminica: ultimaDuminica}); //calea e rel la folder views
    res.redirect("/index");
});

app.get('/useri', function(req, res){
    //verif si aici pt ca se poate duce sa scrie in bara de meniu /useri si vede 
    if(req.session && req.session.utilizator && req.session.utilizator.rol == 'admin'){
        client.query("select * from utilizatori", function(err, rezultat){
            if(err) throw err;
            //console.log(rezultat);
            res.render('Pagini/useri', {useri: rezultat.rows});
        });
    }
    else{
        res.status(403).render('Pagini/403', {mesaj: 'Nu aveti acces'});
    }
});

app.post("/sterge_utiliz",function(req, res){
	if( req.session && req.session.utilizator && req.session.utilizator.rol=="admin"  ){
	var formular= new formidable.IncomingForm()
	
	formular.parse(req, function(err, campuriText, campuriFisier){
        //13;-- ;-termina comanda fortat, -- pt comentariu
        //paramtreizare pentru protectie impotriva sql injection
        var comanda=`delete from utilizatori where id=$1 and rol !='admin'`;
		client.query(comanda, [campuriText.id_utiliz],  function(err, rez){
			// TO DO mesaj cu stergerea
            if(err)
                console.log(err);
            else{
                if (rez.rowCount>0){
                    console.log("sters cu succes");
                }
                else{
                    console.log("stergere esuata");
                }
            }
		});
	});
	}
	res.redirect("/useri");
	
});

app.post("/profil", function(req, res){
    console.log("profil");
    var username;
    if (!req.session.utilizator){
        res.render("Pagini/403",{mesaj:"Nu sunteti logat."});
        return;
    }
    var formular= new formidable.IncomingForm();

    formular.parse(req,function(err, campuriText, campuriFile){
        console.log(err);
        console.log(campuriText);
        var criptareParola=crypto.scryptSync(campuriText.parola,parolaCriptare,32).toString('ascii'); 
        var criptareParolaNoua=crypto.scryptSync(campuriText.rparola,parolaCriptare,32).toString('ascii'); 
        
        //toti parametrii sunt cu ::text in query-ul parametrizat fiindca sunt stringuri (character varying) in tabel
        var queryUpdate=`update utilizatori set nume=$1::text, prenume=$2::text, email=$3::text, culoare_chat=$4::text, parola=$7::text where username= $5::text and parola=$6::text `;
        console.log(campuriText.rparola);
        console.log('criptare', criptareParolaNoua);
        client.query(queryUpdate, [campuriText.nume, campuriText.prenume, campuriText.email, campuriText.culoareText, req.session.utilizator.username, criptareParola, criptareParolaNoua], function(err, rez){
            if(err){
                console.log(err);
                res.render("Pagini/403",{mesaj:"Eroare baza date. Incercati mai tarziu."});
                return;
            }
            console.log(rez.rowCount);
            if (rez.rowCount==0){
                res.render("Pagini/profil",{mesaj:"Update-ul nu s-a realizat. Verificati parola introdusa."});
                return;
            }
            
            req.session.utilizator.nume=campuriText.nume;
            req.session.utilizator.prenume=campuriText.prenume;
            
            req.session.utilizator.culoare_chat=campuriText.culoareText;
            req.session.utilizator.email=campuriText.email;

            res.render("Pagini/profil",{mesaj:"Update-ul s-a realizat cu succes."});

        });
    });
    formular.on("field", function(nume, val){
        //console.log('--->', nume, val);
        if(nume == 'username')
            username = val; 
    });
    //preluam nume fisier incarcat cu fileBegin
    formular.on("fileBegin", function(nume, fisier){
        //console.log(nume, fisier); 
       //spunem unde sa salveze fisierul
       folderUtilizator = __dirname + "/poze_uploadate/" + username + '/';
       if(!fs.existsSync() && fisier.originalFilename){
           fs.mkdirSync(folderUtilizator);
           
       }
       v = fisier.originalFilename.split('.');
        fisier.filepath = folderUtilizator + 'poza.' + v[v.length-1];
           console.log(fisier.filepath);
           caleImagine = "/poze_uploadate/" + username + '/' +'poza.' + v[v.length-1];
           console.log('caleImag--->',caleImagine)
    });
});



app.post("/produse_cos",function(req, res){
    
	//console.log("req.body: ",req.body);
    //console.log(req.get("Content-type"));
    //console.log("body: ",req.get("body"));

    /* prelucrare pentru a avea toate id-urile numerice si pentru a le elimina pe cele care nu sunt numerice */
    var iduri=[]
    for (let elem of req.body.ids_prod){
        let num=parseInt(elem);
        if (!isNaN(num))//daca este numar
            iduri.push(num);
    }
    if (iduri.length==0){
        res.send("eroare");
        return;
    }

    //console.log("select id, nume, pret, gramaj, calorii, categorie, imagine from prajituri where id in ("+iduri+")");
    client.query("select id, nume, descriere,imagine,pret,timp_garantie, culoare from produse where id in ("+iduri+")", function(err,rez){
        //console.log(err, rez);
        //console.log(rez.rows);
        res.send(rez.rows);
    });    
});

app.post("/cumpara",function(req, res){
    if(!req.session.utilizator){
        res.write("Nu puteti cumpara daca nu sunteti logat!");res.end();
        return;
    }
    var iduri = []
    var cant = []
    for(let p of req.body.ids_prod){
        iduri.push(p[0]);
        cant.push(p[1]);
    }
    client.query("select id, nume, descriere, imagine, pret, timp_garantie, categ_mica, culoare from produse where id in ("+iduri+")", function(err,rez){
        
        let rezFactura=ejs.render(fs.readFileSync("views/Pagini/factura.ejs").toString("utf8"),{utilizator:req.session.utilizator,produse:rez.rows, protocol:protocol, domeniu:numeDomeniu, cantitate:req.body.ids_prod});
        //console.log(rezFactura);
        let options = { format: 'A4'};

        let file = { content: rezFactura };

        html_to_pdf.generatePdf(file, options).then(function(pdf) {
            
            var numefis="./temp/test"+(new Date()).getTime()+".pdf";
            fs.writeFileSync(numefis,pdf);
            trimitefactura(req.session.utilizator.username, req.session.utilizator.email, numefis);
            res.write("Totu bine!");res.end();
        });
    });
});


app.get("*/galerie_animata.css.map", function(req, res) {
    res.sendFile(path.join(__dirname, "temp", "galerie-animata.css.map"));
});

///////////////////////////////////////////////////////////////////////////////////////////////
//////////////// Contact
caleXMLMesaje="Resurse/xml/contact.xml";
headerXML=`<?xml version="1.0" encoding="utf-8"?>`;
function creeazaXMlContactDacaNuExista(){
    if (!fs.existsSync(caleXMLMesaje)){ //daca nu exista xml ul
        let initXML={ //il initializam cu antetul si tag ul radacina
            "declaration":{
                "attributes":{
                    "version": "1.0",
                    "encoding": "utf-8"
                }
            },
            "elements": [ //declaram tag-ul radacina contact
                {
                    "type": "element", 
                    "name":"contact", //numele contact
                    "elements": [ //vectorul de tag uri interioare lui contact 
                        { //fii lui contact
                            "type": "element",
                            "name":"mesaje", //tag ul mesaje
                            "elements":[]    //vectorul de elemente mesaj din mesaje                 
                        }
                    ]
                }
            ]
        }
        let sirXml  =xmljs.js2xml(initXML,{compact:false, spaces:4}); //transforma obiectul initXML intr-un sir xml ca va contine intial doar tag contact si fiul tag mesaje
        //console.log(sirXml);
        fs.writeFileSync(caleXMLMesaje,sirXml);
        return false; //l-a creat
    }
    return true; //nu l-a creat acum
}


function parseazaMesaje(){
    let existaInainte=creeazaXMlContactDacaNuExista();
    let mesajeXml=[];
    let obJson;
    if (existaInainte){ //daca exista fisierul xml
        let sirXML=fs.readFileSync(caleXMLMesaje, 'utf8'); //citeste fisierul de la caleXMLMesaje, iar sirXML va fi un string
        obJson=xmljs.xml2js(sirXML,{compact:false, spaces:4});//transformam sirulXML intr-un obiect json
        

        let elementMesaje=obJson.elements[0].elements.find(function(el){ //din tagul contact cautam tagul mesaje
                return el.name=="mesaje"
            });
        let vectElementeMesaj=elementMesaje.elements?elementMesaje.elements:[]; //verific daca tagul mesaje este vid si daca nu pun eleme
        console.log("Mesaje: ",obJson.elements[0].elements.find(function(el){
            return el.name=="mesaje"
        }))
        let mesajeXml=vectElementeMesaj.filter(function(el){return el.name=="mesaj"});
        return [obJson, elementMesaje,mesajeXml];
    }
    return [obJson,[],[]];
}


app.get("/contact", function(req, res){
    let obJson, elementMesaje, mesajeXml;
    [obJson, elementMesaje, mesajeXml] =parseazaMesaje();

    res.render("Pagini/contact",{mesaje:mesajeXml})
});

app.post("/contact", function(req, res){ //cand dau click pe submit formular
    let obJson, elementMesaje, mesajeXml;
    [obJson, elementMesaje, mesajeXml] =parseazaMesaje(); //trimit vect de mesaje
        
    let u= req.session.utilizator?req.session.utilizator.username:"anonim"; //verif daca utilizatorul este logat
    let rols = req.session.utilizator.rol;
    let mesajNou={ //creare tag mesaj dar obiect
        type:"element", 
        name:"mesaj", 
        attributes:{
            username:u, 
            data:new Date(),
            rol: rols
        },
        elements:[{type:"text", "text":req.body.mesaj}] //continut tag cumva inner
    };
    if(elementMesaje.elements)
        elementMesaje.elements.push(mesajNou); //adaugam la final mesajul nou creat
    else 
        elementMesaje.elements=[mesajNou];
    console.log(elementMesaje.elements);
    let sirXml=xmljs.js2xml(obJson,{compact:false, spaces:4}); //transform obiectul in sir xml; compact false pune tot pe rand, iar spaces pt fomatare
    console.log("XML: ",sirXml);
    fs.writeFileSync("Resurse/xml/contact.xml",sirXml); //il pun in fisierul contact.xml
    
    res.render("Pagini/contact",{  mesaje:elementMesaje.elements})
});

app.get("/chat", function(req,res){
    if( req.session && req.session.utilizator ){
    console.log(req.ip)
    console.log(s_port)
    res.render("Pagini/chat",{port:s_port,utilizator:req.session.utilizator});
    //res.sendFile(__dirname+"/pagini/chat");
    }
    else{
        res.status(403).render('Pagini/403',{mesaj:"Nu aveti acces"});
    }
});

app.get("/*.ejs", function(req, res) {
    res.status(403).render("Pagini/403");
});

app.get("/*", function(req, res) {
    res.render("Pagini" + req.url, function(err, rezultatRender) {
        if (err) {
            console.log(err);
            if (err.message.includes("Failed to lookup")) {
                res.status(404).render("Pagini/404");
                return;
            } else {
                res.render("Pagini/403", { errMsg: err.message, errCode: err.code});
                return;
            }
        }
        res.send(rezultatRender);
    });
});

var s_port = process.env.PORT || 8080
server.listen(s_port);

console.log("server-ul a pornit");