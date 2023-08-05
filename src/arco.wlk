import wollok.game.*
import visuales.*
import juego.*

object izquierda{
	method position() = game.at(2,4)
	method image() = "assets/arco.png"
	
	method colision(){
		contadorDeGoles.sumarGol()
		game.addVisual(gol)
		game.schedule(250,{=> juego.reiniciar()})
	}
}

object medio{
	method position() = game.at(3,4)
	method image() = "assets/arco.png"
	
	method colision(){
		contadorDeGoles.sumarGol()
		game.addVisual(gol)
		game.schedule(250,{=> juego.reiniciar()})
	}
}

object derecha{
	method position() = game.at(4,4)
	method image() = "assets/arco.png"
	
	method colision(){
		contadorDeGoles.sumarGol()
		game.addVisual(gol)
		game.schedule(250,{=> juego.reiniciar()})
	}
}