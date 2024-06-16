import tanque.*
import wollok.game.*
import movimientos.*
import clases.*

object configuracion {
			
		method teclado(){
		keyboard.space().onPressDo { tanque.disparar() }	
		keyboard.up().onPressDo {tanque.moverArriba()}
		keyboard.down().onPressDo {tanque.moverAbajo()}
		keyboard.right().onPressDo {tanque.moverDerecha()}
		keyboard.left().onPressDo {tanque.moverIzquierda()}
	}
	
}
