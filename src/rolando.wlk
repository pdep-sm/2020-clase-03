object rolando {

	var property hechizoPreferido = hechizoBasico
	const valorBaseHechiceria = 3
	var property valorBaseLucha = 1
	const property artefactos = #{} //[]
	
	// No hacer nunca => rolando.artefactos().add(espadaDelDestino)	
	method agregarArtefacto(artefacto) {
		artefactos.add(artefacto)
	}
	
	method eliminarArtefacto(artefacto) {
		artefactos.remove(artefacto)
	}

	/* NUNCA HACER ESTO :) 
	method nivelHechiceria() = nivelHechiceria 
	method calcularNivelHechiceria() {
		nivelHechiceria = valorBase * hechizoPreferido.poder() + fuerzaOscura.fuerza()
	} */

	method nivelHechiceria() =
		valorBaseHechiceria * hechizoPreferido.poder() + fuerzaOscura.fuerza()
	

	method seCreePoderoso() = hechizoPreferido.esPoderoso()
	
	method valorLucha() =
		valorBaseLucha + self.valorLuchaArtefactos()
	
	method valorLuchaArtefactos() =
		artefactos.sum{artefacto => artefacto.unidadesLucha(self)}
		
	method estaCargado() = artefactos.size() >= 5
	
	method restoDeLosArtefactos(artefacto) = artefactos.filter{ a => a != artefacto }

}

object hechizoBasico {

	//Otra forma: const property poder = 10
	method poder() = 10
	
	method esPoderoso() = false

}

object espectroMalefico { 
	
	var property nombre = "Espectro Malefico"
	
	method poder() = nombre.size()
	
	method esPoderoso() = self.poder() > 15
	
}

object fuerzaOscura {
	var fuerza = 5
	
	method fuerza() = fuerza
	
	method eclipse() {
		fuerza = fuerza * 2
	}
}

object espadaDelDestino {
	method unidadesLucha(guerrero) = 3
}

object collarDivino {
	var property cantidadPerlas = 5
	
	method unidadesLucha(guerrero) = cantidadPerlas
}

object mascaraOscura {
	method unidadesLucha(guerrero) = (fuerzaOscura.fuerza() / 2).max(4)
}


object armadura {
	const unidadesBase = 2
	var property refuerzo = noRefuerzo
	
	/* No hacer esto en POO
	method unidadesLucha(guerrero) {
		var valorDelRefuerzo = 0
		if (refuerzo != null) valorDelRefuerzo = refuerzo.valor(guerrero)
		return unidadesBase + valorDelRefuerzo
	}*/
	method unidadesLucha(guerrero) = unidadesBase + refuerzo.valor(guerrero)
	
}

object cotaDeMalla {
	method valor(guerrero) = 1
}

object bendicion {
	method valor(guerrero) = guerrero.nivelHechiceria()
 	// suma tantas unidades de lucha como nivel de 
 	// hechicería obtenga quien posee la armadura.
}

object refuerzoHechizo {
	var property hechizo = hechizoBasico
	
	method valor(guerrero) = hechizo.poder()
}

object noRefuerzo { //Null Object
	method valor(guerrero) = 0
}


/*
 *ESPEJO
 *  Rolando también puede poseer al “espejo fantástico”, que se comporta de la misma manera que la mejor 
 * de sus restantes pertenencias. Se considera la mejor pertenencia a la que aporta más puntos de lucha. 
 * Si sólo tuviera como pertenencia al espejo fantástico, su aporte a la lucha sería nulo.
 */

object espejoFantastico {
	
	method unidadesLucha(guerrero) {
		const artefactos = guerrero.restoDeLosArtefactos(self)
		
		if (artefactos.isEmpty())
			return 0
		else
			//Otra opción: artefactos.map { artefacto => artefacto.unidadesLucha(guerrero) }.max()
			return artefactos.max { artefacto => artefacto.unidadesLucha(guerrero) }.unidadesLucha(guerrero)
	}
}


/* 
 * LIBRO DE HECHIZOS
 * Por otra parte, puede suceder que Rolando en vez de tener un simple hechizo preferido, adopte como preferido un libro de 
 * hechizos, en el que están detallados varios hechizos. En este caso, el poder de hechicería que aporta es la sumatoria del 
 * poder de todos los hechizos poderosos que contenga. Sabemos que el libro es poderoso, si es que tiene al menos un hechizo 
 * poderoso.
 */

object libroDeHechizos {
	const hechizos = []
	
	method agregarHechizo(hechizo) {
		hechizos.add(hechizo)
	}
	
	method esPoderoso() = hechizos.any { hechizo => hechizo.esPoderoso() }
	
	method poder() = self.hechizosPoderosos().sum { hechizo => hechizo.poder() }
									
	method hechizosPoderosos() = hechizos.filter { hechizo => hechizo.esPoderoso() }
		
}


















