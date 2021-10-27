%%============================================================================
%%                    Main Code
%%============================================================================
clear all
% close all

RA = 217276;


%%  Question 1
%%============================================================================

A  = 0.217;     % Constant 0.217XXX
n  = 16;        % Interval Size
kr = 0:n-1;     % Desired Interval

% Recursive Solution
yr(1)=0; yr(2)=0;   % Initial Conditions
for j=0:n-3
    % 0:    Discrete Systems Inicial Value
    % n-3:  -2, Equation Order
    %       -1, Matlab Array

    if (1<=j) && (j<2)  % Condition of u(k)
        yr(j+2+1)=A*yr(j+1)+1;
    else
        yr(j+2+1)=A*yr(j+1)+1-1;
    end
end
stairs(kr,yr)

% Analytic Solution
B = sqrt(A);    % Equation Constants
C = (1/(2*A));

ka = 0:n-1;                             % Analytic Interval
ya = (C*(+B).^(ka-1) + C*(-B).^(ka-1)); % Analytic Solution

ya(1)=0; ya(2)=0;   % Initial Conditions (use Heaviside Function instead)

hold on
stairs(ka,ya,'o');  % Adding the Analytic Solution
hold off


%%  Question 2
%%============================================================================

K = 276;                    % Elastic Constant XXX276
I = 10;                     % Initial Condition
M = 1;                      % Mass
t = linspace(0,10,10000);   % Analysis Interval

% Equation in the Laplace Domain
[r2, p2, k2] = residue([0     0 (K*I)],  [(M*M) 0 (3*K*M) 0 (K*K) 0]);
[r1, p1, k1] = residue([(I*M) 0 (2*K*I)],[(M*M) 0 (3*K*M) 0 (K*K) 0]);
%            r[0]                 r[i]                 r[n]
% f(x) = ------------ + ... + ------------ + ... + ------------ + k(x)
%          x - p[0]             x - p[i]             x - p[n]

% r[i]: Complex Number, residue i of Function
% p[i]: Complex Number, pole i of Function
% k(x): Function,

% Inverse of Laplace with Complex Numbers
yI1 = r1(1)*exp(p1(1)*t) + r1(2)*exp(p1(2)*t) + r1(3)*exp(p1(3)*t) + r1(4)*exp(p1(4)*t) + r1(5)*exp(p1(5)*t);
yI2 = r2(1)*exp(p2(1)*t) + r2(2)*exp(p2(2)*t) + r2(3)*exp(p2(3)*t) + r2(4)*exp(p2(4)*t) + r2(5)*exp(p2(5)*t);

% Equations only in the Real Domain
y1 = real(yI1);
y2 = real(yI2);

plot(t,y1,'b', t,y2,'r')