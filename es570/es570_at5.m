%%  Question 1
%   Inicial Values
tif = 19;               % Temp. Infinita    [C]
ts  = 31;               % Temp. Superfície  [C]
tf  = 25;               % Temp. Final       [C]

d   = 2e-2;             % Diâmetro      [m]
k   = 72.7;             % Ferro Armco   [W/mC]
h   = 20;               % Ar            [W/m2C]
l   = 1.5;              % Altura        [m]

%   Tabela  A1
rho = 7870;             % Densidade     [kg/m3]
cp  = 447;              % Capacitância  [J/kgK]

%   Cálculos
r0  = d/2;              % Raio          [m]

v   = pi*r0^2*l;        % Volume            [m3]
as  = 2*pi*r0*l;        % Área Superficial  [m2]

theta_i = ts - tif;     % Theta Inicial
theta   = tf - tif;     % Theta Final

t   = (rho * v * cp)/(h * as) * log(theta_i/theta)



%%  Question 3
%   Inicial Values
tif = 31;               % Temp. Infinita    [C]
ts  = 15;               % Temp. Superfície  [C]

v   = 0.18;             % Velocidade Fluxo  [m/s]
d   = 20e-2;            % Diâmetro          [m]
l   = 20;               % Altura            [m]
k   = 51.9;             % Aço               [W/mC]

%   Tabela A6
tf  = (tif + ts)/2 + 273.15

vTi = [290   295   tf 300   305  ];
vT  = [290   295      300   305  ];
vSV = [1.001 1.002    1.003 1.005]*1e-3;
vVS = [1080  959      855   769  ]*1e-6;
vPR = [7.56  6.62     5.83  5.20 ];

tSV = interp1(vT,vSV,vTi,'linear');
tVS = interp1(vT,vVS,vTi,'linear');
tPR = interp1(vT,vPR,vTi,'linear');

mu  = tVS(3);           % Viscosidade       [Ns/m2]
rho = tSV(3)^-1;        % Densidade         [kg/m3]
Pr  = tPR(3);

%   Tabela 7.2
c   = 0.193;
m   = 0.618;

%   Cálculos
Re  = (rho * v * d)/mu

Nu0 = c*(Re^m)*(Pr^(1/3))   % Equação 7.52
h0  = Nu0*k/d






