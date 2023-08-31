function co = compt_pore(vol)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Auteur : BELGHALI Zakaria                                         %%
%      Superviseurs : MONGA Olivier & ABDELWAHED El Hassan               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DESCRIPTION                                                             %%
% Cette routine le nombre de pore dans un volume donné.                  %%
% Soit pour le squelette ou l'espace poral d'une manière générale.       %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%INPUT                                                                   %%
%) vol : la forme sur laquelle on souhaite calculer le nombre de pores   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%OUTPUT                                                                  %%
%) co : nombre de pore présent dans le volume.                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                        %%
% Récupération de la taille du volume de la forme.                       %%
    s = size(vol);                                                       %%
%                                                                        %%
% Initialisation du compteur.                                            %%
    co = 0;                                                              %%
%                                                                        %%
% Incrémentation du compteur pour chaque voxel égal à 1.                 %%
    for i = 1:s(1)                                                       %%
        for j = 1:s(2)                                                   %%
            for k = 1:s(3)                                               %%
%                                                                        %%
                if (vol(i,j,k) ~= 0)                                     %%
                    co = co+1;                                           %%
                end                                                      %%
%                                                                        %%
            end                                                          %%
        end                                                              %%
    end                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

