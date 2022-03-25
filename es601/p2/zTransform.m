%%  Transformada Z
%%============================================================================

clc
close all
fpath = 'C:\Users\Admin-PC\OneDrive\UNICAMP\classes\es601\p2\images';
fsize = [0 0 18 6];

%%  Exercice 1
%   y(0) = y(1) = 0; k>=0
%   y(k+2) - a * y(k) = u;
%   ztrans(y(n+2) -alpha*y(n) == heaviside(n))
%   simplify(iztrans(partfrac((1/((z^2 - alpha)*(z - 1))),z, 'FactorMode', 'full')*z))


%   Recursive Solution
alpha   = 0.5;          % Constant          (!=1)
n       = 20;           % Interval Size
kr      = 0:n-1;        % Desired Interval

yr      = 0;
yr(1)   = 0;
yr(2)   = 0;            % Initial Conditions

sysOrder= 2;            % System Order

for j=0:n-1-sysOrder

    k = j+1;

    yr(k+2) = alpha * yr(k)+1;
end
figure; stairs(kr,yr)
title('Exercice 01'); xlabel('k [s]'); ylabel('y(k)')


%   Analytic Solution
beta    = sqrt(alpha);  % Constant
A       = 1/(2*beta * (beta+1));
B       = 1/(2*beta * (beta-1));
C       = 1/(1 - alpha);

ka = kr;                                                % Analytic Interval
ya = (A * (-beta).^(ka-1) + B * (+beta).^(ka-1) + C);   % Analytic Solution
ya(1)   = yr(1);
ya(2)   = yr(2);    % Initial Conditions (use Heaviside Function instead)

hold on
stairs(ka,ya,'o');  % Adding the Analytic Solution
legend("Recursiva", "Analítica", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'exercice01'), 'png');
hold off




%%   Exercício 2
%   y(0) = 0; k>=0
%   y(k+1) + 2 * y(k) = 4^k
%   iztrans(partfrac((1/((z - 4)*(z + 2))),z, 'FactorMode', 'full')*z)


%   Recursive Solution
n       = 5;            % Interval Size
kr      = 0:n-1;        % Desired Interval

yr      = 0;
yr(1)   =0;             % Initial Conditions

sysOrder= 1;            % System Order

for j=0:n-1-sysOrder

    k = j+1;

    yr(k+1) = -2 * yr(k) + 4^(k);
end
figure; stairs(kr,yr)
title('Exercice 02'); xlabel('k [s]'); ylabel('y(k)')


%   Analytic Solution
A       = +1/6;
B       = -1/6;

ka = kr;                                    % Analytic Interval
ya = (A * (+4).^(ka-1) + B * (-2).^(ka-1)); % Analytic Solution
ya(1)   = yr(1);    % Initial Conditions (use Heaviside Function instead)

hold on
stairs(ka,ya,'o');  % Adding the Analytic Solution
legend("Recursiva", "Analítica", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'exercice02'), 'png');
hold off




%%  Exercício 3
%   y(0) = 0; y(1) = 1; k>=0
%   y(k+2) + 3*y(k+1) + 2*y(k) = 0;
%   pretty(partfrac((1/(z^2 + 3*z + 2)), z, 'FactorMode', 'full'))
%   pretty(iztrans(partfrac((1/(z^2 + 3*z + 2)), z, 'FactorMode', 'full')*z))


%   Recursive Solution
n       = 10;           % Interval Size
kr      = 0:n-1;        % Desired Interval

yr      = 0;
yr(1)   = 0;
yr(2)   = 1;            % Initial Conditions

sysOrder= 2;            % System Order

for j=0:n-1-sysOrder

    k = j+1;

    yr(k+2) = -3 * yr(k+1) -2 * yr(k);
end
figure; stairs(kr,yr)
title('Exercice 03'); xlabel('k [s]'); ylabel('y(k)')


%   Analytic Solution
ka = kr;                                    % Analytic Interval
ya = (1 * (-1).^(ka-1) - 1 * (-2).^(ka-1)); % Analytic Solution
ya(1)   = yr(1);
ya(2)   = yr(2);    % Initial Conditions (use Heaviside Function instead)

hold on
stairs(ka,ya,'o');  % Adding the Analytic Solution
legend("Recursiva", "Analítica", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'exercice03'), 'png');
hold off




%%  Exercício 4
%   y(0) = 1; y(1) = 0; k>= 0
%   y(k+2) + y(k) = 0;
%   pretty(partfrac((z/(z^2 + 1)), z, 'FactorMode', 'full'))
%   pretty(iztrans(partfrac((z/(z^2 + 1)), z, 'FactorMode', 'full')*z))


%   Recursive Solution
n       = 10;           % Interval Size
kr      = 0:n-1;        % Desired Interval

yr      = 0;
yr(1)   = 1;
yr(2)   = 0;            % Initial Conditions

sysOrder= 2;            % System Order

for j=0:n-1-sysOrder

    k = j+1;

    yr(k+2) = -1 * yr(k);
end
figure; stairs(kr,yr)
title('Exercice 04'); xlabel('k [s]'); ylabel('y(k)')


%   Analytic Solution
ka = kr;                                    % Analytic Interval
ya = (1/2 * (+1i).^(ka-1) + 1/2 * (-1i).^(ka-1)); % Analytic Solution
ya(1)   = yr(1);
ya(2)   = yr(2);    % Initial Conditions (use Heaviside Function instead)

hold on
stairs(ka,ya,'o');  % Adding the Analytic Solution
legend("Recursiva", "Analítica", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'exercice04'), 'png');
hold off




%%  Exercício 5
%   y(-2) = a; y(-1) = b;
%   y(k) - y(k-2) = 0;
%   pretty(iztrans(partfrac( (-z*a -b)/(z^2 - 1), z, 'FactorMode', 'full')*z ))


%   Recursive Solution
n       = 10;           % Interval Size
kr      = -2:n-3;       % Desired Interval

yr      = 0;
a       = 1;
b       = 1;
yr(1)   = a;
yr(2)   = b;            % Initial Conditions

sysOrder= 2;            % System Order

for j=0:n-1-sysOrder

    k = j+1;

    yr(k+2) = +1 * yr(k);
end
figure; stairs(kr,yr)
title('Exercice 05'); xlabel('k [s]'); ylabel('y(k)')


%   Analytic Solution
ka = kr;                                    % Analytic Interval
ya = (+(a/2 + b/2) * (+1).^(ka-1) -(a/2 - b/2) * (-1).^(ka-1)); % Analytic Solution
ya(1)   = yr(1);    
ya(2)   = yr(2);    % Initial Conditions (use Heaviside Function instead)

hold on
stairs(ka,ya,'o');  % Adding the Analytic Solution
legend("Recursiva", "Analítica", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'exercice05'), 'png');
hold off




%%  Exercício 6
%   y(0) = 1; y(1) = 0; k>=0
%   y(k+2) - ay(k+1) - by(k) = u(k);
%   pretty((partfrac( (1)/((z^2 - a*z - b)*(z-1)) + (z)/(z^2 -a*z -b) - (a)/(z^2 -a*z -b), z, 'FactorMode', 'full')*z ))


%   Recursive Solution
n       = 10;           % Interval Size
kr      = 0:n-1;        % Desired Interval

yr      = 0;
a       = 2;
b       = 2;
yr(1)   = 1;
yr(2)   = 0;            % Initial Conditions

sysOrder= 2;            % System Order

for j=0:n-1-sysOrder

    k = j+1;

    yr(k+2) = +a * yr(k+1) + b * yr(k) + 1;
end
figure; stairs(kr,yr)
title('Exercice 06'); xlabel('k [s]'); ylabel('y(k)')


%   Analytic Solution
ka = kr;                % Analytic Interval


[r0, p0, k0] = residue([0  1] ,  [1 (-a-1) (-b+a) b]);
[r1, p1, k1] = residue([1  0] ,  [0     1     -a -b]);
[r2, p2, k2] = residue([0 -a] ,  [0     1     -a -b]);


ya =      r0(1)*(p0(1)).^(ka-1) + r0(2)*(p0(2)).^(ka-1) + r0(2)*(p0(2)).^(ka-1);
ya = ya + r1(1)*(p1(1)).^(ka-1) + r1(2)*(p1(2)).^(ka-1);
ya = ya + r2(1)*(p2(1)).^(ka-1) + r2(2)*(p2(2)).^(ka-1); % Analytic Solution

ya(1)   = yr(1);    
ya(2)   = yr(2);    % Initial Conditions (use Heaviside Function instead)

hold on
stairs(ka,ya,'o');  % Adding the Analytic Solution
legend("Recursiva", "Analítica", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'exercice06'), 'png');
hold off




%%  Exercício 7
%   Condições Iniciais Nulas
%   y(k+1) = ay(k) + bu(k);
%   pretty((partfrac( (b)/((z - a)*(z-1)), z, 'FactorMode', 'full')*z ))


%   Recursive Solution
n       = 10;           % Interval Size
kr      = 0:n-1;        % Desired Interval

yr      = 0;
a       = 2;            % (!=1)
b       = 2;
yr(1)   = 0;            % Initial Conditions

sysOrder= 1;            % System Order

for j=0:n-1-sysOrder

    k = j+1;

    yr(k+1) = +a * yr(k) + b * 1;
end
figure; stairs(kr,yr)
title('Exercice 07'); xlabel('k [s]'); ylabel('y(k)')


%   Analytic Solution
ka = kr;                                    % Analytic Interval
ya = (-b/(a-1) * (+1).^(ka-1) + b/(a-1) * (a).^(ka-1)); % Analytic Solution
ya(1)   = yr(1);    % Initial Conditions (use Heaviside Function instead)

hold on
stairs(ka,ya,'o');  % Adding the Analytic Solution
legend("Recursiva", "Analítica", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'exercice07'), 'png');
hold off




%%  Exercício 8 (P1)
%   Condições Iniciais Nulas
%   u(k) = u(k-1) - u(k-2); Degraus 
%   y(k+2) - ay(k) = u(k);
%   pretty((partfrac( (1)/(z*(z - 1)*(z^2 - a)) - (1)/(z^2*(z - 1)*(z^2 - a)), z, 'FactorMode', 'full')*z ))


%   Recursive Solution
n       = 10;           % Interval Size
kr      = 0:n-1;        % Desired Interval

yr      = 0;
a       = 1;            % (!=0)
yr(1)   = 0;
yr(2)   = 0;            % Initial Conditions

sysOrder= 2;            % System Order

for j=0:n-1-sysOrder

    k = j+1;

    if (k>=1) && (k<2)
        yr(k+2) = +a * yr(k) + 1;
    else
        yr(k+2) = +a * yr(k) + 0;
    end
end
figure; stairs(kr,yr)
title('Exercice 08'); xlabel('k [s]'); ylabel('y(k)')


%   Analytic Solution
ka = kr;                                    % Analytic Interval
ya = ( (1/2*a^(-3/2)) * (sqrt(a)).^(ka-1) - (1/2*a^(-3/2)) * (-sqrt(a)).^(ka-1)); % Analytic Solution
ya(1)   = yr(1);
ya(2)   = yr(2);    % Initial Conditions (use Heaviside Function instead)

hold on
stairs(ka,ya,'o');  % Adding the Analytic Solution
legend("Recursiva", "Analítica", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'exercice08'), 'png');
hold off