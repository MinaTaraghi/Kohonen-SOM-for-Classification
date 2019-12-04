function UMat=UMatOneD(Ws,n1,dist)

UMat=zeros(n1*2-1,1);
if(dist==1) %%n Euclidean
    for i=2:2:(n1-1)*2
        %%UMat(i)=Ws(i/2)-Ws(i/2+1);
        for din=1:13 % Calculating euclidean distance in 13 input dimensions
                dist=dist+(Ws(i/2,din)-Ws(i/2+1,din))^2;
        end
        UMat(i)=sqrt(dist);
    end
else %% Cosine
    for i=2:2:(n1-1)*2
    %%UMat(i)=Ws(i/2)-Ws(i/2+1);
    c=(Ws(i/2,:)*Ws(i/2+1)')/(norm(Ws(i/2,:))*norm(Ws(i/2+1,:)));
    UMat(i)=1-c;
    end
end
for i=3:2:(n1*2)-3
   UMat(i)=(UMat(i-1)+UMat(i+1))/2;
%    UMat(i)=0;
end
UMat(1)=UMat(2);
UMat(end)=UMat(end-1);
end