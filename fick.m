% Parametres
L = 1;           % longueur du segment (m)
D = 1e-5;        % coefficient de diffusion (m^2/s) % 1e-5 = 10 puissance (-5)
tEnd = 3600;     % temps (s)
N = 100;         % nombre de points dans le segment
dx = L/N;        % espacement entre les points (m)
dt = 0.01;       % temps du pas (s)

% Conditions initiales
C0 = 1;          % concentration initiale (mol/m^3)
C = C0 * ones(N, 1);    % vecteur de concentration en 1D

% Conditions des frontières
C(1) = 0;        % frontière gauche
C(N) = 0;        % frontière droite

% boucle de simulation
for t = 0:dt:tEnd
    % Calcul de la concentration
    dCdx = (C(2:end) - C(1:end-1)) / dx;
    
    % Utilisation de la loi de Fick
    C(2:end-1) = C(2:end-1) + D * dt / dx^2 * (C(3:end) - 2 * C(2:end-1) + C(1:end-2));
    
    % Application des conditions des frontières
    C(1) = 0;
    C(N) = 0;
end

% Affichage de courbe
x = linspace(0, L, N)';
plot(x, C);
xlabel('Distance (m)');
ylabel('Concentration (mol/m^3)');
