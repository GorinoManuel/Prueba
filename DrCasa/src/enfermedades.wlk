import personas.*

class EnfermedadInfecciosa {
	var property celulasAmenazadas
	
	method efecto(unaPersona) {
		unaPersona.aumentarTemperatura(celulasAmenazadas/1000)
	}
	
	method esAgresiva(unaPersona) {
		return celulasAmenazadas > unaPersona.celulas()*0.1
	}
	
	method reproducir() {
		celulasAmenazadas *= 2
	}	
}

class EnfermedadAutoinmune {
	const property celulasAmenazadas
	
	method efecto(unaPersona) {
		unaPersona.destruirCelulas(celulasAmenazadas)
	}
	
	method esAgresiva(unaPersona) {
		return unaPersona.diasAfectados() > 30
	}
}

