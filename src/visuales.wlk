import wollok.game.*
import juego.*


object pelota{
	var property puedePatear = true
	var property position = game.at(3,1)
	
	method image() = "assets/pelota.png"
	
	method control(){	
		keyboard.num(1).onPressDo{self.izquierda()}
		keyboard.num(2).onPressDo{self.medio()}
		keyboard.num(3).onPressDo{self.derecha()}
	}
	
	method colisionaCon(otroElemento){
		game.removeTickEvent("mover")
		otroElemento.colision()
	}
	
	method izquierda(){
		if (puedePatear){
		puedePatear = false
		arquero.mover()
		position = game.at(2,2)
		game.schedule(100,{=> self.mover()})
		}
	}
	
	
	method medio(){
	  if (puedePatear){
		puedePatear = false
		arquero.mover()
		position = game.at(3,2)
		game.schedule(50,{=> self.mover()})
		}
	}
	
	method derecha(){
		if (puedePatear) {
		puedePatear = false
		arquero.mover()
		position = game.at(4,2)
		game.schedule(50,{=> self.mover()})
	   }
	}

method mover(){
		game.onTick(50,"mover",{=> position = position.up(1)})
	}
		
	method reiniciar(){
		position = game.at(3,1)
		puedePatear = true
	}
	
}

object arquero{
	var property position = game.at(3,3)
	
	method image() = "assets/arquero.png"
	
	method colision(){
		keyboard.space().onPressDo{juego.resetear()}
		game.addVisual(finDeJuego)
	}
	
	method mover(){
		position = position.right((-1).randomUpTo(2))
	}
	
	method reiniciar(){
		position = game.at(3,3)
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



