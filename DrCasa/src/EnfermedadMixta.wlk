import enfermedades.*

class SIDA {
	const parteInfecciosa
	const parteAutoInmune
	
	method celulasAmenazadas() {
		return parteAutoInmune.celulasAmenazadas() // Agarro uno de los dos, ya que deberían tener la misma cantidad
	}
	
	method afectarA(unaPersona) {
		parteInfecciosa.afectarA(unaPersona)
		parteAutoInmune.afectarA(unaPersona)
	}
	
	method atenuarPara(unaPersona, unaDosis) {
		self.atenuarEn(unaDosis*15)
		self.verificarCuracion(unaPersona)
	}
	
	method atenuarEn(unasCelulas) {
		parteInfecciosa.atenuarEn(unasCelulas)
		parteAutoInmune.atenuarEn(unasCelulas)
	}
	
	method verificarCuracion(unaPersona) {
		if (self.celulasAmenazadas() == 0) {
			unaPersona.curar(self)
		}
	}
	method esAgresiva(unaPersona) {
		parteInfecciosa.esAgresiva(unaPersona)
		parteAutoInmune.esAgresiva(unaPersona)
	}
}
