%nv = readmatrix("boules.txt");

image_nv  = zeros(512,512,512);
% image_res = zeros(512,512,512);
% image_val = zeros(512,512,512);
n1=1;
n3=size(tableau,1);
for t=n1:n3
    t
    r = tableau(t,4);
    x = tableau(t,1);
    y = tableau(t,2);
    z = tableau(t,3);
    X = x-r;
    
    if X <= 0 
        X = 1;
    end
    
    Y = y-r;
    
    if Y <= 0 
        Y = 1;
    end
    
    Z = z-r;
    
    if Z <= 0 
        Z = 1;
    end
   % image_centre(uint64(y),uint64(x),uint64(z))=t;
    for i = X:abs(x+r)
        for j = Y:abs(y+r)
            for k = Z:abs(z+r)
                distance = sqrt(((i-x)^2)+((j-y)^2)+((k-z)^2));
                if (distance <= r)
                    
                    image_nv(uint64(j),uint64(i),uint64(k))=t;
%                     image_res(uint64(i),uint64(j),uint64(k))=t*res;
%                     image_val(uint64(i),uint64(j),uint64(k))=r;
                end
            end
        end
    end
end