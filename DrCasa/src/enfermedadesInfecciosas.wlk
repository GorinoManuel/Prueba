import enfermedades.*

class EnfermedadInfecciosa inherits Enfermedad {
	//var celulasAmenazadas: No va property porque esto nos dejaría modificar las celulasAmenazadas según queramos
	override method afectarA(unaPersona) {
		unaPersona.aumentarTemperatura(self.celulasAmenazadas()/1000)
	}
	
	override method esAgresiva(unaPersona) {
		return self.celulasAmenazadas() > unaPersona.celulas()*0.1
	}
	
	method reproducir() {
		celulasAmenazadas *= 2
	}	
}