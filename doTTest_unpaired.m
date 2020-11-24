function doTTest_unpaired(x,y,xFilter,yFilter, description,tails)
%doTTEST(x,y,xfilter,yfilter,,text,tails): must supply COLUMN VECTORS
%x will be filtered by xFilter; y by yFilter
% two-sample ttest will be applied to test x vs y after filter applied

    xFilter = xFilter & ~isnan(x);    
    yFilter = yFilter & ~isnan(y);
    [h,p,c,stats]=ttest2(x(xFilter),y(yFilter),.05,tails);   
    meanDiff = mean(x(xFilter)) - mean(y(yFilter));


fprintf('\n     %s: M = %.2f, t(%d) = %.2f, p = %.5f\n',description,meanDiff,stats.df,stats.tstat,p)

end