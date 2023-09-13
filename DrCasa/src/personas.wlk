class Persona {
	const property enfermedades = #{}
	var property temperatura
	var property celulas
	var property diasAfectados = 0
	
	method contraerEnfermedad(unaEnfermedad) {
		enfermedades.add(unaEnfermedad)
	} 
	
	method aumentarTemperatura(unosGrados) {
		if (temperatura < 45) {
			temperatura += unosGrados	
		}
	}
	
	method destruirCelulas(unasCelulas) {
		celulas -= unasCelulas
	}
	
	method vivirUnDia(_indice) {
		enfermedades.forEach { enfermedad => 
			enfermedad.efecto(self)
		}
		diasAfectados++
	}
	
	method pasarDias(unosDias) {
		unosDias.times ({indice => self.vivirUnDia(indice)})
	}
	
	method enfermedadQueMasCelulasAfecta() {
		return enfermedades.max  { enfermedad =>
			enfermedad.celulasAmenazadas()
		}
	}
	
	method enComa() {
		return temperatura == 45 || celulas < 1000000
	}
	
	method celulasAfectadasEnfermedadesAgresivas() {
		return enfermedades.filter { enfermedad => 
			enfermedad.esAgresiva(self)
		}.sum { enfermedad => enfermedad.celulasAmenazadas() }
	}
	
}
