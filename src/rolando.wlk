object rolando {

	var hechizoPreferido = hechizoBasico
	const valorBaseHechiceria = 3
	var valorBaseLucha = 1
	const artefactos = #{} //[]

	method hechizoPreferido(hechizo) {
		hechizoPreferido = hechizo	
	}
	
	method valorBaseLucha(valor) {
		valorBaseLucha = valor
	}
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

}

object hechizoBasico {

	method poder() = 10
	
	method esPoderoso() = false

}

object espectroMalefico { 
	
	var nombre = "Espectro Malefico"

	method nombre(nuevoNombre) {
		nombre = nuevoNombre
	}
	
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
	var cantidadPerlas = 5
	method cantidadPerlas(cantidad){
		cantidadPerlas = cantidad
	}
	method unidadesLucha(guerrero) = cantidadPerlas
}

object mascaraOscura {
	method unidadesLucha(guerrero) = (fuerzaOscura.fuerza() / 2).max(4)
}


object armadura {
	const unidadesBase = 2
	var refuerzo = noRefuerzo
	
	method refuerzo(_refuerzo) {
		refuerzo = _refuerzo
	}
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
	var hechizo = hechizoBasico
	method hechizo(_hechizo) {
		hechizo = _hechizo
	}
	
	method valor(guerrero) = hechizo.poder()
}

object noRefuerzo { //Null Object
	method valor(guerrero) = 0
}

