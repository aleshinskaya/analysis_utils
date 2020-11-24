function SE = calcEntropy(M)

SE = 0;
for i=1:length(M)
    if(M(i)~=0)
        SE = SE+((M(i)*log2(M(i))));
    end
end

SE=-SE;