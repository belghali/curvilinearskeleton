rows = zeros(max(occ(:,1)),1);
cols = zeros(max(occ(:,1)),1);
plans = zeros(max(occ(:,1)),1);
rows0 = zeros(max(occ(:,1)),1);
cols0 = zeros(max(occ(:,1)),1);
plans0 = zeros(max(occ(:,1)),1);
for i = 7397:size(occ,1)/2
    i
    n1=affich_grand_pores_sans_arriere(imgg,occ,i,i);
    d1= find(n1);
    xx = zeros(size(d1));
    yy = zeros(size(d1));
    zz = zeros(size(d1));
    sprintf("boucle de j de i = %d",i)
   for j=1:size(d1,1)
        j
        [xx(j),yy(j),zz(j)]=ind2sub(size(imgg),d1(j));
    end

    rows(i)=max(xx);
    cols(i)=max(yy);
    plans(i)=max(zz);
    rows0(i)=min(xx);
    cols0(i)=min(yy);
    plans0(i)=min(zz);

end