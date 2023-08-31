n2=zeros(size(f2,1),1);
n3=zeros(size(f3,1),1);
for i=1:size(f2)
    n2(i,1) = imgg(f2(i));
end
for i=1:size(f3)
    n3(i,1) = imgg(f3(i));
end

plan = 2;
taille = size(imgg);
for i = 1:taille(1)
    for j = 1:taille(2)
        if (imgg(i,j,plan)~=0)
            coord(i+j-1)=sub2ind(taille,i,j,plan);
        end
    end
end

plan2=imgg(:,:,1:2);
s = size(zz);
label = 18509;
for i = 1:s(1)
    plan2(plan2==zz(i))=label;
    label= label+1;

end




