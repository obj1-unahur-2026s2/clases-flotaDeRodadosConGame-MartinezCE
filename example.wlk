class ChevroletCorsa {
  const property color
  
  method capacidad() = 4
  
  method velocidadMaxima() = 150
  
  method peso() = 1300
}

class RenaultKwid {
  var property tanqueAdicional = false
  
  method capacidad() = if (tanqueAdicional) 3 else 4
  
  method velocidadMaxima() = if (tanqueAdicional) 120 else 110
  
  method color() = "azul"
  
  method peso() = if (tanqueAdicional) 1350 else 1200
}

class AutoEspecial {
  const property capacidad
  const property velocidadMaxima
  const property peso
  const property color
}

object trafic {
  var property interior = comodo
  var property motor = pulenta
  
  method capacidad() = interior.capacidad()
  
  method velocidadMaxima() = motor.velocidadMaxima()
  
  method peso() = (4000 + interior.peso()) + motor.peso()
  
  method color() = "blanco"
} // Interiores

object comodo {
  method capacidad() = 5
  
  method peso() = 700
}

object popular {
  method capacidad() = 12
  
  method peso() = 1000
} // Motores

object pulenta {
  method peso() = 800
  
  method velocidadMaxima() = 130
}

object bataton {
  method peso() = 500
  
  method velocidadMaxima() = 80
}

class Dependencia {
  const flota = []
  const empleados
  
  method agregarAFlota(rodado) {
    // Agrega un rodado a la flota
    flota.add(rodado)
  }
  
  method quitarDeFlota(rodado) {
    // Quita un rodado de la flota
    flota.remove(rodado)
  }
  
  method pesoTotalFlota() {
    var total = 0
    total = flota.sum({ f => f.peso() })
    return total
  }
  
  method auxEstaBienEquipada() = (flota.size() >= 3) and flota.all(
    { f => f.velocidadMaxima() >= 100 }
  )
  
  method estaBienEquipada() = self.auxEstaBienEquipada()
  
  method capacidadTotalEnColor(color) = flota.sum(
    { f => if (f.color() == color) f.capacidad() else 0 }
  )
  
  method colorDelRodadoMasRapido() = flota.max(
    { f => f.velocidadMaxima() }
  ).color()
  
  method auxCapacidadTotal() = flota.sum({ f => f.capacidad() })
  
  method capacidadFaltante() = empleados - self.auxCapacidadTotal()
  
  method esGrande() = (empleados >= 40) and (flota.size() >= 5)
}

class Pedido {
  const distancia
  var tiempoMaximo
  const cantidadDePasajeros
  const coloresIncompatibles = #{}
  
  method velocidadRequerida() = distancia / tiempoMaximo
  
  method satisfacePedido(rodado) =
    (rodado.velocidadMaxima() >= (self.velocidadRequerida() + 10)) and
    (rodado.capacidad() >= cantidadDePasajeros) and
    (not coloresIncompatibles.contains(rodado.color()))
  
  method acelerar() {
    tiempoMaximo -= 1
  }
  
  method relajar() {
    tiempoMaximo += 1
  }
}
