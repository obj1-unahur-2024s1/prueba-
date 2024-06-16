import movimientos.*
import tanque.*
import configuraciones.*
import wollok.game.*

class ElementosVisuales {
	
	var property position   
	var property direccion = "norte"
	var property image =  self.direccion() 
	
	method image()
	
	method positionX() = self.position().x()
	method positionY() = self.position().y()
	
	method mirarDestino(destino) { direccion = destino}
	
	method arriba(){
		
		position = self.position().up(1)
	} 
	
	method abajo(){
		
		position = self.position().down([1,2,3].anyOne())
	}
	
	method derecha(){
		
		position = self.position().right([1,2,3].anyOne())
	}
	
	method izquierda(){
		
		position = self.position().left([1,2,3].anyOne())
	}
	
	method secuenciaMovimiento(personaje)
	method idTick()
	method movimiento()
	method detener(){
		
		game.removeTickEvent(self.idTick())
		game.removeVisual(self)
	}
			
}

class Bala inherits ElementosVisuales{
	 
override method image() {return "bala.png"}
	  
override method idTick() = "disparo"

override method movimiento(){ 
	
	    
     	if(self.direccion() == "norte") self.arriba()
		else
		if(self.direccion() == "sur") self.abajo()
		else
		if(self.direccion() == "este") self.derecha()
		else
		self.izquierda()
		}
	
      
override method secuenciaMovimiento(personaje) {
		
		self.mirarDestino(personaje.direccion())
		game.addVisual(self)
		//game.onCollideDo(self,{algo=>algo.impacto()
			//self.detener()
		//})
		game.onTick(500,self.idTick(),{self.movimiento()})
		} 

method impacto() { self.image("impacto.png")}     
	
    override method detener(){
		if(self.position() == game.at(self.positionX(),game.height()-3)
		or
		self.position() == game.at(self.positionX(),0)
		or
		self.position() == game.at(game.width()-1,self.positionY())
		or
		self.position() == game.at(0,self.positionY()) )
		
		self.impacto()
		
		game.removeTickEvent(self.idTick())
		game.removeVisual(self)
		}
}

class Tanques inherits ElementosVisuales{
	
	var property blindaje = "clasico"
	
}

class Obstaculos inherits ElementosVisuales{
	
	var property material = "ladrillo"
	
}

