% Definir la función seno
f = @(t) sin(pi * t);

% INTERVALO DE INTEGRACION
a = 0; b = 0.5;

% VALORES QUE PUEDE TOMAR N
N_Valores = [10, 20, 40, 80];

% VECTORES PARA ALMACENAR RESULTADOS
h_valores = [];
integral_menor_values = [];
integral_mayor_values = [];
integral_trapecios_values = [];

% ITERAMOS SOBRE LA PRECISION DE CADA ITEM DE LOS N VALORES
for N = N_Valores  % Itero sobre la cantidad de elementos del vector

  % Calculamos h para este nivel de precisión
  h = (b - a) / N;

  % Preasignamos vectores de tamaño N+1
  t_valores = linspace(a, b, N+1);  % Vector con los puntos del dominio
  f_valores = f(t_valores);  % Vector de las imágenes de la función seno en los puntos del dominio

  % CALCULAR LA SUMA DE RIEMANN MENOR
  integral_menor = sum(f_valores(1:N) * h);

  % CALCULAR LA SUMA DE RIEMANN MAYOR
  integral_mayor = sum(f_valores(2:N+1) * h);

  %CALCULAR LA SUMA DE TRAPECIOS
  integral_trapecios = h * (f_valores(1)/2 + f_valores(N+1)/2 + sum(f_valores(2:N)));

  % ALMACENAR LOS VALORES EN LOS VECTORES VALUES
  h_valores = [h_valores h];
  integral_menor_values = [integral_menor_values integral_menor];
  integral_mayor_values = [integral_mayor_values integral_mayor];
  integral_trapecios_values = [integral_trapecios_values integral_trapecios];

end

%valor exacto de la integral
Ie = (1/pi);
fprintf('El valor exacto de la integral es: %.5f\n\n', Ie);

% Mostrar los resultados
for i = 1:length(N_Valores)
  fprintf('N = %d, h = %.5f\n', N_Valores(i), h_valores(i));

  fprintf('Suma de Riemann menor: Integral = %.5f\n', integral_menor_values(i));
  fprintf('El Error de la Suma de Riemann menor es %.5f\n\n', Ie - integral_menor_values(i));

  fprintf('Suma de Riemann mayor: Integral = %.5f\n', integral_mayor_values(i));
  fprintf('El Error de la Suma de Riemann Mayor es %.5f\n\n', Ie - integral_mayor_values(i));

  fprintf('Suma de Trapecios Multiples: Integral = %.5f\n', integral_trapecios_values(i));
  fprintf('El Error de la Suma de Trapecios Multiples es %.5f\n\n', Ie - integral_trapecios_values(i));

end

