import hechizos.*

class Arma {
	method unidadesLucha(personaje) = 3
}

object collarDivino {
	var property cantidadPerlas = 5
	
	method unidadesLucha(personaje) = cantidadPerlas
}


class Mascara {
	
	var property indice = 1
	var property poderMinimo = 4
	
	method unidadesLucha(personaje) = (fuerzaOscura.fuerza() / 2 * indice).max(poderMinimo)
	
}


class Armadura {
	var property unidadesBase = 2
	
	var property refuerzo = noRefuerzo
	
	method unidadesLucha(personaje) = unidadesBase + refuerzo.valor(personaje)
}


class CotaDeMalla {
	var property unidades = 1
	method valor(personaje) = unidades
}

object bendicion {
	method valor(personaje) = personaje.nivelHechiceria()
 	// suma tantas unidades de lucha como nivel de 
 	// hechicería obtenga quien posee la armadura.
}

class RefuerzoHechizo {
	var property hechizo = hechizoBasico
	
	method valor(personaje) = hechizo.poder()
}

object noRefuerzo { //Null Object
	method valor(personaje) = 0
}


/*
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
			//Otra opción: artefactos.map { artefacto => artefacto.unidadesLucha(personaje) }.max()
			return artefactos.max { artefacto => artefacto.unidadesLucha(personaje) }.unidadesLucha(personaje)
	}
}