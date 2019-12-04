function [Wsnew,WinMat,TheDead,clusters]=Ordering_Phase(TotalNo,n1,n2,n3,MaxEpochNo,eta0,sigma0,radius,T1,T2,beta,gamma,Ws,xs,k,distance,Neighbouring,handles)
r=radius;
clusters=zeros(MaxEpochNo,1);
TheDead=zeros(MaxEpochNo,1);
 for i=1:MaxEpochNo
     if(k==1)
         WinMat=zeros(n1,1);
     elseif(k==2)
             WinMat=zeros(n1,n2);
     else
         WinMat=zeros(n1,n2,n3);
     end
     %% Updating Learnng and Neighbourhood Parameters
     eta=eta0/exp(-i/T2);
     sigma=sigma0/exp(-i/T1);
     r=r-r/MaxEpochNo;
     radius=ceil(r);
     %% 1-D Map
     if(k==1)
         %WinMat=zeros(n1,1);
     [Ws,WinMat,deadno]=OneD(n1,TotalNo,xs,Ws,eta,sigma,radius,distance,Neighbouring,beta,gamma);
     %%% 2-D Map
     elseif(k==2)
              %WinMat=zeros(n1,n2);
             [Ws,WinMat,deadno]=TwoD(n1,n2,TotalNo,xs,Ws,eta,sigma,radius,distance,Neighbouring,beta,gamma,WinMat);
         else
             %%% 3-D Map
             %WinMat=zeros(n1,n2,n3);
             [Ws,WinMat,deadno]=ThreeD(n1,n2,n3,TotalNo,xs,Ws,eta,sigma,radius,distance,Neighbouring,beta,gamma);
     end
     TheDead(i)=deadno;
     %% U-Matrix
if(k==1)
    UMat=UMatOneD(Ws,n1,distance);
elseif(k==2)
       UMat= UMatTwoD(Ws,n1,n2,distance,Neighbouring);

end
axes(handles.LPlot);
colormap('hot');
        %         figure;
        imagesc(UMat);
        title(strcat('UMatrix- ',int2str(k),'-D'));
        drawnow;
        %hold
        if(k==2)
            y=ones(n1,n2);
            x=1:2:2*n2-1;
        for ii=1:n1
        y(ii,:)=2*ii-1;
        scatter(x,y(ii,:),'s','filled');
        end
        elseif(k==1)
                x=ones(1,n1);
                y=1:2:2*n1-1;
                scatter(x,y,'s','filled');

        end
        %%
        if(k==1)
    
% centroids=findpeaks(UMat);
%numOfcluster = size(findpeaks(UMat),2)
        [v,l]=findpeaks(UMat);
        numOfcluster=size(l,2);
 
        elseif(k==2) %% 2-D Map
       
        hLocalMax = vision.LocalMaximaFinder;
        hLocalMax.MaximumNumLocalMaxima = 20;
        hLocalMax.NeighborhoodSize = [n1 n2];%[nei nei];
        hLocalMax.Threshold = 0.1;
        
        numOfcluster= size(step(hLocalMax, UMat),1);

        end
        %%
clusters(i)=numOfcluster;
 end
Wsnew=Ws;
end