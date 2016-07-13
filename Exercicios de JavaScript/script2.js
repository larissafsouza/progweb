botao = document.getElementById("Desenhe");
botao.onclick = function () {
	var barra1 = document.myform.altura1.value;
	var barra2 = document.myform.altura2.value;
	var barra3 = document.myform.altura3.value;
	var barra4 = document.myform.altura4.value;
	var barra5 = document.myform.altura5.value;

	var todas = document.myform.largura.value;
	document.myform.imagem1.height = barra1;
	document.myform.imagem2.height = barra2;
	document.myform.imagem3.height = barra3;
	document.myform.imagem4.height = barra4;
	document.myform.imagem5.height = barra5;

	document.myform.imagem1.width = todas;
	document.myform.imagem2.width = todas;
	document.myform.imagem3.width = todas;
	document.myform.imagem4.width = todas;
		document.myform.imagem5.width = todas;


}