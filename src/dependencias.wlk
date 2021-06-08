import rodados.*
import pedidos.*

class Dependencia {
	const property flota = []
	var property empleados
	
	const property pedidos = []
	
	method agregarAFlota(rodado) { flota.add(rodado) }
	method quitarDeFlota(rodado) { flota.remove(rodado) }
	method pesoTotalFlota() = flota.sum({ r => r.peso() })
	method estaBienEquipada() = flota.size() > 2 and flota.all({ r => r.velocidadMaxima() > 99 })
	method capacidadTotalEnColor(color) = flota.filter({ r => r.color() == color }).sum({ r => r.capacidad() })
	method colorDelRodadoMasRapido() = flota.max({ r => r.velocidadMaxima() }).color()
	method capacidadFaltante() = 0.max( empleados - flota.sum({ r => r.capacidad() }) )
	method esGrande() = flota.size() > 4 and empleados > 39
	
	method agregarPedido(pedido) { pedidos.add(pedido) }
	method quitarPedido(pedido) { pedidos.remove(pedido) }
	method totalPasajerosEnPedidos() = pedidos.sum({ p => p.pasajeros() })
	method pedidoImposible() = pedidos.filter({ p => flota.all({ f => not p.puedeRealizarlo(f)}) })
	method esColorFeo(color) = pedidos.map({ p => p.coloresIncompatibles() }).all({ c => c.contains(color) })
	
}