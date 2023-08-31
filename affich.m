function nv = affich(vol,new50)

    taille = size(vol);
    nv=uint16(vol);
    
    for i = 1:taille(1)
       for j = 1:taille(2)
           for k = 1:taille(3)
               if (new50(i,j,k)~=0)
                   nv(i,j,k)=new50(i,j,k);
               end
           end
       end
    end
    nv(nv==1)=2^16-1;