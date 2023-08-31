load('7_coupe.mat'); % Replace with your own data
idx = find(vol); % find nonzero values in M
[Y,X,Z] = ind2sub(size(vol), idx);
% Define the super egg model function
super_egg = @(x, y, z, p, q, r) ((x.^2 + y.^2 + z.^p).^q) - r^q;

% Define the initial values of p, q, and r
p0 = 2; % initial value for p
q0 = 2; % initial value for q
r0 = 10; % initial value for r

% Define the optimization function for fitting the super egg to the pore space
opt_func = @(x) sum((super_egg(Y, X, Z, x(1), x(2), x(3)) - 1).^2);

% Perform the optimization to fit the super egg to the pore space
[x, fval] = fminsearch(opt_func, [p0, q0, r0]);

% Extract the optimized values of p, q, and r
p_opt = x(1);
q_opt = x(2);
r_opt = x(3);

% Evaluate the goodness of fit using RMSE
super_egg_model = super_egg(Y, X, Z, p_opt, q_opt, r_opt);
RMSE = sqrt(sum((super_egg_model - 1).^2)/length(super_egg_model));

% Plot the original pore space model and the fitted super egg model
figure;
scatter3(Y, X, Z, 1, 'filled', 'MarkerFaceColor', 'k');
hold on;
[x, y, z] = meshgrid(min(Y):1:max(Y), min(X):1:max(X), min(Z):1:max(Z));
super_egg_surface = super_egg(x, y, z, p_opt, q_opt, r_opt);
isosurface(x, y, z, super_egg_surface, 0);
axis equal;
xlabel('X');
ylabel('Y');
zlabel('Z');
legend('Pore Space Model', 'Super Egg Model');
title(sprintf('Super Egg Model Fit (RMSE = %.4f)', RMSE));