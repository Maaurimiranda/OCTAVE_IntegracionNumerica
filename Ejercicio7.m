%Ejercicio 7

a = 0; b = 8;
p = 0.5; w = 4;
N_values = [50, 100];
g0 = 0;
trapecios_values = [];

%funtion
%f = @t exp(-p * t) * (sin(w * t));
 f = @(t) exp(-p * t) .* sin(w * t);

for N = N_values
  t_values = linspace(a, b , N+1);
  f_values = f(t_values)';
  g0_vector = g0 * ones(N+1);
  h = (b - a) / N;
  M = zeros (N+1, N+1);

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

  trapecios_values = g0_vector + (h/2) * M * f_values;

  % Imprimir figura
  figure;
  plot(t_values, f_values, 'b-'); % Línea azul para la función original
  hold on;
  plot(t_values, f_values, 'bo'); % Círculos azules en los puntos de discretización
  plot(t_values, trapecios_values, 'r-'); % Línea roja para la primitiva
  plot(t_values, trapecios_values, 'ro'); % Círculos rojos en los puntos de discretización
  hold off;
  xlabel('t');
  ylabel('Valores');
  title(['Función exp(-p * t) .* sin(w * t) y su Primitiva para N = ', num2str(N)]);
end

