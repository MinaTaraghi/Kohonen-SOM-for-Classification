function UMat=UMatTwoD(Ws,n1,n2,dist,Neighboring)

UMat=zeros(n1*2-1,n2*2-1);
if(dist==1) %%n Euclidean
    switch Neighboring
        %% Radial Map
        case 2
            %% Horizontal edges
            for i=1:n1
                for j=1:n2-1
                    dist=0;
                    for din=1:13 % Calculating euclidean distance in 13 input dimensions
                        dist=dist+(Ws(i,j,din)-Ws(i,j+1,din))^2;
                    end
                    UMat(i*2-1,j*2)=sqrt(dist);
                end
            end
            %% Vertical Edges
            for i=1:n1-1
                for j=1:n2
                    dist=0;
                    for din=1:13 % Calculating euclidean distance in 13 input dimensions
                        dist=dist+(Ws(i,j,din)-Ws(i+1,j,din))^2;
                    end
                    UMat(i*2,j*2-1)=sqrt(dist);
                end
            end 
            %% average cells
            for i=2:n1-1
                for j=2:n2-1
                    UMat(2*i-1,2*j-1)=(UMat(2*i-2,2*j-1)+UMat(2*i,2*j-1)+UMat(2*i-1,2*j-2)+UMat(2*i-1,2*j))/4;
                end
            end
            %% first and last rows and columns
            for i=2:n1-1
                UMat(2*i-1,1)=(UMat(2*i-2,1)+UMat(2*i-1,2)+UMat(2*i,1))/3;
                UMat(2*i-1,2*n2-1)=(UMat(2*i-2,2*n2-1)+UMat(2*i-1,2*n2-2)+UMat(2*i,2*n2-1))/3;
            end
            for i=2:n2-1
                UMat(1,2*i-1)=(UMat(1,2*i-2)+UMat(2,2*i-1)+UMat(1,2*i))/3;
                UMat(2*n1-1,2*i-1)=(UMat(2*n1-1,2*i-2)+UMat(2*n1-2,2*i-1)+UMat(2*n1-1,2*i))/3;
            end
            %% corners of map
            UMat(1,1)=(UMat(1,2)+UMat(2,1))/2;
            UMat(1,end)=(UMat(1,end-1)+UMat(2,end))/2;
            UMat(end,1)=(UMat(end-1,1)+UMat(end,2))/2;
            UMat(end,end)=(UMat(end-1,end)+UMat(end,end-1))/2;
            %% excess 
           for i=1:n1-1
                for j=1:n2-1
                    UMat(2*i,2*j)=(UMat(2*i-1,2*j)+UMat(2*i+1,2*j)+UMat(2*i,2*j-1)+UMat(2*i,2*j+1))/4;
                end
            end            
            %% Hexagonal Map
        case 4
            %% Horizontal edges
            for i=1:n1
                for j=1:n2-1
                    dist=0;
                    for din=1:13 % Calculating euclidean distance in 13 input dimensions
                        dist=dist+(Ws(i,j,din)-Ws(i,j+1,din))^2;
                    end
                    UMat(i*2-1,j*2)=sqrt(dist);
                end
            end
            %% Vertical Edges
            for i=1:n1-1
                for j=1:n2
                    dist=0;
                    for din=1:13 % Calculating euclidean distance in 13 input dimensions
                        dist=dist+(Ws(i,j,din)-Ws(i+1,j,din))^2;
                    end
                    UMat(i*2,j*2-1)=sqrt(dist);
                end
            end 
            %% Diagonal cells
            for i=1:n1-1
                for j=1:n2-1
                    dist=0;
                    if(mod(i,2)==0) %% negative slope
                        for din=1:13 % Calculating euclidean distance in 13 input dimensions
                            dist=dist+(Ws(i,j,din)-Ws(i+1,j+1,din))^2;
                        end
                        UMat(2*i,2*j)=sqrt(dist);
                    else %% positive slope
                        for din=1:13 % Calculating euclidean distance in 13 input dimensions
                            dist=dist+(Ws(i,j+1,din)-Ws(i+1,j,din))^2;
                        end
                        UMat(2*i,2*j)=sqrt(dist);
                    end
                end
            end
             %% average cells
            for i=2:n1-1
                for j=2:n2-1
                    UMat(2*i-1,2*j-1)=(UMat(2*i-2,2*j-1)+UMat(2*i,2*j-1)+UMat(2*i-1,2*j-2)+UMat(2*i-1,2*j))/4;
                end
            end
            %% first and last rows and columns
            for i=2:n1-1
                UMat(2*i-1,1)=(UMat(2*i-2,1)+UMat(2*i-1,2)+UMat(2*i,1))/3;
                UMat(2*i-1,2*n2-1)=(UMat(2*i-2,2*n2-1)+UMat(2*i-1,2*n2-2)+UMat(2*i,2*n2-1))/3;
            end
            for i=2:n2-1
                UMat(1,2*i-1)=(UMat(1,2*i-2)+UMat(2,2*i-1)+UMat(1,2*i))/3;
                UMat(2*n1-1,2*i-1)=(UMat(2*n1-1,2*i-2)+UMat(2*n1-2,2*i-1)+UMat(2*n1-1,2*i))/3;
            end
            %% corners of map
            UMat(1,1)=(UMat(1,2)+UMat(2,1))/2;
            UMat(1,end)=(UMat(1,end-1)+UMat(2,end))/2;
            UMat(end,1)=(UMat(end-1,1)+UMat(end,2))/2;
            UMat(end,end)=(UMat(end-1,end)+UMat(end,end-1))/2;
        otherwise
    end
else %% Cosine

end
% for i=3:2:(n1*2)-3
%    UMat(i)=0;
% end
% UMat(1)=UMat(2);
% UMat(end)=UMat(end-1);
end