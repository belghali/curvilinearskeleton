% val=zeros(6802,4);
% for i =1:size(tab2,2)
%     val(i,1)=tab2(i).numero;
%     val(i,2)=tab2(i).moy;
%     val(i,3)=tab2(i).vari;
%     val(i,4)=tab2(i).ecart;
% 
% end
% writematrix(val,"ouverture.txt");
% % for i =1:size(tab3,2)
% 
%     ok = tab_brut(18509).boules;
%     for j = 1:size(ok,2)
%         ok(j)=nv(ok(j),4);
% 
%     end
%     tab4(1).num=tab_brut(18509).num;
%     tab4(1).rayons=ok;
%     tab4(1).moy=mean(ok);
%     tab4(1).vari=var(ok);
%     tab4(1).ecart=std(ok);
%     
% 
% % end
% 
% % 
% for i =1:size(tab0,2)
% 
%     ok = tab0(i).boules;
%     i
%     for j = 1:size(ok,2)
%         k=j+1;
%         j
%         while (k<=size(ok,2))
%             k
%             if (ok(j)==ok(k))
%                 ok(k)=[];
%             end
% 
%             k=k+1;
%         end
%     end
%     tab0(i).boules=ok;
% 
%    
% end
% % % % 
% 


% for i =1:size(tab1,2)
%      %tab0(i).numero=tab0(i).numero(1);
%     j=i+1;
%     while (j ~= i+20)
%         i
%         j
%         if (tab1(i).numero==tab1(j).numero)
%             ok=cat(2,tab1(i).boules,tab1(j).boules);
%             tab1(i).boules=ok;
%             tab1(j)=[];
%         end
%         j = j+1;
%     end
% end


for i =2:size(tab_nul,1)
    j=i+1;
    while (j ~= i+20)
        i
        j
        if (tab_nul(i)==tab_nul(j))
            tab_nul(j)=[];
        end
        j = j+1;
    end
end



% % for i =1:size(tab1,2)
%     i
%     if (isempty(tab1(i).boules))
%         tab1(i)=[];
%     end
%     if (tab1(i).numero == 0)
%         tab1(i)=[];
%     end
% 
% end
% % % 
% % for i =1:size(tab0,2)
% %     i
% %     if (tab0(i).numero == 0)
% %         tab0(i)=[];
% %     end
% % 
% % end
