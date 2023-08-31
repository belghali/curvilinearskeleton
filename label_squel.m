function nv_label = label_squel(id,lien)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Auteur : BELGHALI Zakaria                                         %%
%      Superviseurs : MONGA Olivier & ABDELWAHED El Hassan               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%OUTPUT                                                                  %%
%) nv_label : image 3D (matrice) qui contient la forme segmentée         %%
% et labeliser avec les branches du squelette curviligne.                %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                        %%
% Récupération de la taille des arguments.                               %%
s = size(id);                                                            %%
s1 = size(lien);  
% On divise la taille du tableau lien en quartiles.
% Pour diviser le temps du parcours par 4.
q1= fix(s1(1)/4);
q2= fix(s1(1)/2);
q3= fix(s1(1)*3/4);
%                                                                        %%
% Création d'une image 3D vide.                                          %%
nv_label = zeros(s(1),s(2),s(3));                                        %%

for i = 1 : s(1)                                                         %%
    for j = 1 : s(2)                                                     %%
        for k = 1 : s(3)                                                 %%
% Si le voxel est différent de , on entre dans la condition.             %%
             if (id(i,j,k) ~= 0)                                         %%
% Parcours selon la taille des liens.                                    %%
                if(id(i,j,k)<lien(q1,1))
                    max = q1;
                    min = 1;
                elseif(id(i,j,k)<lien(q2,1))
                    max = q2;
                    min=q1;
                elseif(id(i,j,k)<lien(q3,1))
                    max = q3;
                    min = q2;
                else
                    max = s1(1);
                    min = q3;
                end
                for l = min : max                                       
% On cherche l'indice du voxel dans l'ensemble des points de la branche. 
                    if (lien(l,1) == id(i,j,k))              
% Si on trouve l'indice, on lui affecte le label de la branche.           
                         nv_label(i,j,k) = lien(l,2);
                    end                                                     
                end                                                         
            end                                                              
        end                                                                  
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%