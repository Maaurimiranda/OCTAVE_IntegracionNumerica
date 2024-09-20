%Ejercicio 6
a = 0; b = 3;
g0 = 0;

%Posibles valores de p y N
p_values = [2, 0.5];
N_values = [10, 20];
trapecios_values = [];
f_values = [];

for p = p_values
  %definir funcion
  f = @(t) exp(- p * t);
  fprintf('Resultados para p = %.2f\n', p);

  for N = N_values
   % Inicializamos la matriz (N+1 x N+1)
    M = zeros(N+1, N+1);
    g0_vector = g0 * ones(N+1, 1);

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

  h = (b - a) / N;

  trapecios_values = g0_vector + (h/2) * M * f_values;

   % Mostrar el resultado final
  disp('Resultados Trapecios:');
  disp(trapecios_values);

  figure;
  hold on;
  plot(t_values, f_values, 'b-', 'DisplayName', 'sen(\pi t)');  % Gráfico en azul
  plot(t_values, trapecios_values, 'r-', 'DisplayName', 'Primitiva');  % Gráfico en rojo
  legend('show');
  xlabel('t');
  ylabel('Valores');
  title('Función exp(- p * t) y su Primitiva');
  hold off;

  end
end
