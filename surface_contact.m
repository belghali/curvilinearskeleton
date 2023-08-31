% Fonction qui calcule les surfaces de contacts entre les régions
% Input : matrix : image 3D qui contient les pores labélisés
%         occ : tableau qui contient les occurences des pores, on l'utilise
%         juste pour avoir le numero max du pore afin d'allouer une matrice
%         suffisante.
% Output : voisins : matrice triangulaire inférieure


%function [voisins,voisins_sparse] = surface_contact(matrix,occ)
function voisins = surface_contact(matrix,occ)
start = tic;
sprintf("Début de la fonction surface_contact")
 taille = max(occ(:,1));
 voisins = zeros(taille,taille);
for k = 1:size(matrix, 3)
    for i = 1:size(matrix, 1)
        for j = 1:size(matrix, 2)
            current_pixel = matrix(i, j, k);
            if current_pixel == 0 
                continue
            end
             if j == size(matrix,2)
                 neighbors = [i+1,j,k; i,j,k+1];
             elseif i == size(matrix,1)
                 neighbors = [ i,j+1,k; i,j,k+1];
             elseif k == size(matrix,3)
                 neighbors = [i+1,j,k; i,j+1,k];
             else
                 neighbors = [i+1,j,k; i,j+1,k; i,j,k+1];
             end
             if i == size(matrix,1) && j == size(matrix,2) 
                 neighbors = [i,j,k+1];
             end
             if k == size(matrix,3) && j == size(matrix,2) 
                 neighbors = [i+1,j,k];
             end
             if k == size(matrix,3) && i == size(matrix,1) 
                 neighbors = [i,j+1,k];
             end
             if k == size(matrix,3) && i == size(matrix,1) && j == size(matrix,2) 
                 continue
             end
            % Get the value of the neighbor
               for fois = 1:size(neighbors)
                   ii=neighbors(fois,1);
                   jj=neighbors(fois,2);
                   kk=neighbors(fois,3);
                   neighbor_pixel = matrix(ii, jj, kk);
                   if neighbor_pixel==0 
                       continue
                   end
                        % Increment the neighbor count for the current pixel
                   voisins(current_pixel, neighbor_pixel) = voisins(current_pixel, neighbor_pixel) + 1;
                   voisins(neighbor_pixel,current_pixel)= max(voisins(current_pixel, neighbor_pixel),voisins(neighbor_pixel,current_pixel));
                   voisins(current_pixel, neighbor_pixel) = voisins(neighbor_pixel,current_pixel);
               end
        end
    end
end
 for i = 1:taille
    voisins(i,i)=0;
    for j = i+1:taille
        voisins(i,j)=0;
    end
 end
%  voisins=sparse(voisins);
    temps = toc(start);
    sprintf("Temps total en seconde est de %f",temps)
    
    
