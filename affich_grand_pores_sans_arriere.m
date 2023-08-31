function nv_img1 = affich_grand_pores_sans_arriere(nouveaulabel,occ,n1,n2)
%function [nv_img1,nv_img2,nv_img3] = affich_grand_pores_sans_arriere(nouveaulabel,occ,n1,n2)
    
start = tic;

    sprintf("Début de la fonction affich_grand_pore")
    taille = size(nouveaulabel);
    nv_img1 = zeros(taille);
%     nv_img2 = zeros(taille);
%     nv_img3 = zeros(taille);

    for i = n1:n2
       
%         if i <= 799
%             i
%             1       
            tmp = nouveaulabel;
            tmp(tmp~=occ(i,1))=0;
           % tmp(tmp~=occ(i))=0;
            nv_img1 = nv_img1+tmp;
%             nv_img2 = nv_img2+tmp;
%             nv_img3 = nv_img3+tmp;
%         end
%         if i>799 && i <=3188
%             i
%             2
%              tmp = nouveaulabel;
%             tmp(tmp~=occ(i,1))=0;
%             %tmp(tmp~=occ(i))=0;
%             nv_img2 = nv_img2+tmp;
%             nv_img3 = nv_img3+tmp;
%         end
%         if i >3188 && i<= 7906
%             i
%             3
%              tmp = nouveaulabel;
%             tmp(tmp~=occ(i,1))=0;
%             %tmp(tmp~=occ(i))=0;
%             nv_img3 = nv_img3+tmp;
%         end
    end 
    res = fix((2^64)/(n2-n1+1));
    j=n1;
    for i = 1:n2-n1+1
        nv_img1(nv_img1==occ(j,1))=res*i;
        %nv_img1(nv_img1==occ(i))=res*i;

        j=j+1;

    end
%   nv_img=uint16(nv_img);

    temps = toc(start);
    sprintf("Temps total en seconde est de %f",temps)
    