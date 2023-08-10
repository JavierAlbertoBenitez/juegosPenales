import wollok.game.*
import arco.*
import personajes.*


object juego{
	method iniciar(){
		self.visuales()
		self.colisiones()
		pelota.control()
		game.start()	
	}
	
	method visuales(){
		game.title("Juegos Penales")
		game.width(7)
		game.height(7)
		game.boardGround("assets/fondo.png")
		game.cellSize(60)
		game.addVisual(arquero)
		game.addVisual(pelota)
		game.addVisual(izquierda)
		game.addVisual(medio)
		game.addVisual(derecha)
		game.addVisual(contadorDeGoles)
	}
	
	
	
	method colisiones(){
		game.onCollideDo(pelota, { elemento => pelota.colisionaCon(elemento) })
	}
	

	
	method reiniciar(){
		arquero.reiniciar()
		pelota.reiniciar()
		game.schedule(50,{game.removeVisual(gol)})
	}
	
	method resetear(){
	 if (!pelota.puedePatear()){
		game.removeVisual(finDeJuego)
		contadorDeGoles.reiniciar()
		arquero.reiniciar()
		pelota.reiniciar()
	 }
	}
		
}

