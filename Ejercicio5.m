% Ejercicio5 - Funcion integral de la funcion sen (pi *t)
a = 0; b = 0.5; N =200;
h = (b - a)/ N;

%funcion
f = @(t) sin (pi * t);
g0 = -(1/pi);
trapecios_values = [];

% Inicializamos la matriz (N+1 x N+1)
M = zeros(N+1, N+1);
vector_unitario = ones (N+1,1);

t_values = linspace(a, b, N+1);
f_values = f(t_values)'; %' transpuesta

for i = 1 : N+1
    for j = 1 : N+1
        if j == 1  % Primera columna
            M(i, j) = 1;
        elseif i == j  % Diagonal principal
            M(i, j) = 1;
        elseif i > j  % Elementos por debajo de la diagonal principal
            M(i, j) = 2;
        end
    end
end

M(1, 1) = 0;  % Ajustar la posición (1,1) a 0 según la imagen que enviaste

  %Empieza las sumas
  primeraParte = g0 * vector_unitario;
  segundaParte = (h/2) * M * f_values;
  resultados_trapecios = primeraParte + segundaParte;

 % Mostrar el resultado final
  disp('Resultados Trapecios:');
  disp(resultados_trapecios);


% Graficar
figure;
hold on;
plot(t_values, f_values, 'b-', 'DisplayName', 'sen(\pi t)');  % Gráfico en azul
plot(t_values, resultados_trapecios, 'r-', 'DisplayName', 'Primitiva');  % Gráfico en rojo
legend('show');
xlabel('t');
ylabel('Valores');
title('Función sen(\pi t) y su Primitiva');
hold off;
