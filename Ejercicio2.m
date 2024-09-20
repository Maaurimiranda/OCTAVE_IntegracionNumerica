% EJERCICIO 2 - Integracion de la funcion seno Metodo Simpson
a = 0; b = 0.5;
f = @(t) sin(pi * t);

N_values = [4, 6, 8, 12];

h_values = [];
Integral_Simpson_values = [];

for N = N_values
   h = (b - a) / N;

   t_values = linspace(a, b, N+1);
   f_values = f(t_values);

   integral_simpson = (h/3) * (f_values(1) + f_values(N+1) + 4 * sum(f_values(2:2:N)) + 2 * sum(f_values(3:2:N-1)));

   %Almaceno los resultados
   h_values = [h_values h];
   Integral_Simpson_values = [Integral_Simpson_values integral_simpson];

end

Ie = (1/pi);
Er = Integral_Simpson_values - Ie;

%Mostrar los valores
for i=1 : length(N_values)
  fprintf('N = %d, h = %.5f\n', N_values(i), h_values(i));
  fprintf('Integral con método de Simpson: %.5f\n', Integral_Simpson_values(i));
  fprintf('El ERROR con la Integral con método de Simpson: %.5f\n', Er(i));
  %Calculo de log(Er)
  fprintf('log(Er): %.5f\n', log(Er(i)));
  %Calculo de log(Δt)
  fprintf('log(Δt): %.5f\n', log(h_values(i)));

  %Calculo de p (la pendiente es el orden de convergencia)


  fprintf('Integral con método de Simpson: %.5f\n\n', Integral_Simpson_values(i));

  end








