fich = readmatrix('jouini994.txt');
X=fich(1:200,1);
Y=fich(1:200,2);
Z=fich(1:200,3);
% Define the super egg model function
super_egg = @(x,y,z,p,q,r) (x.^2 + y.^2 + z.^p).^q - r.^q;

% Define the objective function
obj_fun = @(p) sum((super_egg(X,Y,Z,p(1),p(2),p(3)) - vol).^2);

% Use the lsqnonlin function to fit the parameters of the super egg model
p0 = [1.5, 2, 50]; % Initial parameter values
p_fit = lsqnonlin(obj_fun, p0);

% Evaluate the goodness of fit
P_fit = super_egg(X,Y,Z,p_fit(1),p_fit(2),p_fit(3));
RMSE = sqrt(mean((P_fit - vol).^2));
% sss= size(idx)
% 
% for i = 1:sss(1)
%     
% end    
% X(rr(i),cc(i)) == v(i)

% Plot the pore space and the super egg model
figure;
isosurface(X,Y,Z,vol,0.5); % Pore space
hold on;
isosurface(X,Y,Z,super_egg(X,Y,Z,p_fit(1),p_fit(2),p_fit(3)),0.5); % Super egg model
axis equal;
legend('Pore space','Super egg model');
