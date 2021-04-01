%========================================================================================
x0 = [ -14; -18; -26; -31; 0; 0; 0; 0 ];

x  = @(t) [ x1; x2; x3; x4; v1; v2; v3; v4; ];

f = @(t, x) [ x(5); 
              x(6);
              x(7);
              x(8);
              (1*(50/7.2*(tanh(((8*t - 90*sin(0.1*t)) - x(1) - 42)/20) + tanh(4)) - x(5)) );
              (1*(50/7.2*(tanh((x(1) - x(2)                  - 42)/20) + tanh(4)) - x(6)) );
              (1*(50/7.2*(tanh((x(2) - x(3)                  - 42)/20) + tanh(4)) - x(7)) );
              (1*(50/7.2*(tanh((x(3) - x(4)                  - 42)/20) + tanh(4)) - x(8)) )];
%========================================================================================
h = 0.0625;
n = 4;
dist = 1700;
[T,X,t] = RungeKuttaSistema(f, h, [0 250], x0, n, dist);
plot(T,X)

SV1 = 0; SV2 = 0; SV3 = 0; SV4 = 0;
for (i = 1: length(X))
  V1(1,i) = X(5,i); SV1 += X(5,i);
  V2(1,i) = X(6,i); SV2 += X(6,i);
  V3(1,i) = X(7,i); SV3 += X(7,i);
  V4(1,i) = X(8,i); SV4 += X(8,i); 
endfor

printf("\nPROBLEMA GERAL:\n Tempo Total: %d s\n Interações: %d\n Tamanho do Intervalo: %d\n\n", t*h, t, h)
printf("CARRO 1:\n Posição: %d m\n Velocidade Máxima: %d m/s %d km/h\n Velocidade Média: %d m/s %d km/h\n\n", X(1,length(X)), max(V1), max(V1)*3.6, SV1/t, SV1/t*3.6)
printf("CARRO 2:\n Posição: %d m\n Velocidade Máxima: %d m/s %d km/h\n Velocidade Média: %d m/s %d km/h\n\n", X(2,length(X)), max(V2), max(V2)*3.6, SV2/t, SV2/t*3.6)
printf("CARRO 3:\n Posição: %d m\n Velocidade Máxima: %d m/s %d km/h\n Velocidade Média: %d m/s %d km/h\n\n", X(3,length(X)), max(V3), max(V3)*3.6, SV3/t, SV3/t*3.6)
printf("CARRO 4:\n Posição: %d m\n Velocidade Máxima: %d m/s %d km/h\n Velocidade Média: %d m/s %d km/h\n\n", X(4,length(X)), max(V4), max(V4)*3.6, SV4/t, SV4/t*3.6)