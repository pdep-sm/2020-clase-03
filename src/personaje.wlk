import hechizos.*
import artefactos.*

class Personaje {
	var property hechizoPreferido = hechizoBasico
	const valorBaseHechiceria = 3
	var property valorBaseLucha = 1
	const property artefactos = #{}
	
	method agregarArtefacto(artefacto) {
		artefactos.add(artefacto)
	}
	
	method eliminarArtefacto(artefacto) {
		artefactos.remove(artefacto)
	}

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
