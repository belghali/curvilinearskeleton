
taille = size(imgg_nv,3);
for i = 1:taille
    sprintf("plan numero : %d",i);
%     planx = occur(imgg(i,:,:),1);
%     planx = planx(:,1);
%     writematrix(planx,sprintf('x_18508_%d.txt',i),'Delimiter',' ');
%     plany = occur(imgg(:,i,:),1);
%     plany = plany(:,1);
%     writematrix(plany,sprintf('y_18508_%d.txt',i),'Delimiter',' ');
    planz = occur(imgg_nv(:,:,i),1);
    planz = planz(:,1);
    writematrix(planz,sprintf('valerie_nv_z_%d.txt',i),'Delimiter',' ');
end
