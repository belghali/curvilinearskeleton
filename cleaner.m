% for i =1:size(tab3,2)
% 
%     ok = tab3(i).boules;
%     i
%     for j = 1:size(ok,2)
%         k=j+1;
%         
%         while (k<=size(ok,2))
%             
%             if (ok(j)==0)
%                 ok(k)=[];
%             end
% 
%             k=k+1;
%         end
%     end
%     tab3(i).boules=ok;
% 
%    end

for i = 1:size(tab3,2)
    ok = tab3(i).boules;
    for j=1:size(ok,2)
        if(ok(j)==0)
            ok(j)=[];
        end
    end
    tab3(i).boules=ok;


end




% end
% % tab2(1)=0;
% for i = 1:size(tab3,2)
%     if (tab3(i).boules==0)
%         tab3(i)=[];
%     end
% 
% 
% end