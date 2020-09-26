import hechizos.*
import artefactos.*

class Personaje {
	var property hechizoPreferido = hechizoBasico
	var property valorBaseLucha = 1
	var property oro = 100
	const valorBaseHechiceria = 3
	const artefactos = #{}
	
	method agregarArtefacto(artefacto) {
		artefactos.add(artefacto)
	}
	
	method eliminarArtefacto(artefacto) {
		artefactos.remove(artefacto)
	}
	
	method canjearHechizo(nuevoHechizo) {
		const diff = (nuevoHechizo.costo() - hechizoPreferido.valorDeCanje()).max(0)
		oro -= diff
	}
	
	method comprar(artefacto) {
		if (oro >= artefacto.costo()) {
			oro -= artefacto.costo()
			self.agregarArtefacto(artefacto)
		}
	}
	
	method cumplirObjetivo() {
		oro += 10
	}

	method nivelHechiceria() =
		valorBaseHechiceria * hechizoPreferido.poder() + fuerzaOscura.fuerza()
	
	method seCreePoderoso() = hechizoPreferido.esPoderoso()
	
	method valorLucha() =
		valorBaseLucha + self.valorLuchaArtefactos()
	
	method valorLuchaArtefactos() =
		artefactos.sum{artefacto => artefacto.unidadesLucha(self)}
		
	method estaCargado() = artefactos.size() >= 5
	
	method cantidadArtefactos() = artefactos.size()
	
	method restoDeLosArtefactos(artefacto) = artefactos.filter{ a => a != artefacto }
	
}
