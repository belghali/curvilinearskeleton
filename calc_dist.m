function [dist,id] = calc_dist(squel,vol)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Auteur : BELGHALI Zakaria                                         %%
%      Superviseurs : MONGA Olivier & ABDELWAHED El Hassan               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DESCRIPTION                                                             %%
% Cette routine détermine la branche de l'axe médian la plus proche aux  %%
% points de la forme en utilisant la carte des distance, par défaut on   %%
% calcul cette mesure avec la distance euclidienne, sinon vous pouvez    %%
% préciser la méthode désirée dans la ligne n° 32 (reférer-vous dans la  %%
% documentation officielle de MATLAB sur "bwdist".                       %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%INPUT                                                                   %%
%) squel : variable qui contient le squelette curviligne.                %%
%                                                                        %% 
%) vol : la forme sur laquelle on souhaite calculer la distance entre    %%
% ses points et les branches du squelette.                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%OUTPUT                                                                  %%
%) dist : variable où on stocke dans chaque voxel la plus courte         %%
% distance au squelette.                                                 %%
%                                                                        %%
%) id : variable où on stocke dans chaque voxel l'id du point du         %%
% squelette le plus proche.                                              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                        %%
% Récupération de la taille du volume de la forme.                       %%
    s = size(vol);                                                       %%
%                                                                        %%
% Calcul de la distance euclienne du squelette pour les voxels du fond.  %%
    [dist,id] = bwdist(squel);                                           %%
%                                                                        %%
    for i = 1:s(1)                                                       %%
        for j = 1:s(2)                                                   %%
            for k = 1:s(3)                                               %%
%                                                                        %%
% Si les points du fond du squelette tombent dans la formeon garde les   %%
% valeurs de id et dist relatives à la position, sinon on mets avec un 0.%%
%                                                                        %%
                if (vol(i,j,k) == 0)                                     %%
                    id(i,j,k) = 0;                                       %%
                    dist(i,j,k) = 0;                                     %%
                end                                                      %%
%                                                                        %%
            end                                                          %%
        end                                                              %%
    end                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%