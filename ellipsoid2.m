% Load maximal sphere data
data = load('jouini_994.txt');
x = data(1:200,1);
y = data(1:200,2);
z = data(1:200,3);
r = data(1:200,4); % Convert r to numerical array

% Calculate convex hull of maximal spheres
k = convhulln([x,y,z]);

% Define initial guess for ellipsoid parameters
center = mean([x,y,z]);
radii = max(r)*ones(1,3);
orientation = eye(3);

% Define cost function for lsqnonlin optimization
cost_fun = @(params) sum((sqrt(sum(((k - repmat(params(1:3), size(k,1),1)).*params(4:6).^2).^2,2)) - 1).^2);


% Optimize ellipsoid parameters using lsqnonlin
params = lsqnonlin(cost_fun, [center; radii; orientation]);

% Visualize fitted ellipsoid
figure;
[X, Y, Z] = ellipsoid(params(1), params(2), params(3), params(4), params(5), params(6), 100);
trisurf(k,x,y,z,'FaceColor','red','FaceAlpha',0.5);
hold on;
surf(X, Y, Z)
axis equal;
xlabel('X');
ylabel('Y');
zlabel('Z');