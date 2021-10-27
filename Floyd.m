function [D, R] = Floyd(AdjMatrix)
% *INPUT:* 
% AdjMax: Matriz adyacente que representa una gráfica dirigida con pesos
%
% *OUTPUT:*
% D: distancia al nodo destino
% R: matriz de recorridos

% Determinar número de nodos
n = min(size(AdjMatrix));

% Inicializar matriz de recorridos
R = repmat(1:n, n, 1);

% Inicializar matriz de distancias
% cambiando todos los ceros por infinitos
D = AdjMatrix;
D(AdjMatrix == 0) = inf;

% 添加注释
% Iteramos sobre todos los nodos
for k=1:n
    
    % Creamos arreglo de índices para saltar 
    % la k-ésima fila y columna
    index = 1:n;
    index(k) = [];
    
    % Los elementos de la diagonal son -1
    D(k,k) = -1;
    
    % Iteramos sobre filas
    for i = index
        
        % Iteramos sobre columnas
        for j = index
            
            % Si alguna fila tiene valor infinito, saltar la iteración
            if D(i,k) == inf
                continue;
            end
            
            % Si alguna columna tiene valor infinito, saltar la iteración
            if D(k,j) == inf
                continue;
            end
            
            % Si la suma de la distancia de la fila i y la columna j
            % es menor que la distancia i,j, cambiamos la entrada
            % y actualizamos la matriz de rutas
            if D(i,k) + D(k,j) < D(i,j)
                D(i,j) = D(i,k) + D(k,j);
                R(i,j) = k;
            end
        end
    end
end
end
