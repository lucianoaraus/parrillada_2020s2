
class Comida {
	
	method peso()
	method valoracion()
	method esAptoVegetariano()	
	method esAbundante() = self.peso() > 250 
}

class Provoleta inherits Comida {
	var property peso
	var property tieneEspecias = true

	override method esAptoVegetariano(){
		return not tieneEspecias
	}
	method esEspecial(){
		return self.esAbundante()
		or self.tieneEspecias()
	}
	override method valoracion(){
		return if(self.esEspecial()){ 120 }
		else{ 80 }
	}
}

class HamburguesaDeCarne inherits Comida {
	var property pan
	
	override method peso() = 250
	override method esAptoVegetariano() = false
	override method valoracion(){
		return 60 + pan.valoracion()
	}
}

class HamburguesaVeggie inherits HamburguesaDeCarne {
	var property tipoLegumbre
	
	override method esAptoVegetariano() = true
	override method valoracion(){
		return super() + (tipoLegumbre.size() * 2).min(17)
	}
}

class Parrillada inherits Comida {
	var property cortesDeCarne = []
	
	override method peso() = cortesDeCarne.sum( { c => c.peso() } )
	override method esAptoVegetariano() = false
	override method valoracion(){
		return (( 15 * cortesDeCarne.max( { c => c.calidad() } ).calidad() ) - cortesDeCarne.size()).max(0)
	}
}

//PANES
object panIndustrial {
	method valoracion() = 0
}

object panCasero {
	method valoracion() = 20
}

object panMasaMadre {
	method valoracion() = 45
}


class CorteDeCarne {
	var property nombreDelCorte
	var property calidad
	var property peso
}