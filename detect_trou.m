z=1;
sz=[512 512 512];
for k = 270:272
    for i = 1:512
        for j = 1:512
            if (vol20(i,j,k)==1 && imgg20(i,j,k)==0)
                trous111(z,1)=i;
                trous111(z,2)=j;
                trous111(z,3)=k;
                trous111(z,4)=sub2ind(sz,i,j,k);
                z=z+1;
                         

            end
        end
    end
end