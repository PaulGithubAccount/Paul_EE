function [rho]=RB_alloc(alpha,beta1,R,BS_rank, CC_rank,beta,c)
param;
rho=zeros(num_pico,N,num_CC,num_RBs); %follow the rho equation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% phase 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rhocheck=zeros(num_pico*num_CC,num_RBs);
for m=1:num_pico
        for j=1:num_CC
            if sum(beta1(m,:,j))==1
                k=find(beta1(m,:,j)==1);
                [maxVal maxInd]=max(R(m,k,j,:));
                rho(m,k,j,maxInd)=1;
                rhocheck((m-1)*num_CC+j,maxInd)=1;
            elseif sum(beta1(m,:,j))>1
                    k=find(beta1(m,:,j)==1);
                    zz=length(k);
                    cc=zeros(1,zz);
                    for z=1:zz
                       cc(z)=sum(R(m,k(z),j,:));
                    end
                    for z=1:zz
                        [maxVal maxInd]=max(cc);
                        rhos=find(rhocheck((m-1)*num_CC+j,:)==0);
                        [maxVal maxIn]=max(R(m,k(maxInd),j,rhos));
                       
                            rhocheck((m-1)*num_CC+j,rhos(maxIn))=1;       
                            rho(m,k(maxInd),j,rhos(maxIn))=1;
                            cc(maxInd)=0;

                    end
            end
        end
end
c_UE=sum(alpha.*sum(beta1.*sum(rho.*c,4),3),1);
%disp (c_UE);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% phase 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while(~isempty(find(c_UE<QoS)))
    
    [minVal,minInd]=min(c_UE);
    if sum(rhocheck((BS_rank(minInd)-1)*num_CC+CC_rank(minInd),:))==50
       disp error!!;
       c_UE(minInd)=QoS;
        continue;
    end
   
   rhos=find(rhocheck((BS_rank(minInd)-1)*num_CC+CC_rank(minInd),:)==0);
    [maxVal,maxInd]=max(R(BS_rank(minInd),minInd,CC_rank(minInd),rhos));
    
    rho(BS_rank(minInd),minInd,CC_rank(minInd),rhos(maxInd))=1;
    
        
        
              rhocheck((BS_rank(minInd)-1)*num_CC+CC_rank(minInd),rhos(maxInd))=1; 

    c_UE=sum(alpha.*sum(beta1.*sum(rho.*c,4),3),1);
 %   disp good;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% phase 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for m=1:num_pico
        for j=1:num_CC
            k=find(beta(m,:,j)==1);
            
               rhos=find(rhocheck((m-1)*num_CC+j,:)==0);
                if length(rhos)~=0

                    for zz=1:length(rhos)
                        [maxVal maxIn]=max(R(m,k,j,rhos(zz)));
                       
                            rhocheck((m-1)*num_CC+j,rhos(zz))=1;       
                            rho(m,k(maxIn),j,rhos(zz))=1;
                    end
                    
                  
                end
        end
end





end