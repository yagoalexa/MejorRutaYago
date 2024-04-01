; Definir los hechos iniciales
(deffacts inicio
  (estacion A)
  (estacion B)
  (estacion C)
  (estacion D)
  (estacion E)
  (estacion F)
  (conexion A B 10)
  (conexion B C 15)
  (conexion C D 20)
  (conexion D E 25)
  (conexion E F 30)
  (conexion A F 40)
)

; Definir las reglas
(defrule encontrar-ruta
  (estacion ?origen)
  (estacion ?destino)
  =>
  (assert (ruta-inicial ?origen))
  (assert (ruta-destino ?destino))
  (focus encontrar-mejor-ruta)
)

(defrule encontrar-mejor-ruta
  ?ruta-actual <- (ruta-inicial ?origen)
  (ruta-destino ?destino)
  (conexion ?origen ?siguiente &:(neq ?siguiente ?destino) $?)
  =>
  (assert (ruta-actual ?siguiente))
  (printout t ?siguiente " -> " ?destino crlf)
)

(defrule ruta-encontrada
  ?ruta-actual <- (ruta-actual ?estacion)
  (ruta-destino ?estacion)
  =>
  (assert (mejor-ruta ?ruta-actual))
  (printout t "La mejor ruta es: " ?ruta-actual crlf)
)