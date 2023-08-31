function tab_lien = struct_tab(lien)
% Fonction qui prends en entrée la structure de données lien et puis donne
% le tableau correspondant en 2 dimensions. 
% La 1ère colonne : Valeur des points des branches.
% La 2ème colonne : valeur du label, qui est autre quelle numéro de la
% branche.
% Aussi cet algorithme tri tableau à la fin pour améliorer la rapidité
% du parcours dans le tableau de lien.

s1 = size(lien);                                                    
tab_lien = zeros(1,2);
for i = 1:s1(2)
    i
    p = size(lien(i).point);
    tab=zeros(p(2),2);
    for j = 1:p(2)
        tab(j,1)=lien(i).point(j);
        tab(j,2)=lien(i).label;
    end
    tab_lien = cat(1,tab_lien,tab);
end