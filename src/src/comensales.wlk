import comidas.*

class Comensal {
	var property comidasIngeridas = []
	var property peso = 0
	
	method leAgrada(unaComida)
	method satisfecho(){
		return comidasIngeridas.sum( { c => c.peso() } ) >= peso * 0.01
	}
	method comer(unaComida){
		comidasIngeridas.add(unaComida)
	}
}

class Vegetariano inherits Comensal {
	
	override method leAgrada(unaComida){
		return unaComida.esAptoVegetariano()
		and unaComida.valoracion() > 85
	}
	override method satisfecho(){
		return super() and not comidasIngeridas.all( { c => c.esAbundante() } )
	}
}

class HambrePopular inherits Comensal {
	
	override method leAgrada(unaComida){
		return unaComida.esAbundante()
	}
}

class PaladarFino inherits Comensal {
	
	override method leAgrada(unaComida){
		return unaComida.peso().between(150, 300)
		and unaComida.valoracion() > 100
	}
	override method satisfecho(){
		return super() and comidasIngeridas.size().even()
	}
}