import wollok.game.*

object juego{
	var enJuego = true
	method iniciar(){
		self.visuales()
		game.start()	
		self.colisiones()
		self.control()
	}
	
	method visuales(){
		game.title("Juegos Penales")
		game.width(7)
		game.height(7)
		game.boardGround("assets/fondo.png")
		game.cellSize(60)
		game.addVisual(arquero)
		game.addVisualCharacter(pelota)
		game.addVisual(izquierda)
		game.addVisual(contadorDeGoles)
	}
	
	method control(){
	 if (enJuego){
		keyboard.num(1).onPressDo{pelota.moverIzquierda()}
	 }
	   
	}
	
	
	
	method colisiones(){
		game.onCollideDo(pelota, { elemento => pelota.colisionaCon(elemento) })
	}
	
	method finDeJuego(){
		enJuego = false
	}
	
}

object contadorDeGoles{
	var cantidad = 0
	
	method position() = game.at(1,0)
	 
	method text() = "GOLES: " + cantidad.toString()
	
	method sumarGol(){
		cantidad += 1
	}
}

object pelota{
	var property position = game.at(3,1)
	
	method image() = "assets/pelota.png"
	
	method colisionaCon(otroElemento){
		otroElemento.colision()
	}
	
	method moverIzquierda(){
		position = game.at(4,11)
	}
	
	method reiniciar(){
		position = game.at(7,2)
	}
}

object arquero{
	var property position = game.at(7,9)
	
	method image() = "assets/arquero.png"
	
	method colision(){
		game.addVisual(finDeJuego)
		pelota.reiniciar()
		
	}
}

object finDeJuego{
 	method position() = game.at(7,7)
 	method text() = "GAME OVER"
}

object izquierda{
	method position() = game.at(4,11)
	method image() = "assets/arco.png"
	
	method colision(){
		contadorDeGoles.sumarGol()
		game.schedule(250,{=> pelota.reiniciar()})
	}
}

object medio{
	method position() = game.at(7,9)
	method image() = "assets/arco.png"
	
	method colision(){
		contadorDeGoles.sumarGol()
		game.schedule(250,{=> pelota.reiniciar()})
	}
}

object derecha{
	method position() = game.at(7,9)
	method image() = "assets/arco.png"
	
	method colision(){
		contadorDeGoles.sumarGol()
		game.schedule(250,{=> pelota.reiniciar()})
	}
}