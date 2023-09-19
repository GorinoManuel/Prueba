import enfermedades.*

class EnfermedadAutoinmune inherits Enfermedad {
	var diasAfectados = 0 // Es responsabilidad de la enfermedad saber esto porque la persona no puede tener la cuenta de los días que tiene cada enfermedad, es algo propio de la enfermedad, aunque no se corresponda con la realidad
	
	override method afectarA(unaPersona) {
		unaPersona.destruirCelulas(self.celulasAmenazadas())
		diasAfectados++
	}
	
	override method esAgresiva(unaPersona) {
		return diasAfectados > 30
	}
}