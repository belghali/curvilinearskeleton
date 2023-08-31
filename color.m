
for i = 1:512
    i
    bb = affich_grand_pores_sans_arriere(image_res(:,:,i),occ_boules,n1,n2);
%bb = image_res(:,:,i);
    nom = strcat('boulespi_',sprintf('%04d',i),'.tiff');
    imwrite(imcomplement(bb),nom);

end
