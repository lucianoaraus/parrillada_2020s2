import comidas.*
import comensales.*

object cocina {
	var property comidas = []
	
	method removerPlato(plato){
		comidas.remove(plato)
	}
	method comidasVeggies(){
		return comidas.filter( { c => c.esAptoVegetariano() } ).asSet()
	}
	method comidasCarnivoras(){
		return comidas.filter( { c => not c.esAptoVegetariano() } ).asSet()
	}
	method tieneBuenaOfertaVegetariana(){
		return self.comidasVeggies().difference(self.comidasCarnivoras()).size() <= 2
	}
	method platoFuerteCarnivoro(){
		return self.comidasCarnivoras().asList().max( { c => c.valoracion() } )
	}
	method comidasQueLeGustan(comensal){
		return comidas.filter( { comida => comensal.leAgrada(comida) } )
	}
	method elegirUnPlato(comensal){
		if(self.comidasQueLeGustan(comensal).size() > 0 ){
			comensal.comer(self.comidasQueLeGustan(comensal).first())
			self.removerPlato(self.comidasQueLeGustan(comensal).first())
		}else{ "No le gusta ningun plato" }
	}
}