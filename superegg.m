sprintf('ok')
load('7_coupe.mat'); % Replace with your own data
idx = find(vol); % find nonzero values in M
[Y,X,Z] = ind2sub(size(vol), idx);
% Define the initial values of the parameters
p0 = 1.5; % Initial value of p
q0 = 2; % Initial value of q
r0 = 50; % Initial value of r

% Define the super egg model function
super_egg = @(x,y,z,p,q,r) (x.^2 + y.^2 + z.^p).^q - r.^q;

% Define the objective function for least squares fitting
obj_fun = @(p) sum((super_egg(X,Y,Z,p(1),p(2),p(3)) - P).^2);

% Fit the super egg model to the 3D pore space using least squares
options = optimset('Display','iter','MaxIter',1000);
p_fit = fminsearch(obj_fun,[p0 q0 r0],options);

% Evaluate the goodness of fit
P_fit = super_egg(X,Y,Z,p_fit(1),p_fit(2),p_fit(3));
RMSE = sqrt(mean((P_fit - P).^2));

% Plot the pore space and the super egg model
figure;
isosurface(X,Y,Z,P,0.5); % Pore space
hold on;
isosurface(X,Y,Z,super_egg(X,Y,Z,p_fit(1),p_fit(2),p_fit(3)),0.5); % Super egg model
axis equal;
legend('Pore space','Super egg model');