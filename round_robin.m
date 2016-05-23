function [R] = round_robin(beta)
param;
R=zeros(num_pico,N,num_CC,num_RBs);
for m=1:(num_pico)
    for j=1:num_CC
        get=find(beta(m,:,j)==1);
        if length(get)~=0
        g=repmat(get, 1, ceil(num_RBs/length(get)));
        for r=1:num_RBs
            
                R(m,g(r),j,r)=1;
            
        end
        end
    end
end
            
        