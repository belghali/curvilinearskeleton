function lab = lab_squel(id,lien)
    s = size(id);
    lab = zeros(s);
for i = 1 : s(1)                                                         %%
    for j = 1 : s(2)                                                     %%
        for k = 1 : s(3)                                                 %%
% Si le voxel est différent de , on entre dans la condition.             %%
             if (id(i,j,k) ~= 0) 
                 lab(i,j,k)= lien(id(i,j,k));
             end
        end
    end
end