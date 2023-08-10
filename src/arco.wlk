import wollok.game.*
import personajes.*
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

object gol{
	method position() = game.at(3,4)
	method text() = "GOOOOOL"
	method textColor() = "#ca1e11e8"
}

object contadorDeGoles{
	var cantidad = 0
	
	method position() = game.at(3,6)
	 
	method text() = "GOLES: " + cantidad.toString()
		
	method sumarGol(){
		cantidad += 1
	}
	
	method reiniciar(){
		cantidad = 0
	}
}

object finDeJuego{
 	method position() = game.at(3,4)
 	method text() = "GAME OVER"
 	method textColor() = "#ca1e11e8"
}
