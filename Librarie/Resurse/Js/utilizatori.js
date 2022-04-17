window.addEventListener("load", function(){
    vect_butoane = document.getElementsByClassName('sterge-poza');
  
});
  function stergePoza(userId){
    var imag = document.getElementById('poza-'+userId);
    imag.remove();
    fetch("/sterge_poza", {		//se scrie in app post
		method: "POST",
		headers:{'Content-Type': 'application/json'}, 
			
		mode: 'cors',		
		cache: 'default',
		body: JSON.stringify({ //req.body o sa aiba campul userId
            userId: userId //in param userId din json am pus param userId din sterge poza
		})
	})
	.then(function(rasp){ console.log(rasp); x=rasp.json(); console.log(x); return x})
	}
