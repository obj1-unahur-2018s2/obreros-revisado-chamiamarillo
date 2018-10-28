import obreros.*
import uocra.*

class Obra {
	var property plantilla = #{}
		
	// valores iniciales para una obra
	var property efectivo
	var property ladrillo
	var property canio
	var property cable
	var property cinta
	var property fosforo 
	var property arandela
	
	constructor(_ladrillo,_canio,_cable,_cinta,_fosforo,_arandela,_efectivo) {
		ladrillo = _ladrillo
		canio = _canio
		cable = _cable
		cinta = _cinta
		fosforo = _fosforo
		arandela = _arandela
		efectivo = _efectivo
	}
	
	
	// modificar cantidad de materiales
	method restarLadrillo(_cantidad) { ladrillo -= _cantidad }
	method restarCanio(_cantidad) { canio -= _cantidad }
	method restarCable(_cantidad) { cable -= _cantidad }
	method restarCinta(_cantidad) { cinta -= _cantidad }
	method restarFosforo(_cantidad) { fosforo -= _cantidad }
	method restarArandela(_cantidad) { arandela -= _cantidad}

	// listado de empleados que pueden trabajar en la obra
	method agregarObrero(_obrero) { plantilla.add(_obrero) }
	method quitarObrero(_obrero) { plantilla.remove(_obrero) }
	// para sacar los obreros que pueden trabajar en una obra (no estan de licencia)
	method plantillaDisponible () {
		return plantilla.filter({ obr => not obr.estaDeLicencia() })
	}
	// para saber si un obrero esta disponible para trabajar
	method existeObrero(_obrero) { return self.plantillaDisponible().contains(_obrero) }
	
	// Para pago de jornal
	method jornadaLaboral(_obrero) {
		self.plantillaDisponible().forEach({ _obr => _obr.jornalTrabajado(self)})
	}
	// Sacar el importe adeudado de todos los obreros de la obra
	method importeAdeudado() {
		return plantilla.sum({ obr => obr.efectivoACobrar() })
	}
	// Pago de jornal
	method pagoJornal() {
		efectivo = efectivo - self.importeAdeudado()
		self.plantillaDisponible().forEach({ _obrero => _obrero.diasAdeudados(0) and _obrero.efectivoACobrar(0) })
		return efectivo
	}
}
