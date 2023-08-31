test1=po50;
test2=xi50;
test3=zeros(512,512,512);
inter=0;
for i = 1:512
    for j = 1:512
        for k = 1:512
            if (test1(i,j,k)>1.225 && test2(i,j,k)~=0)
                test3(i,j,k)=1;
                inter=inter+1;
            end


        end
    end
end