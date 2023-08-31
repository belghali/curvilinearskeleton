function image3d = img3d(imdstore)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Auteur : BELGHALI Zakaria                                         %%
%      Superviseurs : MONGA Olivier & ABDELWAHED El Hassan               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DESCRIPTION                                                             %%
% A partir d'un datastore, on lit les images 2D et on les transforme en  %%
% volume 3D.                                                             %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%INPUT                                                                   %%
%) imdstore : variable qui contient le datastore, là où sont stockées    %%
% les images, sinon vous pouvez enlever le commentaire n°1 pour créer    %%
% la variable datastore en précisant que imdstore est un chemin.         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%OUTPUT                                                                  %%
%) image3d : volume résultat.                                            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%COMMENTAIRE A METTRE OU A LAISSER                                       %%
% N° 1 :                                                                 %%
% imdstore = imageDatastore(imdstore);                                   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                        %%
% Lecture de la première image du datastore.                             %%
    image3d = readimage(imdstore,1);
%      image3d(image3d==255)=1;
     %image3d = imcomplement(image3d);                                     %%
%                                                                        %%
% Lecture des autres images et concatnation entre eux à fur              %%
% et mesure que laboucle itére.                                          %%
%                                                                        %%
    for i = 2:length(imdstore.Files) 
        i %%
%                                                                        %%
        image = readimage(imdstore,i);
%          image(image==255)=1;
        % image = imcomplement(image);                                     %%
%         image3d = logical(cat(3,image3d,image));                                  %%
        image3d = cat(3,image3d,image);                                  %%

        %                                                                        %%
    end   
    %image3d=imcomplement(image3d);%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%