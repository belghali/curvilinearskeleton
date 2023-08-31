function squel = Graph2Skel3D(node,link,w,l,h)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Auteur : BELGHALI Zakaria                                         %%
%      Superviseurs : MONGA Olivier & ABDELWAHED El Hassan               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DESCRIPTION                                                             %%
% Cette routine transforme un graphe de noeuds en squelette.             %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%INSPIRATION                                                             %%
% [1] Kollmannsberger, Kerschnitzki et al.,                              %%
% "The small world of osteocytes: connectomics of the lacuno-canalicular %%
% network in bone." New Journal of Physics 19:073019, 2017.              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%INPUT                                                                   %%
%) noeud : structure qui contient les noeuds du graphe.                  %%
%                                                                        %%
%) lien : structure qui contient les liens du graphes.                   %%
%                                                                        %%
%) w, l et h : dimension du squelette souhaité avoir.                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%OUTPUT                                                                  %%
%) squel : variable qui contiendra le squelette.                         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                        %%
% Création d'image binaire qui contient des zéros.                       %% 
squel = false(w,l,h);                                                    %%
%                                                                        %%
% Parcours des noeuds.                                                   %%
for i=1:length(node)                                                     %%
%                                                                        %%
% Si le noeud a des liens, on entre dans la condition.                   %%
    if(~isempty(node(i).links))                                          %%
%                                                                        %%
% Soit index du noeud égal à X, on transforme le Xème voxel du squelette %%
% en valeur positive.                                                    %%
        squel(node(i).idx)=true;                                         %%
%                                                                        %%
% Récupération de l'index des voxels extrêmes aux liens                  %%
% du noeud courrant.                                                     %%
        a = [link(node(i).links(node(i).links>0)).point];                %%
%                                                                        %%
        if(~isempty(a))                                                  %%
            squel(a)=1;                                                  %%
        end                                                              %%
%                                                                        %%
    end                                                                  %%
end                                                                      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

