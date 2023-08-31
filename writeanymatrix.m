% create a sparse matrix
 A = vv20;

% open a file for writing
fid = fopen("valerie_surface_nv.txt", 'w');

% get the size of the matrix
 [m, n] = size(A);
%  for i = 1:m
%     A(i,i)=0;
%     for j = i+1:m
%         A(i,j)=0;
%     end
%  end
% loop through the matrix and write non-zero elements to the file
 z=1;
for i = 1:m
    for j = 1:i
        if A(i,j) ~= 0
            i
            
            
           fprintf(fid, '%d %d %d\n', i, j, A(i,j));
%             nvv(z,1)=i;
%             nvv(z,2)=j;
%             nvv(z,3)=A(i,j);
%             z=z+1;
        end
    end
end
% writematrix(nvv,"sable_high_surface_new.txt", "Delimiter"," ");

% close the file
fclose(fid);