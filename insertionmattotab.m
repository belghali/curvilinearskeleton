% test2=image_nv;



% for i = 1:512
%     for j = 1:512
%         for k = 1:512
%             if (squel(i,j,k)~=1)
%                 test2(i,j,k)=0;
%             end
%         end
%     end
% end

p=1;
for i =1:18509
    tab0(i).num=i;
    tab0(i).boules=[];

    if i == 18509
        tab0(i).num=0;
        tab0(i).boules=[];
    end
end

for i = 1:512
    for j = 1:512
        for k = 1:512
            
            if (test(i,j,k)~=0 || test2(i,j,k)~=0)
                p
                if test(i,j,k)==0
                    tab0(18509).boules(end+1)=test2(i,j,k);
                else 
                    tab0(test(i,j,k)).boules(end+1)=test2(i,j,k);
                end
                p=p+1;
%                 l = 1;
%                while (l <= size(tab0,2))
%                    if (tab0(l).num==test(i,j,k))
%                        tab0(l).boules(end+1)=test2(i,j,k);
%                        l = size(tab0,2)*2;
%                    end  
%                    l = l+1;
%                end
%                if (l == size(tab0,2)+1)
%                    tab0(end+1).num=test(i,j,k);
%                    tab0(end+1).boules=[];
%                    tab0(end+1).boules(end+1)=test2(i,j,k);
%                end

            end
        end
    end
end