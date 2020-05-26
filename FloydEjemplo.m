% Matriz de adyacencias
A = [0  3 4 0;
    0 0 0 5;
    0 0 0 3;
    8 0 0 0];

% Crear grafo dirigido, con pesos usando una matriz de adyacencias
G = digraph(A, "omitselfloops");

% Crear visualización del grafo con los pesos en las etiquetas de las aristas
h = plot(G, 'EdgeLabel', G.Edges.Weight)

% Usar función Floyd para obtener matrices de distancias y de recorridos
% (paths)
[D, P] = Floyd(A)

