tab1=tab_lienn20;
tab2=zeros(size(trous11,1),2);
tab2(:,1)=trous11(:,4);
tab3=[tab1;tab2];
tab4=sortrows(tab3,1);

taille=size(tab4);
for i = 2:taille(1)
    z=1;
    if (tab4(i,2)==0)
        ok=1;
        while(ok)
            ok=0;
            if (tab4(i+z,2)==0)
                ok=1;
            else
                tab4(i,2)=tab4(i+z,2);
            end
            if (tab4(i-z,2)==0 && ok==1)
                z=z+1;
            else
                tab4(i,2)=tab4(i-z,2);
                ok=0;
            end
        end
    end
end


fo50 = img_tab(tab4,size(vol20));

imgg_nv3=lab_squel(id20,fo50);
occ50 = occur(imgg_nv3,10);