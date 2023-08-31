nv = readmatrix("boules_min.txt");

image_centre = zeros(512,512,512);

n1=1;
n3=size(nv,1);
for t=n1:n3
    t
    r = nv(t,4);
    x = nv(t,1);
    y = nv(t,2);
    z = nv(t,3);
    X1 = uint64(x-3);
    Y1 = uint64(y-3);
    Z1 = uint64(z-3);
    X2 = uint64(x+3);
    Y2 = uint64(y+3);
    Z2 = uint64(z+3);



%     for i = X1:X2
%         for j = Y1:Y2
%             for k = Z1:Z2
%                 distance = sqrt(((i-x)^2)+((j-y)^2)+((k-z)^2));
%                 if (distance <= r)
                    image_centre(uint64(x),uint64(y),uint64(z))=r;
%                    
%                 end
%             end
%         end
%     end
end