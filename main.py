import networkx as nx

# Representamos el sistema de transporte como un grafo
G = nx.Graph()

# Añadimos las estaciones como nodos
G.add_node("Estacion A")
G.add_node("Estacion B")
G.add_node("Estacion C")
G.add_node("Estacion D")
G.add_node("Estacion E")
G.add_node("Estacion F")


# Añadimos las rutas como aristas con el tiempo de viaje como peso
G.add_edge("Estacion A", "Estacion B", weight=10)
G.add_edge("Estacion B", "Estacion C", weight=15)
G.add_edge("Estacion C", "Estacion D", weight=20)
G.add_edge("Estacion D", "Estacion E", weight=25)
G.add_edge("Estacion E", "Estacion F", weight=30)
G.add_edge("Estacion F", "Estacion A", weight=40)

def mejor_ruta(G, inicio, fin):
    ruta = nx.dijkstra_path(G, inicio, fin, weight='weight')
    return ruta

inicio = "Estacion B"
fin = "Estacion E"
ruta = mejor_ruta(G, inicio, fin)

print(f"La mejor ruta desde {inicio} hasta {fin} es: {ruta}")
