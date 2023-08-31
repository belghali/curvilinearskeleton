% Load maximal sphere data
data = load('jouini_994.txt');
x = data(:,1);
y = data(:,2);
z = data(:,3);
% Compute maximal spheres
r = 1;
c = [x, y, z];
[center, r] = minboundball(c,r,'smt');
while r > 0
    r = r-1;
    [center, r] = minboundball(c,r,'smt');
end
radii = max(center,[],1) - min(center,[],1);
center = mean(center,1);

% Compute orientation of the ellipsoid
eig_vals = eig(cov(c));
[~, ind] = sort(eig_vals);
x_dir = eig_vec(:,ind(1));
y_dir = eig_vec(:,ind(2));
z_dir = eig_vec(:,ind(3));
orientation = [x_dir, y_dir, z_dir];

% Concatenate center, radii, and orientation into a single parameter vector
params = [center; radii; reshape(orientation,1,9)];

% Define cost function for lsqnonlin optimization
cost_fun = @(params) sum((sqrt(sum(((c - repmat(params(1:3), size(c,1),1))*reshape(params(4:12),[3,3])').^2,2)) - 1).^2);

% Run optimization to find best-fit ellipsoid parameters
params = lsqnonlin(cost_fun, params);

% Extract center, radii, and orientation from parameter vector
center = params(1:3);
radii = params(4:6);
orientation = reshape(params(7:15),[3,3]);

% Visualize ellipsoid fit
figure;
scatter3(x, y, z, 10, 'filled');
hold on;
plot_ellipsoid(center, radii, orientation);
axis equal;
xlim([min(x), max(x)]);
ylim([min(y), max(y)]);
zlim([min(z), max(z)]);
disp(['Center: [', num2str(center), ']']);
disp(['Radii: [', num2str(radii), ']']);
disp(['Orientation: [', num2str(orientation(:)'), ']']);