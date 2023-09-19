import enfermedades.*

object laMuerte {
	const celulasAmenazadas = 0
	
	method celulasAmenazadas() {
		return celulasAmenazadas
	}
	
	method atenuarPara(_unaPersona, _unaDosis){
		// No debería hacer nada	
	}
	
	method atenuarEn(unasCelulas) {
		//Nada
	}
	
	method afectarA(unaPersona) {
		unaPersona.morir()
	}
	
	method esAgresiva(_unaPersona) { 
		return true
	}

}
