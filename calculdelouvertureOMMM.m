chaine=squel;
boules=image_nv;
z=1;
p=10;

for i = 1:512
    for j = 1:512
        for k = 1:512
            
            if (chaine(i,j,k)~=0)
                z
                num=[];
                ok=[];
                X1 = (i-p);
                Y1 = (j-p);
                Z1 = (k-p);
                X2 = (i+p);
                Y2 = (j+p);
                Z2 = (k+p);
                if (X1 <= 0)
                    X1 = 1;
                end
                if (Y1 <= 0)
                    Y1 = 1;
                end
                if (Z1 <= 0) 
                    Z1 = 1;
                end
                %%%%%%%%%%%%%%
                
                if (X2 >= 512)
                    X2 = 512;
                end
                if (Y2 >= 512)
                    Y2 = 512;
                end
                if (Z2 >= 512) 
                    Z2 = 512;
                end
                for l = X1 : X2
                    for m = Y1 : Y2
                        for n = Z1 : Z2
                            if (boules(l,m,n)~=0)
                                ok(end+1) = boules(l,m,n); 
                                num = imgg(l,m,n);
                                
                            end
                        end
                    end
                end
                tab1(z).numero=num;
                tab1(z).boules=ok;
                z=z+1;
                
            end



        end
    end
end