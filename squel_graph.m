function [squel,noeud,lien] = squel_graph(vol,nbrbr)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Auteur : BELGHALI Zakaria                                         %%
%      Superviseurs : MONGA Olivier & ABDELWAHED El Hassan               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%INSPIRATION                                                             %% 
% [1] Kollmannsberger, Kerschnitzki et al.,                              %%
% "The small world of osteocytes: connectomics of the lacuno-canalicular %%
% network in bone." New Journal of Physics 19:073019, 2017.              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DESCRIPTION                                                             %%
% Cette fonction permet de créer un graphe et un squelette d'un volume 3D%%
% inspirée et aidée par le papier cité ci-dessus.                        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%INPUT                                                                   %%
%) vol : volume sur lequel nous allons calculer le squelette et le graphe%%
% correspondant.                                                         %%
%                                                                        %%
% nbrbr : taille minimale des branches du squelette.                     %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%OUTPUT                                                                  %%
%) squel : variable qui contient le squelette curviligne 3D du vol.      %%
%                                                                        %%
%) noeud : structure de données qui contient les noeuds du graphes.      %%
%                                                                        %%
%) lien : structure de données qui contient les liens entre différentes  %%
% branches.                                                              %%
%                                                                        %%
%) A : matrice d'adjacence du graphe.                                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                        %%
% On récupère les dimensions du volume : (x,y,z) = (w,l,h)               %%
% start = tic;
% sprintf("Début de la fonction squel_graph")
w = size(vol,1);                                                         
l = size(vol,2);                                                        
h = size(vol,3);                                                        
% start2 = tic;
sprintf("Début de bwskel")                     
% Calcul de l'axe médian avec l'amincissement topologique.               %%
squeltmp = bwskel(vol,'MinBranchLength',nbrbr);
% temps = toc(start2);
% sprintf("Temps de bwskel en seconde est de %f",temps)

% initial step: condense, convert to voxels and back, detect cells.      %%
% start3 = tic;
% sprintf("Début du premier appel de skel2GRaph3D")
[nodetmp,linktmp] = Skel2Graph3D(squeltmp,nbrbr);                      %%
% temps = toc(start3);
% sprintf("Temps du premier appel de skel2GRaph3D en seconde est de %f",temps)
% noeud = nodetmp;
% lien = linktmp;
% squel = squeltmp;
%                                                                        %%
%Taille totale du réseau.                                               %%
%wl = sum(cellfun('length',{nodetmp.links}));                             %%
                                                                       %%
squel = Graph2Skel3D(nodetmp,linktmp,w,l,h);                             %%
% start4 = tic;
% sprintf("Début du deuxieme appel de skel2GRaph3D")
% temps = toc(start4);
% sprintf("Temps du premier appel de skel2GRaph3D en seconde est de %f",temps)
[noeud,lien] = Skel2Graph3D(squel,2);                                  %%
                                                                       %%
% Nouvelle taille totale du réseau.                                      %%
%wl_new = sum(cellfun('length',{noeud.links}));                           %%
%                                                                        %%
% Itération jusqu'à l'amélioration de la taille du réseau.               %%
% start5 = tic;
% sprintf("Début de boucle d'optimisation")
% % while(wl_new~=wl)                                                        %%
% % %                                                                        %%
% %     wl = wl_new;                                                         %%
% %     squel = Graph2Skel3D(noeud,lien,w,l,h);                              %%
% %     [noeud,lien] = Skel2Graph3D(squel,0);                              %%
% %     wl_new = sum(cellfun('length',{noeud.links}));                       %%
% % %                                                                        %%
% % end
% temps = toc(start5);
% sprintf("Temps de la boucle d'optimisation en seconde est de %f",temps)%%
% temps = toc(start);
% sprintf("Temps total en seconde est de %f",temps)