
for i = 25:27
    i
    %bb = affich_grand_pores_sans_arriere(imgg_nv3(:,:,i),occ50,1,259299);
    nom = strcat('ii_',sprintf('%04d',i),'.tiff');
    nom
    bb=imgg_nv3(:,:,i);
    imwrite(bb,nom);

end
