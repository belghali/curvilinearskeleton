%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Auteur : BELGHALI Zakaria                                         %%
%      Superviseurs : MONGA Olivier & ABDELWAHED El Hassan               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DESCRIPTION                                                             %%
% Ce fichier permet d'appeler les fonctions unies.                       %%
% Pour plus d'informations sur les fonctions, veuillez lire les codes    %%
% sources propres aux fonctions.                                         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%VARIABLE                                                                %%
%) dtstr : chemin qui contient les images.                               %%
%                                                                        %%
%) folder_img : chemin où stocker les images binaires.                   %%
%                                                                        %%
%) min et max : indice de coupe pour le traitement (début et fin).       %%
%                                                                        %%
%) nbrbr : taille minimale des branches du squelette.                    %%
%                                                                        %%
%) region : à utiliser si on souhaite avoir une image réduite, veuillez  %%
% regarder le code de "bin_min.m" pour plus d'informations.              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close                                                                    %%
% clear all                                                                %%
%                                                                        %%
 %start=tic;  
 dtstr = "C:\Users\zakar\Desktop\Sable\sandhigh\";          %%
% %dtstr = 'C:\Users\zakar\Desktop\DATASET\WO_ML_micro3D_deep_2_H2057 [2016-03-24 09.33.29]\BMP_8bits';
% % dtstr='C:\Users\zakar\Desktop\orig';
 folder_img ='C:\Users\zakar\Desktop\DATASET\sa333\';    %%
% % % %                                                                        %%
 imdstore = imageDatastore(dtstr);                                        %%
% % % % %                                                                        %%
 min = 100;                                                                 %%
 max = 612;                                                               %%
 nbrbr = 0;                                                               %%
 region = [459.5 560.5 511 511];%[467.5 411.5 1034 1028];                                        %%
% % % % %                                                                        %%
 bin_min(imdstore,folder_img,min,max,region,'.tif');                      %%
 imgstore = imageDatastore(folder_img);                                   %%
% % % %                                                                        %%
% %  %vol = logical(img3d(imgstore
 vol20 = logical(img3d(imgstore));
% vol50 = logical(dd50);
% vol80 = logical(dd80);%%
% volshow(vol20);                                                            %%                                                                      %%
 [squel20,noeud20,lien20] = squel_graph(vol20,nbrbr);                       
% %   [squel50,noeud50,lien50] = squel_graph(vol50,nbrbr);                           %%
% %   [squel80,noeud80,lien80] = squel_graph(vol80,nbrbr);                           %%
%   % % % affich_graph(vol,noeud,lien);                                            %%
% % % % %                                                                        %%
% nbr_pore20 = compt_pore(vol20);                                              
% %    nbr_pore50 = compt_pore(vol50);                                              %%
% %    nbr_pore80 = compt_pore(vol80);                                              %%
% %%
% % % % % %                                                                        %%
% [dist20,id20] = calc_dist(squel20,vol20);                                        %%
% % [dist50,id50] = calc_dist(squel50,vol50);                                        %%
% % [dist80,id80] = calc_dist(squel80,vol80);                                        %%
% % % % %                                                                        %%
% % tab_lien = struct_tab(lien);
% tab_lienn20 = struct_tab(lien20);
% % tab_lienn50 = struct_tab(lien50);
% % tab_lienn80 = struct_tab(lien80);
% sprintf("ok1")
% 
% fo20 = img_tab(tab_lienn20,size(vol20));
% % fo50 = img_tab(tab4,size(vol50));
% % fo80 = img_tab(tab_lienn80,size(vol80));
% sprintf("ok2")
% 
% imgg20=lab_squel(id20,fo20);
% % imgg50=lab_squel(id50,fo50);
% % imgg80=lab_squel(id80,fo80);
% 
% sprintf("ok3")
% temps1=toc(start);
% occ20 = occur(imgg20,10);
% % occ50 = occur(imgg50,10);
% % occ80 = occur(imgg80,10);
% 
% %new50 = affich_grand_pores2(imgg20,occ20,1,15);
% % %nv = affich(vol,new50);
% % cen
% % writematrix(stats,'regions_133608.txt','Delimiter',' ');
% %  sprintf("ok")
% % 
% % vv20=surface_contact(imgg20,occ20);
% % writeanymatrix
% % genere_plan
% temps = toc(start);
% sprintf("Temps total en seconde est de %f",temps)
%     
%  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%