% t0 = readmatrix("boules.txt");
% nv = zeros(size(t0,1),5);
% nv(:,1:4)=t0;
% format long
% for i = 1:size(t0,1)
%     nv(i,5)=4/3 * pi * t0(i,4);
% end
% 

somme = 0;
i=1;
%nvtab20 = zeros(size(tab));
while ( somme <=max_volume)
    x100(i,:)=nvtab100(i,:);
    i
    somme = sum(x100(:,5));
    (somme/max_volume)*100
    i = i+1;

end

% 
% for i = 1:18508
%     tab(i,5)=(4*pi*power(tab(i,2),3))/3;
% 
% 
% end