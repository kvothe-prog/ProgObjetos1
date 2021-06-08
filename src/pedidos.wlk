import dependencias.*
import rodados.*

class Pedido{
	const property distancia
	var property tiempoMaximo
	const property pasajeros
	const property coloresIncompatibles = []
	
	method velocidadRequerida() = distancia / tiempoMaximo
	method puedeRealizarlo(auto) {
		return auto.velocidadMaxima() > self.velocidadRequerida() + 10 and auto.capacidad() >= pasajeros and coloresIncompatibles.all({ c => c != auto.color() })
	}
	method acelerar() { tiempoMaximo = tiempoMaximo - 1 }
	method relajar() { tiempoMaximo = tiempoMaximo + 1 }
	
}