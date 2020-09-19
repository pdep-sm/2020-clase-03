class HechizoDeLogo {
	
	var property nombre = ""
	var property multiplicador = 1
	
	method poder() = nombre.size() * multiplicador
	
	method esPoderoso() = self.poder() > 15
	
}


object hechizoBasico {

	//Otra forma: const property poder = 10
	method poder() = 10
	
	method esPoderoso() = false

}

object fuerzaOscura {
	var fuerza = 5
	
	method fuerza() = fuerza
	
	method eclipse() {
		fuerza = fuerza * 2
	}
}


/* 
 * LIBRO DE HECHIZOS
 * Por otra parte, puede suceder que Rolando en vez de tener un simple hechizo preferido, adopte como preferido un libro de 
 * hechizos, en el que están detallados varios hechizos. En este caso, el poder de hechicería que aporta es la sumatoria del 
 * poder de todos los hechizos poderosos que contenga. Sabemos que el libro es poderoso, si es que tiene al menos un hechizo 
 * poderoso.
 */

class LibroDeHechizos {
	const hechizos = []
	
	method agregarHechizo(hechizo) {
		hechizos.add(hechizo)
	}
	
	method esPoderoso() = hechizos.any { hechizo => hechizo.esPoderoso() }
	
	method poder() = self.hechizosPoderosos().sum { hechizo => hechizo.poder() }
									
	method hechizosPoderosos() = hechizos.filter { hechizo => hechizo.esPoderoso() }
		
}