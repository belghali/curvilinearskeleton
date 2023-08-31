%calcul de centroid


statistiquesall20 = regionprops3(imgg_nv,'Volume','Centroid');%,'ConvexHull','ConvexVolume','Solidity','SurfaceArea','VoxelIdxList');
% statistiquesall50 = regionprops3(imgg50,'Volume','Centroid');%,'ConvexHull','ConvexVolume','Solidity','SurfaceArea','VoxelIdxList');
% statistiquesall80 = regionprops3(imgg80,'Volume','Centroid');%,'ConvexHull','ConvexVolume','Solidity','SurfaceArea','VoxelIdxList');


statistiquesall20 = sortrows(statistiquesall20,1,'descend');
% statistiquesall50 = sortrows(statistiquesall50,1,'descend');
% statistiquesall80 = sortrows(statistiquesall80,1,'descend');

statistiquesall20 = rmmissing(statistiquesall20);
% statistiquesall50 = rmmissing(statistiquesall50);
% statistiquesall80 = rmmissing(statistiquesall80);

t20 = array2table(occ50(:,1));
% t50 = array2table(occ50(:,1));
% t80 = array2table(occ80(:,1));

y20 = [t20 statistiquesall20];
 y20 = renamevars(y20,["Var1"],["Id"]);
% y50 = [t50 statistiquesall50];
% % y50 = renamevars(y50,["Var1"],["Id"]);
% y80 = [t80 statistiquesall80];
% y80 = renamevars(y80,["Var1"],["Id"]);

taille20 = size(y20);
% taille50 = size(y50);
% taille80 = size(y80);

q20=zeros(taille20(1),4);
% q50=zeros(taille50(1),4);
% q50=zeros(taille80(1),4);

for i = 1:taille20(1)
        q20(i,1)=y20(i,:).Id;
        q20(i,2)=y20(i,:).Centroid(1);
        q20(i,3)=y20(i,:).Centroid(2);
        q20(i,4)=y20(i,:).Centroid(3);
    
 end

% for i = 1:taille50(1)
%         q50(i,1)=y50(i,:).Id;
%         q50(i,2)=y50(i,:).Centroid(1);
%         q50(i,3)=y50(i,:).Centroid(2);
%         q50(i,4)=y50(i,:).Centroid(3);
%     
%  end
% for i = 1:taille80(1)
%         q80(i,1)=y80(i,:).Id;
%         q80(i,2)=y80(i,:).Centroid(1);
%         q80(i,3)=y80(i,:).Centroid(2);
%         q80(i,4)=y80(i,:).Centroid(3);
%     
%  end


stats20 = zeros(taille20(1),5);
stats20(:,1:4)=q20;
stats20(:,5)=occ50(:,2);
writematrix(stats20,'valerie_regions_nv.txt','Delimiter',' ');
% stats50 = zeros(taille50(1),5);
% stats50(:,1:4)=q50;
% stats50(:,5)=occ50(:,2);
% 
% stats80 = zeros(taille80(1),5);
% stats80(:,1:4)=q80;
% stats80(:,5)=occ80(:,2);
% 
%  
% X = q(:,2);
% Y = q(:,3);
% Z = q(:,4);
% 
% mat =readmatrix('C:\Users\zakar\Desktop\scripts\boules.txt');
% 
% X1 = mat(:,1);
% Y1 = mat(:,2);
% Z1 = mat(:,3);
% 
% figure
% plot3(X,Y,Z,'.','Color','r')
% hold on
% plot3(X1,Y1,Z1,'o','Color','c')
