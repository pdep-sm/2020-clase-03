import hechizos.*

class Arma {
	
	const valorLucha = 3
	
	method unidadesLucha(personaje) = valorLucha
	
	method costo() = valorLucha * 5
}

object collarDivino {
	var property cantidadPerlas = 5
	
	method unidadesLucha(personaje) = cantidadPerlas
	
	method costo() = cantidadPerlas * 2
}


class Mascara {
	
	const indice = 1
	const poderMinimo = 4
	
	method unidadesLucha(personaje) = (fuerzaOscura.fuerza() / 2 * indice).max(poderMinimo)
	
	method costo() = 70 + (fuerzaOscura.fuerza() * indice).roundUp()
	
}


class Armadura {
	const property unidadesBase = 2
	
	var property refuerzo = noRefuerzo
	
	method unidadesLucha(personaje) = unidadesBase + refuerzo.valor(personaje)
	
	method costo() = refuerzo.costo(self)
}


class CotaDeMalla {
	const unidades = 1
	method valor(personaje) = unidades
	
	method costo(armadura) = (unidades / 2).roundUp()
}

object bendicion {
	method valor(personaje) = personaje.nivelHechiceria()
 	/** suma tantas unidades de lucha como nivel de */ 
 	/**  hechicería obtenga quien posee la armadura. */
 	
 	method costo(armadura) = armadura.unidadesBase()
}

class RefuerzoHechizo {
	const hechizo = hechizoBasico
	
	method valor(personaje) = hechizo.poder()
	
	method costo(armadura) = armadura.unidadesBase() + hechizo.costo()
}

object noRefuerzo { //Null Object
	method valor(personaje) = 0
	
	method costo(armadura) = 2
}


/**
 *ESPEJO
 *  Rolando también puede poseer al “espejo fantástico”, que se comporta de la misma manera que la mejor 
 * de sus restantes pertenencias. Se considera la mejor pertenencia a la que aporta más puntos de lucha. 
 * Si sólo tuviera como pertenencia al espejo fantástico, su aporte a la lucha sería nulo.
 */

object espejoFantastico {
	
	method unidadesLucha(personaje) {
		const artefactos = personaje.restoDeLosArtefactos(self)
		
		if (artefactos.isEmpty())
			return 0
		else
			/** Otra opción: artefactos.map { artefacto => artefacto.unidadesLucha(personaje) }.max() */
			return artefactos.max { artefacto => artefacto.unidadesLucha(personaje) }.unidadesLucha(personaje)
	}
	
	method costo() = 90
}