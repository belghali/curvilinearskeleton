nv=zeros(512,512,512);
lab=imgg20;
ss=squel20;
for i = 1:512
    for j = 1:512
        for k = 1:512
            if(lab(i,j,k)~=0 && ss(i,j,k)~=0)
                nv(i,j,k)=lab(i,j,k);
            end

        end
    end
end
nv(nv>10000)=0;
nv(nv<9500)=0;

for i = 1:500
    nv(nv==i)=3e+12*i;



end
