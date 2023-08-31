% for i =1:size(new,2)
% 
%     ok = new(i).tab(:,1);
%     i
%     for j = 1:size(ok,1)
%         ok(j)=nv(ok(j),4);
% 
%     end
%     new2(i).region=new(i).num;
%     new2(i).rayons=ok;
%     new2(i).moy=mean(ok);
%     new2(i).vari=var(ok);
%     new2(i).ecart=std(ok);
%     
% 
% end
% 
for i =1:12137
    wex(i,1) = new2(i).region;
    wex(i,2) = new2(i).moy;
    wex(i,3) = new2(i).vari;
    wex(i,4) = new2(i).ecart;
    
end