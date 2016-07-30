function Init() {
	 document.getElementById("jogador_2").style.opacity = .3;
	 document.getElementById("jogador_1").style.opacity = 1;
	 Fim = !1.;
	 jogador_da_vez = 1;
    for (i = 0; i < 15; i++)
    for (j = 0; j < 15; j++) 
    	document.images[TamanhoDoTabuleiro * i + j].src = ImgTabu[0].src
}
function Selecionado(i, j) {
    0 == Fim && document.images[TamanhoDoTabuleiro * i + j].src == ImgTabu[0].src && 
    (1 == jogador_da_vez ? (document.images[TamanhoDoTabuleiro * i + j].src = ImgTabu[1].src, document.getElementById("jogador_1").style.opacity = .3, document.getElementById("jogador_2").style.opacity = 1) : (document.images[TamanhoDoTabuleiro * i + j].src = ImgTabu[2].src, document.getElementById("jogador_2").style.opacity = .3, document.getElementById("jogador_1").style.opacity = 1), Fim = verifica_ganhador(jogador_da_vez), Fim && (document.getElementById("win").innerHTML = '<img src="' + ImgTabu[jogador_da_vez].src + '" />&nbsp;venceu!', document.getElementById("caixaVenceu").style.display = "block"), jogador_da_vez = 1 == jogador_da_vez ? 2 : 1)
}
function verifica_ganhador(jogador) {
    for (i = 0; i < 15; i++) 
    	for (j = 0; j < 15; j++) 
    		if (document.images[TamanhoDoTabuleiro * i + j].src == ImgTabu[jogador].src) {
		        if (j + 4 < 15 && document.images[TamanhoDoTabuleiro * i + j + 1].src == ImgTabu[jogador].src && document.images[TamanhoDoTabuleiro * i + j + 2].src == ImgTabu[jogador].src && document.images[TamanhoDoTabuleiro * i + j + 3].src == ImgTabu[jogador].src && document.images[TamanhoDoTabuleiro * i + j + 4].src == ImgTabu[jogador].src) 
		        	return console.log("Jogador " + jogador + " venceu primeiroo if!"), !0;
		        if (i + 4 < 15 && document.images[TamanhoDoTabuleiro * (i + 1) + j].src == ImgTabu[jogador].src && document.images[TamanhoDoTabuleiro * (i + 2) + j].src == ImgTabu[jogador].src && document.images[TamanhoDoTabuleiro * (i + 3) + j].src == ImgTabu[jogador].src && document.images[TamanhoDoTabuleiro * (i + 4) + j].src == ImgTabu[jogador].src) 
		        	return console.log("Jogador " + jogador + " venceu segundo if!"), !0;
		        if (j + 4 < 15 && i + 4 < 15 && document.images[TamanhoDoTabuleiro * (i + 1) + j + 1].src == ImgTabu[jogador].src && document.images[TamanhoDoTabuleiro * (i + 2) + j + 2].src == ImgTabu[jogador].src && document.images[TamanhoDoTabuleiro * (i + 3) + j + 3].src == ImgTabu[jogador].src && document.images[TamanhoDoTabuleiro * (i + 4) + j + 4].src == ImgTabu[jogador].src) 
		        	return console.log("Jogador " + jogador + " venceu terceiro if!"), !0;
		        if (j - 4 >= 0 && i + 4 < 15 && document.images[TamanhoDoTabuleiro * (i + 1) + j - 1].src == ImgTabu[jogador].src && document.images[TamanhoDoTabuleiro * (i + 2) + j - 2].src == ImgTabu[jogador].src && document.images[TamanhoDoTabuleiro * (i + 3) + j - 3].src == ImgTabu[jogador].src && document.images[TamanhoDoTabuleiro * (i + 4) + j - 4].src == ImgTabu[jogador].src) 
		        	return console.log("Jogador " + jogador + " venceu quarto if!"), !0
    }
    return !1
}
var Fim, jogador_da_vez, TamanhoDoTabuleiro = 15;
ImgTabu = new Array(3), ImgTabu[0] = new Image, ImgTabu[0].src = "tabu.gif", ImgTabu[1] = new Image, ImgTabu[1].src = "1.gif", ImgTabu[2] = new Image, ImgTabu[2].src = "2.gif", window.onload = function () {
    Init()
}, document.getElementById("iniciar").onclick = function () {
    Init()
};