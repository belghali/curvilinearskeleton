function nv_img = affich_grand_pores(nouveaulabel,occ,nbr,max)
    start = tic;
    sprintf("Début de la fonction affich_grand_pore")
    nv_img = zeros(size(nouveaulabel));
    for i = 1:nbr
        tmp = nouveaulabel;
        tmp(tmp~=occ(i,1))=0;
        nv_img = nv_img+tmp;
    end
    g = nouveaulabel;
    g(g~=0) = max+1;
    nv_img = nv_img+g;
    res = fix(1024/nbr);
    nv_img = single(nv_img);
    for i = 1 : nbr
        nv_img(nv_img==occ(i,1))=res*i;
    end
    temps = toc(start);
    sprintf("Temps total en seconde est de %f",temps)
    