function [C, L] = lagrange(X, Y)
% DATOS
% X es un vector que contiene la lista de abscisas
% Y es un vector que contiene la lista de ordenadas
% RESULTADOS
% C es la matriz que contiene los coeficientes del polinomio
% interpolador de Lagrange
% L es la matriz que contiene los coeficientes de los polinomios 
% Li de Lagrange

w = length(X);
n = w - 1;
L = zeros(w, w);

% FORMACION DE LOS POLINOMIOS Li DE LAGRANGE
for k = 0:n
    V = 1;
    for r = 0:n
        if k ~= r
            V = conv(V, poly(X(r + 1))) / (X(k + 1) - X(r + 1));
        end
    end
    L(k + 1,:) = V;
    
    %--- Mostrar el polinomio de Lagrange Lk
    %fprintf('Polinomio de Lagrange L%d(x): \n', k);
    %disp(poly2str(V, 'x'));
    %fprintf('\n');
end

% CALCULO DE LOS COEFICIENTES DEL POLINOMIO INTERPOLADOR
C = Y * L;


%---- Mostrar el polinomio interpolador
%fprintf('Polinomio Interpolador final: \n');
%disp(poly2str(C, 'x'));
%disp('coeficientes de polinomio interpolador');
%disp(C)
%disp('coeficientes de los polinomios bases' );
%disp(L);

end