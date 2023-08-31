function volto2D(vol3D,chemin,extension)

mkdir(chemin);
taille = size(vol3D);
cm=hsv(50);
for k=1:taille(3)
%     tmp = imcomplement(vol3D(:,:,k));
tmp = vol3D(:,:,k);
    nom_img = strcat(chemin,'image_', sprintf('%04d',k),...    %%
        string(extension)); 
    imwrite(tmp,cm,nom_img);
end
