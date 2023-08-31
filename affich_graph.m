function affich_graph(vol,noeud,lien)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Auteur : BELGHALI Zakaria                                         %%
%      Superviseurs : MONGA Olivier & ABDELWAHED El Hassan               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DESCRIPTION                                                             %%
% Cette routine affiche le graphe correspondant à "vol" à partir         %%
% de "noeud" et "lien".                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%INPUT                                                                   %%
%) vol : volume 3D initial pour lequel on souhaite afficher son graphe.  %%
%                                                                        %%
%) noeud : structure qui contient les noeuds du graphe.                  %%
%                                                                        %%
%) lien : structure qui contient les liens du graphes.                   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                        %%
% Récupération de la taille du volume.                                   %%
w = size(vol,1);                                                         %%
l = size(vol,2);                                                         %%
h = size(vol,3);                                                         %%
%                                                                        %%
% Création de fenêtre, où on mettera le graphe.                          %%
figure();                                                                %%
hold on;                                                                 %%
%                                                                        %%
% Parcours la liste des noeuds contenue dans la variable "noeud".        %%
for i=1:length(noeud)                                                    %%
%                                                                        %%    
% Récupération des coordonnées du ième noeud.                            %%
    x1 = noeud(i).comx;                                                  %%
    y1 = noeud(i).comy;                                                  %%
    z1 = noeud(i).comz;                                                  %%
%                                                                        %%    
    if(noeud(i).ep==1)                                                   %%
% Mettre en bleu-ciel. les noeuds extrêmes                               %%
        ncol = 'c';                                                      %%
    else%                                                                %%
% Mettre en rouge les noeuds internes (ses voisins >= 2).                %%
        ncol = 'r';                                                      %%
    end                                                                  %%
%                                                                        %%
% Tracer toutes les connexions de chaque noeud.                          %%
    for j=1:length(noeud(i).links)                                       %%
        for k=1:length(lien(noeud(i).links(j)).point)-1                  %%
            [x3,y3,z3]=...                                               %%
                ind2sub([w,l,h],lien(noeud(i).links(j)).point(k));       %%
            [x2,y2,z2]=...                                               %%
                ind2sub([w,l,h],lien(noeud(i).links(j)).point(k+1));     %%
            line([y3 y2],[x3 x2],[z3 z2],'Color','k','LineWidth',2);     %%
        end                                                              %%
    end                                                                  %%
%                                                                        %%
% Tracer les noeuds.                                                     %%
    plot3(y1,x1,z1,'o','Markersize',9,'MarkerFaceColor',...              %%
        ncol,'Color','k');                                               %%
end                                                                      %%
%                                                                        %%
% Paramètres de la figure.                                               %%
axis image;axis off;                                                     %%
set(gcf,'Color','white');                                                %%
drawnow;                                                                 %%
view(-17,46);                                                            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%