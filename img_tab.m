function img = img_tab(lien,taille)
% SCRIPT : transforme un tableau en une image de taille 'taille'
% La boucle commence par 2 parce que la premiere ligne du tableau est 0.
    img = zeros(taille);
    s  =size(lien);
   
    for i=2:s(1)
        img(lien(i,1))=lien(i,2);
    end


