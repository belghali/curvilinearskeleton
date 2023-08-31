dimx = 512;
dimy = 512;
dimz = 512;
% vv=imcomplement(vol20);
vv=imgg20;
nom_txt = "sable_high_etiq2.txt";
fid = fopen(nom_txt,'w');
% ecriture des images dans le fichier
for z=1:dimz
    z
    for x=1:dimx
        
        for y=1:dimy
            
            entier = vv(x,y,z);
            fprintf(fid,'%d ',entier);
        end
    end
end
fclose(fid);