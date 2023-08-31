function bin_min(imdstore,chemin_img,nbr_min,nbr_max,region,extension)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Auteur : BELGHALI Zakaria                                         %%
%      Superviseurs : MONGA Olivier & ABDELWAHED El Hassan               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DESCRIPTION                                                             %%
% Cette fonction binarise les images et les minimalise en fonction de la %%
% raison d'intérêt spécifiée dans la variable "region".                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%INPUT                                                                   %%
%) imdstore : variable qui contient le datastore, là où sont stockées    %%
% les images, sinon vous pouvez enlever le commentaire n°1 pour créer    %%
% la variable datastore en précisant que imdstore est un chemin.         %%
%                                                                        %%
%) chemin_img : chemin du dossier, où on mettera les images binarisées.  %%
% Attention, le programme supprime le dossier ainsi que son contenu s'il %%
% existe déjà. Mais il en crée un tout nouveau.                          %%
%                                                                        %%
%) nbr_min : le numéro de la coupe par laquelle on commence.             %%
%) nbr_max : le numéro de la coupe par laquelle on termine.              %%
%                                                                        %%
%) region : tableau [X Y A B] qui contient la region d'intérêt dans      %%
% l'image.                                                               %%
% X est l'indice du pixel dans les abscisses.                            %%
% Y est l'indice du pixel dans les ordonnés.                             %%
% A et B sont les distances à parcourir dans les axes respectives        %%
% à partir du point X et Y.                                              %%
% Vous pouvez récuperer ce tableau en lançant la routine n°2 dans le     %%
% terminal sur une image et non depuis le programme.                     %%
% Puis sélectionner la région d'intérêt                                  %%
% et avec clique-droit vous copiez la position du cadre.                 %%
% Dans notre cas voir le commentaire n°3, enlevez le commentaire ou      %%
% spécifiez la région lors de l'appel.                                   %%
%                                                                        %%
%) extension : variable qui spécifie l'extension des images souhaitées.  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%COMMENTAIRE A METTRE OU A LAISSER                                       %%
% N° 1 :                                                                 %%
% imdstore = imageDatastore(imdstore);                                   %%
%                                                                        %%
% N° 2 :                                                                 %%
% image2 = imcrop(image)                                                 %%
%                                                                        %%
% N° 3 :                                                                 %%
% region = [467.5 411.5 1034 1028];                                      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                        %%
% % Suppression du dossier existant avec son contenu.                      %%
%      if exist(chemin_img,'dir')                                          %%
%          cd eval(chemin_img)                                           %%
%          delete *
%          cd ../
%      end                                                                 %%
%                                                                        %%
% Création du dossier cible.                                             %%
    if ~exist(chemin_img,'dir')                                          %%
        mkdir(chemin_img);                                               %%
    end                                                                  %%
%                                                                        %%
% Le filtre avec lequel on masque les artefacts,                         %%
% il dépend du jeu de données.                                           %%
%     masque = imread("filtre_sable.png");                                       %%
%     masque = masque(:,:,1);                                              %%
%                                                                        %%
% Les images commencent à 0.                                             %%
    for i = nbr_min +1 : nbr_max                                         %%
%                                                                        %%
% Lecture des images cibles avec le masque.                              %%
        img = readimage(imdstore,i);                                   %%
%                                                                        %%
% Nommage.                                                               %%
        nom_img = strcat(chemin_img,'image_', sprintf('%04d',i-1),...    %%
        string(extension));                                              %%
%                                                                        %%
% Binarisation avec Otsu.                                                %%
        img = (imcrop(img,region));                        %%
        img = img(:,:,2);
        img(img>85)=255;
        img(img<=85)=0;
        %img=imfill(imcomplement(img));
        %img=(imcomplement(img));
       % image_bin = imbinarize(img(:,:,2));%,'adaptive','Sensitivity',0.9);                                   %%
%                                                                        %%        
% Suivre la norme de 0 = noir et 255 = blanc.                            %%
%         image_bin = double(image_bin);                                   %%
%         image_bin(image_bin==1) = 255;                                   %%
%                                                                        %%        
% Addition entre l'image binaire et le masque.                           %%
%         image = image + uint8(masque);                             %%
%         image(image > 255) = 255;                                      %%
% %                                                                        %%        
% A mettre, si vous voulez minimiser les images selon la valeur de la    %%
% région spécifiée.                                                      %%
%                                                                        %%
        %Image3 = logical(imcrop(image2,[467.5 411.5 1034 1028]));       %%
%         image3 = logical(imcrop(image2,region));                        %%
%                                                                        %%        
% A mettre en commentaire si vous avez enlever les commentaires juste    %%
% en dessus pour ne pas mettre en conflit le nom des variables.          %%
        %image3 = logical(image2);                                                 %%
%                                                                        %%
% Ecriture des images dans le dossier spécifié dans "chemin_img".        %%
%         imwrite(image_bin,nom_img);                                         %%
          imwrite(imcomplement(img),nom_img);
    end                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%