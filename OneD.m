function [Wsnew,WinMat,deadno]=OneD(n1,TotalNo,xs,Ws,eta,sigma,radius,distance,Neighbouring,beta,gamma,WinMat)

WinMat=zeros(n1,1);
freq=zeros(n1,1);
     for j=1:TotalNo % applying all training data
         dist=zeros(n1,1);  
         if(distance==1) %% if the metric is euclidean distance
            for din=1:13 % Calculating euclidean distance in 13 input dimensions
                dist=dist+(Ws(:,din)-xs(j,din)).^2;
            end
         dist=sqrt(dist);
         else %% if the metric is cosine distance
             dist=Ws*xs(j,:)';
             dist=dist/norm(xs(j,:));
             dist=dist./sqrt(sum(Ws.^2,1));
         end
         [~,index]=min(dist); % finding the minimum distance / initial winner
         z=zeros(n1,1);
         z(index)=1;
         freq=freq+beta*(z-freq);
         conscience=gamma*((1/n1)-freq);
         crit=dist-conscience;
         [~,index]=min(crit); %% finding the real conscientious winner!! :D
         WinMat(index)=WinMat(index)+1;
         %% Geometric Neighboring
         if(Neighbouring==1)
         %% Finding Neighbours
         for nn=index-radius:index+radius
             if(nn>0 && nn<=n1)
             Ws(nn,:)=(1-eta)*Ws(nn,:)+eta*xs(j,:); %% Updating Weights
             end
         end
         
         %% relative Neighbouring  
         else if(Neighbouring==6)
             %computing h(j,index)
             d=zeros(n1,1);
             for q=1:n1
                 d(q,1)=q-index;
             end
             h=exp(-((d).^2)/2*sigma);
             Ws=Ws+eta*h.*(repmat(xs(j,:),n1,1)-Ws)';
             end
         end

     end
     deadno=sum(WinMat(:)==0);
Wsnew=Ws;
end