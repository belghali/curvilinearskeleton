function [occ,max] = occur(A,n)
    start = tic;
    sprintf("Début de la fonction occur")
    unique_values = unique(A);
    counts = histc(A(:), unique_values);
    counts(1)=[];
    unique_values(1)=[];
    taille=size(unique_values);
    occ=int64(zeros(taille(1),2));
    occ(:,1)=unique_values;
    occ(:,2)=counts;
    max = occ(end/2);
    occ = sortrows(occ,2,'descend');
    for i = 1:n  %length(unique_values)
        fprintf('Value %d occurs %d times\n', occ(i,1), occ(i,2));
    end
    
    temps = toc(start);
    sprintf("Temps total en seconde est de %f",temps)
    
    
    