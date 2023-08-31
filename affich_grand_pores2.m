function [nv_img] = affich_grand_pores2(nouveaulabel,occ,n1,n2,max)
    start = tic;
    sprintf("Début de la fonction affich_grand_pore")
    taille = size(nouveaulabel);
    nv_img = zeros(taille);
    for i = n1:n2
        tmp = nouveaulabel;
        tmp(tmp~=occ(i,1))=0;
        nv_img = nv_img+tmp;
    end
%     g = nouveaulabel;
%     occtmp = occ(n1:n2,1);
%     for i=1:taille(1)
%         for j=1:taille(2)
%             for k=1:taille(3)
%                  if(g(i,j,k)~=0)
%                      if ( ~(ismember(g(i,j,k),occtmp)))
%                          g(i,j,k)= 2^16-1;
%                      end
%                  end
%                  if (nv_img(i,j,k)==0)
%                     nv_img(i,j,k)=nv_img(i,j,k)+g(i,j,k);
%                 end
%             end
%         end
%     end
%     
   
%    
%     
%     
    res = fix((2^16)/(n2-n1+1));
    j=n1;
    for i = 1:n2-n1+1
        nv_img(nv_img==occ(j,1))=res*i;
        j=j+1;
    end
  nv_img=uint16(nv_img);

% nv_img = nv_img+g;
    % Iterate over each voxel in the 3D image and assign the color
%     for x = 1:size(nv_img,1)
%         for y = 1:size(nv_img,2)
%             for z = 1:size(nv_img,3)
%                 for i = 1 : nbr
%                     if nv_img(x,y,z) == occ(i,1)
%                         % If the voxel is not equal to 0, assign the color
%                         nv_img(x,y,z) = color(i);
% %                         nv_img(x,y,z,2) = color(i,2);
% %                         nv_img(x,y,z,3) = color(i,3);
%                     end
%                 end
%             end
%         end
%     end
    temps = toc(start);
    sprintf("Temps total en seconde est de %f",temps)
    