function [Wsnew,WinMat,deadno]=ThreeD(n1,n2,n3,TotalNo,xs,Ws,eta,sigma,radius,distance,Neighbouring,beta,gamma,WinMat)


NeuronNo=n1*n2*n3;
freq=zeros(n1,n2,n3);
WinMat=zeros(n1,n2,n3);
for j=1:TotalNo % applying all training data
         dist=zeros(n1,n2,n3);  
         %% Computing Distance
         if(distance==1) %% if the metric is euclidean distance
            for din=1:13 % Calculating euclidean distance in 13 input dimensions
                dist=dist+(Ws(:,:,:,din)-xs(j,din)).^2;
            end
         dist=sqrt(dist);
         else %% if the metric is cosine distance
             dist=zeros(n1,n2,n3);
             for l=1:n1
                 for o=1:n2
                    temp=Ws(l,o,:,:)*xs(j,:)';
                    temp=temp/norm(xs(j,:));
                    temp=temp./sqrt(sum(Ws(l,o,:,:).^2,1));
                    dist(l,o,:)=temp;
                 end
             end
         end
         %% Determining the Winner
         [~,index]=min(dist(:)); % finding the minimum distance / initial winner
         indexk=ceil(index/(n1*n2));
         index2=mod(index,(n1*n2));
         if(index2==0)
            indexi=n1;
            indexj=n2;
         else
         indexi=mod(index2,n1);
         indexj=ceil(index2/n1);
         if(indexi==0)
             indexi=n1;
         end
         end
         z=zeros(n1,n2,n3);
         z(indexi,indexj,indexk)=1;
         freq=freq+beta*(z-freq);
         conscience=gamma*((1/NeuronNo)-freq);
         crit=dist-conscience;
         [~,index]=min(crit(:)); %% finding the real conscientious winner!! :D
         indexk=ceil(index/(n1*n2));
         index2=mod(index,(n1*n2));
         if(index2==0)
            indexi=n1;
            indexj=n2;
         else
         indexi=mod(index2,n1);
         indexj=ceil(index2/n1);
         if(indexi==0)
             indexi=n1;
         end
         end
         WinMat(indexi,indexj,indexk)=WinMat(indexi,indexj,indexk)+1;
         %% Geometric Neighboring
         %neighbors=[];
         switch Neighbouring
             case 5 % Radial/Cube
                 neighbors=CubeNeighborhood([indexi,indexj,indexk],n1,n2,n3,radius);
                 for nn=1:size(neighbors,1)
                     temp=reshape(Ws(neighbors(nn,1),neighbors(nn,2),neighbors(nn,2),:),1,13);
                     temp=(1-eta)*temp+eta*xs(j,:);
                     Ws(neighbors(nn,1),neighbors(nn,2),neighbors(nn,2),:)=reshape(temp,1,1,1,13);
                     %Ws(neighbors(nn,1),neighbors(nn,2),:)=(1-eta)*Ws(neighbors(nn,1),neighbors(nn,2),:)+eta*xs(j,:); %% Updating Weights
                 end
             case 6
             %% Relative Neighboring
             % computing h(j,index)
             d=zeros(n1,n2,n3);
             for q1=1:n1
                 for q2=1:n2
                     for q3=1:n3
                        d(q1,q2,q3)=sqrt((q1-indexi)^2+(q2-indexj)^2+(q3-indexk)^2);
                     end
                 end
             end
             h=exp(-((d).^2)/2*sigma);
             Ws=Ws+eta*repmat(h,1,1,1,13).*(repmat(reshape(xs(j,:),1,1,1,13),n1,n2,n3)-Ws);
         end
            

end


deadno=sum(WinMat(:)==0);
Wsnew=Ws;
end