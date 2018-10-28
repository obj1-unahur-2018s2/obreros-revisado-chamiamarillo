import obras.*
import uocra.*

class Obrero {
	var property estaDeLicencia = false
	var property diasAdeudados // para multiplicar por lo que vale cada jornal de los obreros
	var property efectivoACobrar
	
	method consumo(_obra)
	method diasTrabajados(_obrero) { diasAdeudados += 1 }
	method jornalTrabajado(_obra) {
		self.diasTrabajados(self)
		self.consumo(_obra)
	}	
	
}

class Albanil inherits Obrero {
	
	override method consumo(_obra) { 
		_obra.restarLadrillo(100)
	}
	override method jornalTrabajado(_obra) {
		super(_obra)
		efectivoACobrar = efectivoACobrar + (diasAdeudados * uocra.jornalAlbanil())
	}
}

class Gasista inherits Obrero {
	
	override method consumo(_obra) {
		_obra.restarCanio(3)
		_obra.restarFosforo(20)
	}
	override method jornalTrabajado(_obra) {
		super(_obra)
		efectivoACobrar = efectivoACobrar + (diasAdeudados * uocra.jornalEspecialistaBanioYCocina())
	}
	
}

class Plomero inherits Obrero {
	
	override method consumo(_obra) {
		_obra.restarCanio(10)
		_obra.restarArandela(30)
	}
	override method jornalTrabajado(_obra) {
		super(_obra)
		efectivoACobrar = efectivoACobrar + (diasAdeudados * uocra.jornalEspecialistaBanioYCocina())
	}
}

class Electricista inherits Obrero {
	
	override method consumo(_obra) {
		_obra.restarCable(4)
		_obra.restarCinta(1)
	}	
	override method jornalTrabajado(_obra) {
		super(_obra)
		efectivoACobrar = efectivoACobrar + (diasAdeudados * uocra.jornalElectricista())
	}
}
