class Enfermedad {
	var celulasAmenazadas
	
	method celulasAmenazadas() {
		return celulasAmenazadas
	}
	
	method atenuarEn(unasCelulas) {
		celulasAmenazadas = 0.max(self.celulasAmenazadas() - unasCelulas)
	}
	
	method atenuarPara(unaPersona, unaDosis) {
		self.atenuarEn(unaDosis*15)
		self.verificarCuracion(unaPersona)
	}
	
	method verificarCuracion(unaPersona) {
		if (self.celulasAmenazadas() == 0) {
			unaPersona.curar(self)
		}
	}
	
	method afectarA(unaPersona)
	method esAgresiva(unaPersona)
} 




