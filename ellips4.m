% Load maximal sphere data
data = readmatrix('jouini_994.txt');
x = data(:,1);
y = data(:,2);
z = data(:,3);
r = data(:,4);
% Calculate convex hull of maximal spheres
k = convhulln([x,y,z]);

% Define initial guess for ellipsoid parameters
center = mean([x,y,z]);
radii = max(r)*ones(1,3);
orientation = eye(3);

% Concatenate parameters into a single vector
params0 = [center(:); radii(:); orientation(:)];

% Define cost function for lsqnonlin optimization
cost_fun = @(params) sum((sqrt(sum(((k - repmat(params(1:3).', size(k,1),1)).*reshape(params(4:6),[1,3]).*reshape(params(7:15),[3,3])).^2,2)) - 1).^2);

% Optimize ellipsoid parameters using lsqnonlin
params = lsqnonlin(cost_fun, params0);

% Reshape parameters into original format
center = reshape(params(1:3), [1, 3]);
radii = reshape(params(4:6), [1, 3]);
orientation = reshape(params(7:end), [3, 3]);

% Visualize fitted ellipsoid
figure;
[X, Y, Z] = ellipsoid(center(1), center(2), center(3), radii(1), radii(2), radii(3), 100);
trisurf(k,x,y,z,'FaceColor','red','FaceAlpha',0.5);
hold on;
surf(X, Y, Z, 'FaceColor', 'blue', 'EdgeColor', 'none', 'FaceAlpha', 0.5);
axis equal;
xlabel('X');
ylabel('Y');
zlabel('Z');