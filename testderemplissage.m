j=1;
k=1;
test=struu;
for i =1:18508
    if (~isempty(test(i).tab))
        new(j)=test(i);
        j=j+1;
    else
        old(k)=test(i);
        k=k+1;
    end




end


