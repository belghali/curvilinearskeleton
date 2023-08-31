
test0=zeros(512,512,512);
test1=uint16(zeros(512,512,512));
for i = 1:100
    i
    test0 = affich_grand_pores_sans_arriere(imgg,old(i).num,i,i);
    test1=test1+test0;


end