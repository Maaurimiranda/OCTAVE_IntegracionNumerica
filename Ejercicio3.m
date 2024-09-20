%Ejercicio 3 - Funcion Exponencial

N_values = [6, 12, 18, 24];
w_values = [2, 0.5]; % valores que pide asumir de la funcion
a = 0; % valor inferior

% funcion
g = @(w) (1/w) * (1 - exp(-6)); % Valor exacto de la integral

% Para almacenar y graficar los valores
trapecios_values = [];
riemann_values = [];

for w = w_values
  fprintf('Resultados para w = %.2f\n', w);

  % Declaramos el limite superior
  b = 6 / w;

  % Funcion a integrar
  f = @(t) exp(-w * t);

  % Inicializamos vectores para almacenar resultados
  trapecios_resultados = [];
  riemann_resultados = [];

  for N = N_values
    h = (b - a) / N;

    t_values = linspace(a, b, N + 1);
    f_values = f(t_values);

    % METODO DE TRAPECIOS
    integral_trapecios = h * (f_values(1)/2 + sum(f_values(2:end-1)) + f_values(end)/2);

    % SUMAS DE RIEMANN
    integral_riemann = h * sum(f_values(1:end-1));

    trapecios_resultados = [trapecios_resultados, integral_trapecios];
    riemann_resultados = [riemann_resultados, integral_riemann];

    % Imprimir los resultados
    exact_value = g(w);
    fprintf('N = %d, Trapecios = %.5f, Riemann = %.5f, Exacta = %.5f\n', N, integral_trapecios, integral_riemann, exact_value);

  endfor

  % Almacenar los resultados para graficar
  trapecios_values = [trapecios_values; trapecios_resultados];
  riemann_values = [riemann_values; riemann_resultados];

  % GRAFICO PARA TRAPECIOS
  figure;
  plot(N_values, trapecios_resultados, '-o');
  hold on;
  plot(N_values, exact_value * ones(size(N_values)), 'r--'); % Línea horizontal con valor exacto
  title(['Método de Trapecios para w = ', num2str(w)]);
  xlabel('N');
  ylabel('Valor Aproximado');
  legend('Trapecios', 'Valor Exacto');
  hold off;

  % Graficar para Suma de Riemann
  figure;
  plot(N_values, riemann_resultados, '-o');
  hold on;
  plot(N_values, exact_value * ones(size(N_values)), 'r--'); % Línea horizontal con valor exacto
  title(['Suma de Riemann para w = ', num2str(w)]);
  xlabel('N');
  ylabel('Valor Aproximado');
  legend('Riemann', 'Valor Exacto');
  hold off;

endfor

