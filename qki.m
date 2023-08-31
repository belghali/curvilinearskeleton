% ss=uint16(squel);
% for i = 1:512
%     for j = 1:512
%          for k = 1:512
%             if (bb(i,j,k)==0)% && imagee(i,j,k)~=100000  && imagee(i,j,k)~=200000)
%                 ss(i,j,k)=0;
%             end
%          end
%      end
% end
sss=newp0;
boo=0;
for p = 1:512
    if (boo==1)
        sss(p,1,1)=1;
        sss(p,1,512)=1;
        sss(p,512,1)=1;
        sss(p,512,512)=1;
        sss(1,p,1)=1;
        sss(1,p,512)=1;
        sss(512,p,1)=1;
        sss(512,p,512)=1;
        sss(512,1,p)=1;
        sss(512,512,p)=1;
        sss(1,1,p)=1;
        sss(1,512,p)=1;
    else
        sss(p,1,1)=65535;
        sss(p,1,512)=65535;
        sss(p,512,1)=65535;
        sss(p,512,512)=65535;
        sss(1,p,1)=65535;
        sss(1,p,512)=65535;
        sss(512,p,1)=65535;
        sss(512,p,512)=65535;
        sss(512,1,p)=65535;
        sss(512,512,p)=65535;
        sss(1,1,p)=65535;
        sss(1,512,p)=65535;
    end

end
% for i = 1:512
%     for j = 1:512
%          for k = 1:512
%              if (imgg(i,j,k)~=0 && squel(i,j,k)~=0)
%                  nveau(i,j,k)=imgg(i,j,k);
%              end
%          end
%     end
% end