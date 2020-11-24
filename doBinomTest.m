function  doBinomTest(x,filter,chance) 
%doBinomTest(x,filter,chance,makePlot)
%calculate binomial cut off for chance success
%where x is a column vector of binary values;
%filter is appled to x;
%chance sets threshold



numSubj  = sum(filter);
range=[floor(numSubj/2) : numSubj];
binpdf=pdf('Binomial',range,numSubj,chance); 
[vals,inds]=find(binpdf<.05);
cutOff=range(min(inds));

numPass = sum(x(filter));
pInd = range==numPass ;
p=pdf('Binomial',numPass,numSubj,chance);


fprintf('\n Binomial test with %d passing, %d needed, p = %.3f \n',numPass,cutOff,p);

end