class Persona {
	const property enfermedades = #{}
	var property temperatura
	var property celulas
	var property diasAfectados = 0
	
	method contraerEnfermedad(unaEnfermedad) {
		enfermedades.add(unaEnfermedad)
	} 
	
	method aumentarTemperatura(unosGrados) {
			temperatura = 45.min(temperatura + unosGrados)
	}
	
	method destruirCelulas(unasCelulas) {
		celulas = 0.max(celulas - unasCelulas)
	}
	
	method vivirUnDia() {
		enfermedades.forEach { enfermedad => 
			enfermedad.afectarA(self)
		}
		
	}
	
	method pasarDias(unosDias) {
		unosDias.times ({_unDia => self.vivirUnDia()})
	}
	
	method enfermedadQueMasCelulasAfecta() {
		return enfermedades.max { enfermedad => enfermedad.celulasAmenazadas()}
	}
	
	method enComa() {
		return temperatura == 45 || celulas < 1000000
	}
	
	method celulasAfectadasEnfermedadesAgresivas() {
		return enfermedades.filter { enfermedad => 
			enfermedad.esAgresiva(self)
		}.sum { enfermedad => enfermedad.celulasAmenazadas() }
	}
	
	method atenuarEnfermedades(unaDosis) {
		enfermedades.forEach { enfermedad => 
			enfermedad.atenuarPara(self, unaDosis)
		}
	}
	
	method curar(unaEnfermedad) {
		enfermedades.remove(unaEnfermedad)
	}
	
	method morir() {
		temperatura = 0
	}
	
}
