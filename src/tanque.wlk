import wollok.game.*
import movimientos.*
import clases.*


object tanque {
	
	var property position = game.origin()
	var property direccion = "norte" 
	var property image = self.direccion()
	var property vida = "3vidas"
	var property score = 0
	const movimiento = new MovimientoTanque()
	
	method image() { return "tanque" + self.direccion() + ".png"}
	
	method positionX() = self.position().x()
	method positionY() = self.position().y()
	
	
	method mirarDestino(destino) { direccion = destino} 
	
	method moverArriba() {if (self.positionY() < 13)
		movimiento.arriba(self) 
		else self.position() }
	
	method moverAbajo() { if (self.positionY()!= 0)
		movimiento.abajo(self)
		else self.position() }
	
	method moverDerecha() { if(self.positionX()< game.width()-1)
		movimiento.derecha(self)
		else self.position(game.at(0,self.positionY()))	}
	
	method moverIzquierda() { if(self.positionX()>0)
		movimiento.izquierda(self)
		else self.position(game.at(game.width()-1,self.positionY()))}


    method disparar() {
    	var bala = new Bala(position = self.position())
    	bala.secuenciaMovimiento(self)
    	bala.detener()
   	
    }
}
