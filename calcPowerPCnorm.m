function [pMatrix,dMatrix] =  calcPowerPCnorm(tMat)
%pMat, dMat = calcPowerPCnorm(tMat)
[nrow,ncol]=size(tMat);
pMatrix = zeros(nrow,ncol);
dMatrix = zeros(nrow,ncol);

steadyState = tMat^500;


for c=1:nrow
    
    
    for e=1:ncol

                %p(e|c)

                p_ec = tMat(c,e);
                
                %sum all other p_ec--get JOINT prob first
                %then divide by joint of all ~c 
                % so we do p(e & ~c)/p(~c)
                
                not_c = [1:ncol];
                not_c(c) = [];
                
                
                %to get joint, we do p(~c)*p(e|~c)
                % p(~c) is steady state matrix  ie baserate
                % sum for all c
                p_e_and_notc = [];
                p_notc_total = [];
                
                for nc=1:length(not_c)
                    
                    cur_c = not_c(nc);                    
                    p_notc = steadyState(1,cur_c);
                    p_e_given_notc = tMat(cur_c,e);
                    p_e_and_notc(nc) = p_notc*p_e_given_notc;                    
                    p_notc_total(nc) = p_notc;
                    
                    
                end

                
               p_e_and_notc_all = sum(p_e_and_notc);               
               p_notc_all = sum(p_notc_total);
               
               p_e_given_notc = p_e_and_notc_all/p_notc_all;
             %  fprintf('\np e|notc for row, col: %d, %d : %.3f' ,c,e, p_e_given_notc)
%                power =  (p_ec - p_e_given_notc)/(1-p_e_given_notc);
                power =  p_ec - sum(p_e_and_notc)/(1-sum(p_e_and_notc));
               pMatrix(c,e) = power;
               
%               dMatrix(c,e) = p_ec - sum(p_e_and_notc);
              dMatrix(c,e) = p_ec - p_e_given_notc;
    end



end