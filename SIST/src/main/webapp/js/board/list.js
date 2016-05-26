var pagina = 1;
var nopaginas = 0;
var min = 0;
var max = 0;

function paginar() {
	var tbody = document.getElementById("tbody");
	var Ttr = tbody.getElementsByTagName("tr");
	var cont = 0;
	var paginas = document.getElementById("paginas");
	for (i = 0; i < Ttr.length; i++) {
		cont++;
	}
	nopaginas = Math.ceil(cont / 15);
	if (nopaginas > 1) {
		paginas.innerHTML = 'Pagina <input id="pagns" name="pagns" type="text" value="1" style="width:1em; display:inline-block;">/'
				+ nopaginas;
		var psig = document.getElementById("psig");
		psig.style = "display: inline-block;";
	}
	min = 1;
	max = min + 14;
}

function paginacion(p) {
	var d = document.getElementsByName("pagns")[0];
	var tbody = document.getElementById("tbody");
	var Ttr = tbody.getElementsByTagName("tr");
	if (pagina < nopaginas) {
		if (p == "15") {
			pagina = pagina + 1;
			d.value = pagina;
			min = min + 15;
			max = max + 15;
		}
	}
	if (pagina > 1) {
		if (p == "-15") {
			pagina = pagina - 1;
			d.value = pagina;
			min = min - 15;
			max = max - 15;
		}
	}
	for (i = 0; i < Ttr.length; i++) {
		if (Ttr[i].id >= min && Ttr[i].id <= max) {
			Ttr[i].removeAttribute("style");
		} else {
			Ttr[i].setAttribute("style", "display:none");
		}
	}
}
paginar();

function insert_do(){
	sendMessage("POST", "insert.do", null, mytraindo)
}

function mytraindo(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			$('.main_body').html(httpRequest.responseText);
		}
	}
}