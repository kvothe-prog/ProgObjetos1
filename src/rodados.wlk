import dependencias.*
import pedidos.*
import wollok.game.*

class Corsa {
	var property color = amarillo
	var position = game.at(0,0)
	var property image = color.image()
	const estuvoEn = [[0,0]]
	
	method position(ejeX, ejeY) {
		position = game.at(ejeX, ejeY)
		estuvoEn.add([ejeX,ejeY])
	}
	method position() = position
	method pasoPor(posicion) = estuvoEn.any({ p => p == posicion})
	method pasoPorFila(numero) = estuvoEn.any({ p => p.last() == numero })
	method recorrioFilas(lista_de_numeros) = lista_de_numeros.all({ n => self.pasoPorFila(n) })
	
	method moveteDerecha(){
		self.position(estuvoEn.last().first()+1, estuvoEn.last().last())
	}
	method moveteIzquierda(){
		self.position(estuvoEn.last().first()-1, estuvoEn.last().last())
	}
	method moveteArriba(){
		self.position(estuvoEn.last().first(), estuvoEn.last().last()+1)
	}
	method moveteAbajo(){
		self.position(estuvoEn.last().first(), estuvoEn.last().last()-1)
	}
	method color(colorNuevo){
		color = colorNuevo
	}
	method cambiaAmarillo(){
		self.color(amarillo)
	}
	method cambiaRojo(){
		self.color(rojo)
	}
	method cambiaVerde(){
		self.color(verde)
	}
	method image(){
		return color.image()
	}
	method anteriorPosicion(){
		return estuvoEn.get(estuvoEn.size() -2)
	}
	
	method capacidad() = 4
	method velocidadMaxima() = 150
	method peso() = 1300
}

object rojo {
	method image() { return "autitorojo.png" }
}
object amarillo {
	method image() { return "autitoAmarillo.png" }
}
object verde {
	method image() { return "autitoVerde.png" }
}

class Kwid {
	const property tanqueAdicional
	
	method capacidad() { return if (tanqueAdicional) {3} else {4} }
	method velocidadMaxima() { return if (tanqueAdicional){120} else {110} }
	method peso() {return if(tanqueAdicional) {1350} else{1200} }
	method color() = "Azul"
}

object trafic {
	var property motor
	var property interior
	
	method asignarMotor(unMotor) { motor = unMotor}
	method asignarInterior(unInterior) {interior = unInterior}
	method capacidad() = interior.capacidad()
	method velocidadMaxima() = motor.velocidadMaxima()
	method peso() = 4000 + interior.peso() + motor.peso()
	method color() = "Blanco"
}

object comodo{
	method peso() = 700
	method capacidad() = 5
}

object popular{
	method peso() = 1000
	method capacidad() = 12
}

object pulenta{
	method peso() = 800
	method velocidadMaxima() = 130
}

object bataton {
	method peso() = 500
	method velocidadMaxima() = 80
}

class AutoEspecial {
	const property peso
	const property capacidad
	const property velocidadMaxima
	const property color
}

//este objeto es para el game

class Pared {
	var resistencia = 10
	const property image = "pared.png"
	
	method resistencia() = resistencia
	method autoChoco() { resistencia = resistencia - 1}
	method image(){
		return if(resistencia.between(7,10)){
			"pared.png"
		}
		else if (resistencia.between(4,7)){
			"pared2.png"
		}
		else if (resistencia.between(1,4)){
			"pared3.png"
		}
		else{
			"fondo.png"
		}
	}
}
