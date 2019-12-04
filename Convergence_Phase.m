function Wsnew=Convergence_Phase(TotalNo,n1,n2,n3,MaxEpochNo2,eta0,sigma0,radius,beta,gamma,Ws,xs,k,distance,Neighbouring,WinMat)

for i=1:MaxEpochNo2
    
     %% 1-D Map
     if(k==1)
     [Ws,WinMat,deadno]=OneD(n1,TotalNo,xs,Ws,eta0,sigma0,radius,distance,Neighbouring,beta,gamma,WinMat);
     else if(k==2) %%% 2-D Map
             [Ws,WinMat,deadno]=TwoD(n1,n2,TotalNo,xs,Ws,eta0,sigma0,radius,distance,Neighbouring,beta,gamma,WinMat);
         else
             %%% 3-D Map
              [Ws,WinMat,deadno]=ThreeD(n1,n2,n3,TotalNo,xs,Ws,eta0,sigma0,radius,distance,Neighbouring,beta,gamma,WinMat);
         end
     end
end
Wsnew=Ws;
end