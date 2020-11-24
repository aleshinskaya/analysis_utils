function p = doTTest(x,y,filter,description,tails)
%doTTEST(x,y,filter,dscription, tails): must supply COLUMN VECTORS
%x will be filtered by filter
%if y is a single value, x will be compared to mean  = y
%if y is a vector, it will also be filtered by filter
%this functions handles nans

isPaired = length(y)>1;

if(isPaired) 
    
    %same filter applied to both column vectors
    filter = filter &  ~isnan(x) & ~isnan(y);
    [h,p,c,stats]=ttest(x(filter),y(filter),.05,tails);
    meanX= mean(x(filter)-y(filter));
    
else   
    filter = filter & ~isnan(x);
    [h,p,c,stats]=ttest(x(filter),y,.05,tails);   
    meanX = mean(x(filter));
end


fprintf('\n     %s: M = %.2f, t(%d) = %.2f, p = %.5f\n',description,meanX,stats.df,stats.tstat,p)

end