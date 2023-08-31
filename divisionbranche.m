seul = 3;
j=size(test,2)+1;
for i = 1:size(test,2)
    i
    a = test(i).point;
    if (size(a,2)>seul)
        q = fix(size(a,2)/2);
        test(i).point = a(:,1:q);
        test(j).point = a(:,q:size(a,2));
        j=j+1;
    end
end
%#15 7 