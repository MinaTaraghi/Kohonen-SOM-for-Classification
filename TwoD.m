function [Wsnew,WinMat,deadno]=TwoD(n1,n2,TotalNo,xs,Ws,eta,sigma,radius,distance,Neighbouring,beta,gamma,WinMat)

NeuronNo=n1*n2;
WinMat2=zeros(n1,n2);
freq=zeros(n1,n2);

     for j=1:TotalNo % applying all training data
         dist=zeros(n1,n2);  
         %% Computing Distance
         if(distance==1) %% if the metric is euclidean distance
            for din=1:13 % Calculating euclidean distance in 13 input dimensions
                dist=dist+(Ws(:,:,din)-xs(j,din)).^2;
            end
         dist=sqrt(dist);
         else %% if the metric is cosine distance
             dist=zeros(n1,n2);
             for l=1:n1
             temp=reshape(Ws(l,:,:),n2,13)*xs(j,:)';
             temp=temp/norm(xs(j,:));
             temp=temp./sqrt(sum(reshape(Ws(l,:,:),n2,13).^2,2));
             dist(l,:)=temp';
             end
         end
         %% Determining the Winner
         [~,index]=min(dist(:)); % finding the minimum distance / initial winner
         indexi=mod(index,n1);
         indexj=ceil(index/n1);
         if(indexi==0)
             indexi=n1;
         end
         z=zeros(n1,n2);
         z(indexi,indexj)=1;
         freq=freq+beta*(z-freq);
         conscience=gamma*((1/NeuronNo)-freq);
         crit=dist-conscience;
         [~,index]=min(crit(:)); %% finding the real conscientious winner!! :D
         indexi=mod(index,n1);
         indexj=ceil(index/n1);
         if(indexi==0)
             indexi=n1;
         end
         WinMat2(indexi,indexj)=WinMat2(indexi,indexj)+1;
         %% Geometric Neighboring
         %neighbors=[];
         switch Neighbouring
             case 2 % Radial
                 neighbors=RadiusNeighborhood([indexi,indexj],n1,n2,radius);
                 for nn=1:size(neighbors,1)
                     temp=reshape(Ws(neighbors(nn,1),neighbors(nn,2),:),1,13);
                     temp=(1-eta)*temp+eta*xs(j,:);
                     Ws(neighbors(nn,1),neighbors(nn,2),:)=reshape(temp,1,1,13);
                     %Ws(neighbors(nn,1),neighbors(nn,2),:)=(1-eta)*Ws(neighbors(nn,1),neighbors(nn,2),:)+eta*xs(j,:); %% Updating Weights
                 end
             case 3 % Rectangular
                 neighbors=RectangularNeighborhood([indexi,indexj],n1,n2,radius);
                 for nn=1:size(neighbors,1)
                     temp=reshape(Ws(neighbors(nn,1),neighbors(nn,2),:),1,13);
                     temp=(1-eta)*temp+eta*xs(j,:);
                     Ws(neighbors(nn,1),neighbors(nn,2),:)=reshape(temp,1,1,13);
                 end
             case 4 % Hexagonal
                 neighbors=HexagonNeighborhood([indexi,indexj],n1,n2,radius);
                 for nn=1:size(neighbors,1)
                     temp=reshape(Ws(neighbors(nn,1),neighbors(nn,2),:),1,13);
                     temp=(1-eta)*temp+eta*xs(j,:);
                     Ws(neighbors(nn,1),neighbors(nn,2),:)=reshape(temp,1,1,13);
                 end
             case 6
             %% RElative Neighboring
             % computing h(j,index)
             d=zeros(n1,n2);
             for q1=1:n1
                 for q2=1:n2
                 d(q1,q2)=sqrt((q1-indexi)^2+(q2-indexj)^2);
                 end
             end
             h=exp(-((d).^2)/2*sigma);
             Ws=Ws+eta*repmat(h,1,1,13).*(repmat(reshape(xs(j,:),1,1,13),n1,n2)-Ws);
         end
            
WinMat=WinMat+WinMat2;
     end
deadno=sum(WinMat2(:)==0);

Wsnew=Ws;
end