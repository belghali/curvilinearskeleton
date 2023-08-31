test = imgg;

for X = 7579:9999
    X
    testt=image_nv;
    for i =1:512*512*512
        if (test(i)~=X)
            testt(i)=0;
        end
    end
    if isempty(find(testt))
        ok = [];
    else
        ok = occur(testt,1);
    end
    struu(X).num = X;
    struu(X).tab=ok;
end